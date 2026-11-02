package com.tgame.moudels.friend
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.friend.controller.Friend_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Friend_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.friend.Friend_ApplicationFacade";
      
      public static const SEND_ADD_FRIEND:String = "SEND_ADD_FRIEND";
      
      public static const LIHUN_SUCCESS:String = "LIHUN_SUCCESS";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Friend_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_FRIEND,PipeConstants.SEND_ADD_FRIEND,PipeConstants.LIHUN_SUCCESS],this.handlePipeMessage,Friend_ApplicationFacade);
      }
      
      public static function getInstance() : Friend_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Friend_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Friend_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Friend_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_FRIEND:
               this.startup();
               break;
            case PipeConstants.SEND_ADD_FRIEND:
               sendNotification(SEND_ADD_FRIEND,_loc2_);
               break;
            case PipeConstants.LIHUN_SUCCESS:
               sendNotification(LIHUN_SUCCESS,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

