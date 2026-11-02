package com.tgame.moudels.silingzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.silingzhen.SiLingZhenResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.silingzhen.SiLingZhen_ApplicationFacade;
   import com.tgame.moudels.silingzhen.model.SiLingZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class SiLingZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "SiLingZhen_Mediator";
      
      private var timerData:TimerData = null;
      
      private var loaderBuff:LoadBuffer = null;
      
      private var bUpgreadePanelClosed:Boolean = true;
      
      public var _arrCurrent:Array = [[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
      
      private var _msgSenderProxy:SiLingZhen_MsgSenderProxy;
      
      private var bUpdating:Boolean = false;
      
      private var key:int = 1;
      
      public function SiLingZhen_Mediator()
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
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [SiLingZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case SiLingZhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isSiLingZhenShow())
               {
                  if(!this.bUpgreadePanelClosed)
                  {
                     this.showUpgradePanel(this.key);
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(Event.ADDED_TO_STAGE,onShowSiLingZhenPanel);
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,onCloseSiLingZhenPanel);
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETSILINGZHEN,siLingZhenPanelHandel);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SILINGZHEN_PANEL_ZHENYAN_CLICK,siLingZhenPanelHandel);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START,siLingZhenPanelHandel);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO,siLingZhenPanelHandel);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP,siLingZhenPanelHandel);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_CLOSE,siLingZhenPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.ADDED_TO_STAGE,onShowSiLingZhenPanel);
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,onCloseSiLingZhenPanel);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETSILINGZHEN,siLingZhenPanelHandel);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SILINGZHEN_PANEL_ZHENYAN_CLICK,siLingZhenPanelHandel);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START,siLingZhenPanelHandel);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO,siLingZhenPanelHandel);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP,siLingZhenPanelHandel);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_CLOSE,siLingZhenPanelHandel);
         });
      }
      
      private function siLingZhenPanelHandel(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         var _loc4_:int = 0;
         switch(_loc2_)
         {
            case CharAttribute.GETSILINGZHEN:
               if(GameInstance.mainCharData.attributeInfo.lv < 70)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有70级以上玩家才可以获得阵法"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有70级以上玩家才可以获得阵法"));
                  this.mainCharArrtibutePlane.tabBar.recoverBtnState();
                  return;
               }
               if(this.mainCharArrtibutePlane.getBiaoqianVisible(4,1) == false)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，你的阵法暂未解封"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，你的阵法暂未解封"));
                  this.mainCharArrtibutePlane.tabBar.recoverBtnState();
                  return;
               }
               this.msgSenderProxy.send_53405(-1);
               this.mainCharArrtibutePlane.showSiLingZhen();
               break;
            case CharAttribute.UI_SILINGZHEN_PANEL_ZHENYAN_CLICK:
               this.key = _loc3_.data as Number;
               this.showUpgradePanel(this.key);
               break;
            case CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START:
               this.key = _loc3_.data as Number;
               if(!this.bUpdating)
               {
                  this.msgSenderProxy.send_53401([this.key,this.mainCharArrtibutePlane.getUseGoodsType()]);
               }
               break;
            case CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO:
               this.key = _loc3_.data as Number;
               if(this.bUpdating)
               {
                  break;
               }
               this.bUpdating = true;
               if(this.timerData == null)
               {
                  this.timerData = TimerManager.createTimer(100,0,this.onTimerUpdate);
               }
               else
               {
                  this.timerData.timer.reset();
                  this.timerData.timer.start();
               }
               this.onTimerUpdate();
               break;
            case CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP:
               this.stopTimer();
               this.bUpdating = false;
               break;
            case CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_CLOSE:
               this.bUpgreadePanelClosed = true;
         }
      }
      
      public function updateSiLingZhenPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean) : void
      {
         var _loc11_:Object = null;
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
         this.mainCharArrtibutePlane.setSiLingZhenData(_loc8_,param5,this.key);
         this.mainCharArrtibutePlane.setSiLingZhenBuffAvatar(param1);
         this.mainCharArrtibutePlane.setZhenyan(param2,param3,param4);
         this.mainCharArrtibutePlane.setQiankunzhu(param6);
         this.mainCharArrtibutePlane.setSiLingZhenJiHuo(GameState.dictMainStatus[41616]);
         this.mainCharArrtibutePlane.setBaolongshou(param7);
      }
      
      public function showUpgradePanel(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Object = SiLingZhenResManager.getSiLingZhenData(param1,this._arrCurrent[param1 - 1][0]);
         if(this._arrCurrent[param1 - 1][0] < 10)
         {
            if(param2)
            {
               this.mainCharArrtibutePlane.playSiLingZhenYanhua();
               this.mainCharArrtibutePlane.resetSiLingZhenAutoBtnLabel();
               this.mainCharArrtibutePlane.setUpgradePanelVisble(false);
               this.bUpgreadePanelClosed = true;
            }
            else
            {
               this.mainCharArrtibutePlane.setUpgradePanelVisble(true);
               this.bUpgreadePanelClosed = false;
               this.mainCharArrtibutePlane.showUpgradePanel(this._arrCurrent[param1 - 1][1] - this._arrCurrent[param1 - 1][2],this._arrCurrent[param1 - 1][1],_loc3_.limit_zufu,int(int(_loc3_.tupo_show_lv) / 100),_loc3_.zhenqi,_loc3_.cailiao_num,GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc3_.cailiao_id,true),this._arrCurrent[param1 - 1][0],param1);
            }
         }
         else
         {
            this.mainCharArrtibutePlane.setUpgradePanelVisble(false);
         }
      }
      
      private function onShowSiLingZhenPanel(param1:Event) : void
      {
         this.msgSenderProxy.send_53405(-1);
      }
      
      private function onCloseSiLingZhenPanel(param1:Event) : void
      {
         this.stopTimer();
         this.mainCharArrtibutePlane.resetSiLingZhenAutoBtnLabel();
         this.bUpdating = false;
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff != null)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      private function onTimerUpdate() : void
      {
         var _loc1_:Object = SiLingZhenResManager.getSiLingZhenData(this.key,this._arrCurrent[this.key - 1][0]);
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc1_.cailiao_id,true);
         if(_loc2_ < _loc1_.cailiao_num || GameInstance.mainCharData.attributeInfo.gqNow < _loc1_.zhenqi)
         {
            this.stopTimer();
            this.mainCharArrtibutePlane.resetSiLingZhenAutoBtnLabel();
         }
         this.msgSenderProxy.send_53401([this.key,this.mainCharArrtibutePlane.getUseGoodsType()]);
      }
      
      public function stopTimer() : void
      {
         if(this.timerData != null)
         {
            this.timerData.timer.reset();
            this.timerData.timer.stop();
            this.bUpdating = false;
         }
      }
   }
}

