package com.tgame.moudels.pickup
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.pickup.controller.PickUp_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class PickUp_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.pickup.PickUp_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const PICK_UP:String = "PICK_UP";
      
      public static const SPACE_AUTO_PICK_UP:String = "SPACE_AUTO_PICK_UP";
      
      public function PickUp_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_PICKUP,PipeConstants.PICK_UP,PipeConstants.KEY_SPACE],this.handlePipeMessage,PickUp_ApplicationFacade);
      }
      
      public static function getInstance() : PickUp_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new PickUp_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as PickUp_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,PickUp_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_PICKUP:
               this.startup();
               break;
            case PipeConstants.PICK_UP:
               sendNotification(PICK_UP,_loc2_);
               break;
            case PipeConstants.KEY_SPACE:
               sendNotification(SPACE_AUTO_PICK_UP);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

