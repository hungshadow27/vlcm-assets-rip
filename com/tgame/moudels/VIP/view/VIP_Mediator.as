package com.tgame.moudels.VIP.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.VIP.VIP_ApplicationFacade;
   import com.tgame.moudels.VIP.model.VIP_MsgSenderProxy;
   import com.tgame.shell.view.components.VIP;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class VIP_Mediator extends Mediator
   {
      
      public static const NAME:String = "VIP_Mediator";
      
      private var _senderProxy:VIP_MsgSenderProxy;
      
      public function VIP_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : VIP_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(VIP_MsgSenderProxy.NAME) as VIP_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get vipPanel() : VIP
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.vip);
         }
         return viewComponent as VIP;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [VIP_ApplicationFacade.SHOW_VIP_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case VIP_ApplicationFacade.SHOW_VIP_PANEL:
               UITools.showHidePanel(GameInstance.uiInstance.vip);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(VIP,function():void
         {
            vipPanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            vipPanel.addEventListener(VIP.UI_VIP_CHENGJIUBTN_CLICK,handler);
            vipPanel.addEventListener(VIP.UI_VIP_BUYBTN_CLICK,handler);
            vipPanel.addEventListener(VIP.UI_VIPGUIZE_CLOSE,handler);
            vipPanel.addEventListener(VIP.UI_VIP_YUANBAOFANHUAN,handler);
            vipPanel.addEventListener(VIP.UI_VIP_JINPIAOFANHUAN,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(VIP,function():void
         {
            vipPanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            vipPanel.removeEventListener(VIP.UI_VIP_CHENGJIUBTN_CLICK,handler);
            vipPanel.removeEventListener(VIP.UI_VIP_BUYBTN_CLICK,handler);
            vipPanel.removeEventListener(VIP.UI_VIPGUIZE_CLOSE,handler);
            vipPanel.removeEventListener(VIP.UI_VIP_YUANBAOFANHUAN,handler);
            vipPanel.removeEventListener(VIP.UI_VIP_JINPIAOFANHUAN,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.data;
         }
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_72801();
               break;
            case VIP.UI_VIP_CHENGJIUBTN_CLICK:
               this.senderProxy.send_72803(_loc4_);
               break;
            case VIP.UI_VIP_BUYBTN_CLICK:
               _loc5_ = 1300;
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc5_,0]);
               break;
            case VIP.UI_VIPGUIZE_CLOSE:
               _loc6_ = _loc4_ as int;
               this.vipGuizeClose(_loc6_);
               break;
            case VIP.UI_VIP_YUANBAOFANHUAN:
               this.senderProxy.send_82711();
               break;
            case VIP.UI_VIP_JINPIAOFANHUAN:
               this.senderProxy.send_82713();
         }
      }
      
      public function setInit(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Array, param7:int) : void
      {
         this.vipPanel.setInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function vipGuizeClose(param1:int) : void
      {
         if(param1 == 1)
         {
            this.vipPanel.onShowLv(true);
         }
         else
         {
            this.vipPanel.onShowLv(false);
         }
      }
   }
}

