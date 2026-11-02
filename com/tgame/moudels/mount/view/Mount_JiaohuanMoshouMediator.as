package com.tgame.moudels.mount.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.RideJiaohuanMoshouPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_JiaohuanMoshouMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_JiaohuanMoshouMediator";
      
      private var info:String = "";
      
      private var selectMountID:int = 0;
      
      private var _isFirstRun:Boolean = true;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_JiaohuanMoshouMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Mount_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get panel() : RideJiaohuanMoshouPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.changeMoshouMount);
         }
         return viewComponent as RideJiaohuanMoshouPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mount_ApplicationFacade.JIAOHUAN_MOSHOU];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RideJiaohuanMoshouPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addedPanel);
            panel.addEventListener(RideJiaohuanMoshouPanel.RIDE_JIAOHUAN_MOSHOU_BY_CRASH,RideChangeBtnHandle);
            panel.addEventListener(RideJiaohuanMoshouPanel.SEND_RIDE_ID,RideChangeBtnHandle);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RideJiaohuanMoshouPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,addedPanel);
            panel.removeEventListener(RideJiaohuanMoshouPanel.RIDE_JIAOHUAN_MOSHOU_BY_CRASH,RideChangeBtnHandle);
            panel.removeEventListener(RideJiaohuanMoshouPanel.SEND_RIDE_ID,RideChangeBtnHandle);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function RideChangeBtnHandle(param1:BaseEvent) : void
      {
         var _loc2_:String = param1.type;
         this.selectMountID = int(param1.data);
         switch(_loc2_)
         {
            case RideJiaohuanMoshouPanel.SEND_RIDE_ID:
               this.msgSenderProxy.send_52031(this.selectMountID);
               break;
            case RideJiaohuanMoshouPanel.RIDE_JIAOHUAN_MOSHOU_BY_CRASH:
               this.msgSenderProxy.send_52033(this.selectMountID);
         }
      }
      
      private function addedPanel(param1:Event) : void
      {
         this.msgSenderProxy.send_50029([GameInstance.mainChar.id,7]);
      }
      
      private function panelClose(param1:Event = null) : void
      {
         this.selectMountID = 0;
      }
      
      public function changeMoshouComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,7]);
            this.panel.refreshBlankUI(this.info);
            this.selectMountID = 0;
         }
      }
      
      public function refreshPanel(param1:Boolean, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:MountRes = null;
         this.info = LanResManager.getLanCommonTextWords("使用") + param3 + LanResManager.getLanCommonTextWords("颗【兽魂之魔兽碎片】，在此可将四圣兽之魔兽坐骑唤醒（当您的圣兽坐骑等级达到120级并且总梦幻度达到80%可以使用兽魂之魔兽碎片）。");
         if(param1)
         {
            _loc6_ = MountResManager.getMountRes(param4);
            this.panel.refresh(param1,param2,param3,_loc6_.name,this.info,param5);
         }
         else
         {
            this.panel.refreshBlankUI(this.info);
         }
      }
      
      public function setMountList(param1:Array) : void
      {
         var _loc3_:String = null;
         var _loc4_:PureMount = null;
         var _loc2_:XML = <list/>;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc2_.appendChild(<node showlabel={_loc4_.name} level={_loc4_.mountAttributeInfo.lv} label={_loc4_.id} state={_loc4_.fightStatus} quality={_loc4_.mountAttributeInfo.quality}/>);
            if(_loc4_.id == this.selectMountID)
            {
               _loc6_ = _loc5_;
            }
            _loc5_++;
         }
         this.panel.setRideList(_loc2_,_loc6_);
         if(this._isFirstRun)
         {
            if(param1.length > 0)
            {
               if(this.selectMountID == 0)
               {
                  _loc4_ = param1[0] as PureMount;
                  this.selectMountID = _loc4_.id;
               }
               this.msgSenderProxy.send_52031(this.selectMountID);
               this._isFirstRun = false;
            }
         }
      }
   }
}

