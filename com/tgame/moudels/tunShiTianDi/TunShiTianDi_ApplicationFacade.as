package com.tgame.moudels.tunShiTianDi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tunShiTianDi.controller.TunShiTianDi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TunShiTianDi_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.tunShiTianDi.TunShiTianDi_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_TUNSHITIANDI_PANEL:String = "SHOW_TUNSHITIANDI_PANEL";
      
      public function TunShiTianDi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TUNSHITIANDI,PipeConstants.SHOW_TUNSHITIANDI_PANEL],this.handlePipeMessage,TunShiTianDi_ApplicationFacade);
      }
      
      public static function getInstance() : TunShiTianDi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TunShiTianDi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TunShiTianDi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TunShiTianDi_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_TUNSHITIANDI:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               break;
            case PipeConstants.SHOW_TUNSHITIANDI_PANEL:
               sendNotification(SHOW_TUNSHITIANDI_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

