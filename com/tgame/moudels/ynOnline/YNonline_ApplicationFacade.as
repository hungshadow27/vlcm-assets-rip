package com.tgame.moudels.ynOnline
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynOnline.controller.YNonline_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNonline_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynOnline.YNonline_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REQUEST_YUENANONLINE_PANEL:String = "REQUEST_YUENANONLINE_PANEL";
      
      public function YNonline_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.REQUEST_YUENANONLINE_PANEL,PipeConstants.STARTUP_YUENANONLINE],this.handlePipeMessage,YNonline_ApplicationFacade);
      }
      
      public static function getInstance() : YNonline_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNonline_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNonline_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNonline_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENANONLINE:
               this.startup();
               break;
            case PipeConstants.REQUEST_YUENANONLINE_PANEL:
               sendNotification(REQUEST_YUENANONLINE_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

