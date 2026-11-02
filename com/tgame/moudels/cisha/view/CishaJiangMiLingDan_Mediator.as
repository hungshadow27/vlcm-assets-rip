package com.tgame.moudels.cisha.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cisha.model.CiSha_MsgSenderProxy;
   import com.tgame.shell.view.components.cisha.CishaMilingCanvas;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CishaJiangMiLingDan_Mediator extends Mediator
   {
      
      public static const NAME:String = "CishaJiangMiLingDan_Mediator";
      
      private var _msgSenderProxy:CiSha_MsgSenderProxy;
      
      public function CishaJiangMiLingDan_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get ciShaMiLing_Panel() : CishaMilingCanvas
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.cishaMilingPanel);
         }
         return viewComponent as CishaMilingCanvas;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      private function get msgSenderProxy() : CiSha_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(CiSha_MsgSenderProxy.NAME) as CiSha_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CishaMilingCanvas,function():void
         {
            ciShaMiLing_Panel.addEventListener(Event.ADDED_TO_STAGE,handle);
            ciShaMiLing_Panel.addEventListener(CishaMilingCanvas.UI_SHUAXIN_MILING_PANEL,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CishaMilingCanvas,function():void
         {
            ciShaMiLing_Panel.removeEventListener(Event.ADDED_TO_STAGE,handle);
            ciShaMiLing_Panel.removeEventListener(CishaMilingCanvas.UI_SHUAXIN_MILING_PANEL,handle);
         });
      }
      
      private function handle(param1:*) : void
      {
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.msgSenderProxy.send_57411(0);
               break;
            case CishaMilingCanvas.UI_SHUAXIN_MILING_PANEL:
               this.msgSenderProxy.send_57411(1);
         }
      }
      
      public function setCishaMilingPanelNum(param1:String, param2:int, param3:String, param4:int, param5:String, param6:String, param7:int, param8:int) : void
      {
         this.ciShaMiLing_Panel.setPanelNum(param1,param2,param3,param4,param5,param6,param7,param8);
      }
   }
}

