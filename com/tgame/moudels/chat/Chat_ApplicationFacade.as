package com.tgame.moudels.chat
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.chat.controller.Chat_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Chat_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.chat.Chat_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Chat_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CHAT],this.handlePipeMessage,Chat_ApplicationFacade);
      }
      
      public static function getInstance() : Chat_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Chat_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Chat_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Chat_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_CHAT:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

