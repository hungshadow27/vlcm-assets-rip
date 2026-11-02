package com.tgame.moudels.ynJubaopen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynJubaopen.controller.YNjubaopen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNjubaopen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynJubaopen.YNjubaopen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REQUEST_YUENANJUBAOPEN_PANEL:String = "REQUEST_YUENANJUBAOPEN_PANEL";
      
      public function YNjubaopen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.REQUEST_YUENANJUBAOPEN_PANEL,PipeConstants.STARTUP_YUENANJUBAOPEN],this.handlePipeMessage,YNjubaopen_ApplicationFacade);
      }
      
      public static function getInstance() : YNjubaopen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNjubaopen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNjubaopen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNjubaopen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENANJUBAOPEN:
               this.startup();
               break;
            case PipeConstants.REQUEST_YUENANJUBAOPEN_PANEL:
               sendNotification(REQUEST_YUENANJUBAOPEN_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

