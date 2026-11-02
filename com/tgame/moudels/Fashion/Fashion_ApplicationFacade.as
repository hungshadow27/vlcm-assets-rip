package com.tgame.moudels.Fashion
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.Fashion.controller.Fashion_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Fashion_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.Fashion.Fashion_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Fashion_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_FASHION],this.handlePipeMessage,Fashion_ApplicationFacade);
      }
      
      public static function getInstance() : Fashion_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Fashion_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Fashion_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Fashion_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_FASHION:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

