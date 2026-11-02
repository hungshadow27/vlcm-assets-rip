package com.tgame.moudels.aojianzhengba.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.aojianzhengba.AojianZhengba_ApplicationFacade;
   import com.tgame.moudels.aojianzhengba.model.AojianZhengba_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.mainui.AojianZhengbaSelectCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AojianZhengba_Mediator extends Mediator
   {
      
      public static const NAME:String = "AojianZhengba_Mediator";
      
      private var _senderProxy:AojianZhengba_MsgSenderProxy;
      
      public function AojianZhengba_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : AojianZhengba_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(AojianZhengba_MsgSenderProxy.NAME) as AojianZhengba_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : AojianZhengbaSelectCanvas
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.aojianZhengba);
         }
         return viewComponent as AojianZhengbaSelectCanvas;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [AojianZhengba_ApplicationFacade.AOJIAN_ZHENGBA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case AojianZhengba_ApplicationFacade.AOJIAN_ZHENGBA:
               this.senderProxy.send_57901();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAINUI_AOJIANZHENGBA_LINE_SELECT,mainCharArrtibutePlaneHandle);
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAINUI_KUAFUBAOGUO,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.MAINUI_AOJIANZHENGBA_LINE_SELECT,mainCharArrtibutePlaneHandle);
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.MAINUI_KUAFUBAOGUO,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:Object = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case MainUI.MAINUI_AOJIANZHENGBA_LINE_SELECT:
               _loc3_ = (param1 as BaseEvent).data as Object;
               this.senderProxy.send_57903(_loc3_.id);
               break;
            case MainUI.MAINUI_KUAFUBAOGUO:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
         }
      }
      
      public function showZhengbaLineSelectPanel(param1:XML) : void
      {
         GameInstance.uiInstance.mainUI.showZhengbaLineSelectPanel(param1);
      }
      
      public function setZhengbaList(param1:XML) : void
      {
         GameInstance.uiInstance.mainUI.setZhengbaInitialize(param1);
      }
      
      public function deldteZhengbaList() : void
      {
         GameInstance.uiInstance.mainUI.removeZhengba();
      }
   }
}

