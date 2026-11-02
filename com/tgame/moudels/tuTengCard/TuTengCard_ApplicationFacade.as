package com.tgame.moudels.tuTengCard
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tuTengCard.controller.TuTengCard_StartCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TuTengCard_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.tuTengCard.TuTengCard_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function TuTengCard_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TU_TENG_CADE],this.handlePipeMessage,TuTengCard_ApplicationFacade);
      }
      
      public static function getInstance() : TuTengCard_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TuTengCard_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TuTengCard_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TuTengCard_StartCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_TU_TENG_CADE:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

