package com.tgame.moudels.char
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.char.controller.Char_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Char_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.char.Char_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Char_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CHAR],this.handlePipeMessage,Char_ApplicationFacade);
      }
      
      public static function getInstance() : Char_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Char_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Char_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Char_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_CHAR:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

