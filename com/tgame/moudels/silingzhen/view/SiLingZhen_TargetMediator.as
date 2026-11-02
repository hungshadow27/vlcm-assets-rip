package com.tgame.moudels.silingzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.silingzhen.SiLingZhenResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.silingzhen.model.SiLingZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class SiLingZhen_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "SiLingZhen_TargetMediator";
      
      private var timerData:TimerData = null;
      
      private var loaderBuff:LoadBuffer = null;
      
      private var bUpgreadePanelClosed:Boolean = true;
      
      public var _arrCurrent:Array = [[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
      
      private var _msgSenderProxy:SiLingZhen_MsgSenderProxy;
      
      private var bUpdating:Boolean = false;
      
      private var key:int = 1;
      
      public function SiLingZhen_TargetMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : SiLingZhen_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(SiLingZhen_MsgSenderProxy.NAME) as SiLingZhen_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get targetCharArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.addEventListener(Event.ADDED_TO_STAGE,onShowSiLingZhenPanel);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GETSILINGZHEN,siLingZhenPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.removeEventListener(Event.ADDED_TO_STAGE,onShowSiLingZhenPanel);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GETSILINGZHEN,siLingZhenPanelHandel);
         });
      }
      
      private function siLingZhenPanelHandel(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         var _loc4_:int = 0;
         switch(_loc2_)
         {
            case TargetAttribute.GETSILINGZHEN:
               if(GameInstance.lookPlayerData.attributeInfo.lv < 70)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，只有70级以上玩家才可以获得阵法");
                  NoticeManager.notify(NoticeManager.FOOT,"很抱歉，只有70级以上玩家才可以获得阵法");
                  this.targetCharArrtibutePlane.tabBar.recoverBtnState();
                  return;
               }
               this.msgSenderProxy.send_53405(GameInstance.lookPlayerID);
               this.targetCharArrtibutePlane.showSiLingZhen();
         }
      }
      
      public function updateSiLingZhenPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean) : void
      {
         var _loc11_:Object = null;
         this.targetCharArrtibutePlane.set_HDZB(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         var _loc8_:Array = new Array();
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         _loc9_ = 1;
         while(_loc9_ <= this._arrCurrent.length)
         {
            _loc11_ = {};
            _loc11_.zhenFaName = SiLingZhenResManager.getSiLingZhenData(_loc9_,0).zhenFaName;
            _loc11_.status = this._arrCurrent[_loc9_ - 1][0];
            _loc11_.type = _loc9_;
            _loc10_ = 0;
            while(_loc10_ <= 10)
            {
               _loc11_["lv" + _loc10_] = SiLingZhenResManager.getSiLingZhenData(_loc9_,_loc10_);
               _loc10_++;
            }
            _loc8_[_loc9_ - 1] = _loc11_;
            _loc9_++;
         }
         this.targetCharArrtibutePlane.setSiLingZhenData(_loc8_,param5);
         this.targetCharArrtibutePlane.setSiLingZhenBuffAvatar(param1);
         this.targetCharArrtibutePlane.setZhenyan(param2,param3,param4);
         this.targetCharArrtibutePlane.setSiLingZhenEnabledFun();
         this.targetCharArrtibutePlane.setQiankunzhu(param6);
         this.targetCharArrtibutePlane.setSiLingZhenJiHuo(GameState.dictTargetStatus[41616]);
         this.targetCharArrtibutePlane.setBaolongshou(param7);
      }
      
      private function onShowSiLingZhenPanel(param1:Event) : void
      {
         this.msgSenderProxy.send_53405(GameInstance.lookPlayerID);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff != null)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
   }
}

