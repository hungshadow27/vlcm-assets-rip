package com.tgame.moudels.feast
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.feast.controller.Feast_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Feast_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.feast.Feast_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const HUN_YAN_CHI:String = "HUN_YAN_CHI";
      
      public function Feast_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_FEAST,PipeConstants.HUN_YAN_CHI],this.handlePipeMessage,Feast_ApplicationFacade);
      }
      
      public static function getInstance() : Feast_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Feast_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Feast_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Feast_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_FEAST:
               this.startup();
               break;
            case PipeConstants.HUN_YAN_CHI:
               sendNotification(HUN_YAN_CHI,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

