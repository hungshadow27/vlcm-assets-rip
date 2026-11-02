package com.tgame.moudels.duixueren
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.duixueren.controller.DuiXueRen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DuiXueRen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.duixueren.DuiXueRen_ApplicationFacade";
      
      public static const GET_DUIXUEREN_PANEL:String = "GET_DUIXUEREN_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const DUIXUEREN_GET:String = "DUIXUEREN_GET";
      
      public function DuiXueRen_ApplicationFacade(param1:String)
      {
         super(NAME);
         PipeManager.registerMsgs([PipeConstants.GET_DUIXUEREN_PANEL,PipeConstants.STARTUP_DUIXUEREN,PipeConstants.DUIXUEREN_GET],this.handlePipeMessage,DuiXueRen_ApplicationFacade);
      }
      
      public static function getInstance() : DuiXueRen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DuiXueRen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DuiXueRen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DuiXueRen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_DUIXUEREN:
               this.startup();
               break;
            case PipeConstants.GET_DUIXUEREN_PANEL:
               sendNotification(GET_DUIXUEREN_PANEL);
               break;
            case PipeConstants.DUIXUEREN_GET:
               sendNotification(DUIXUEREN_GET,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

