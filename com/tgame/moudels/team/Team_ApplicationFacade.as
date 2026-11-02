package com.tgame.moudels.team
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.team.controller.Team_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Team_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.team.Team_ApplicationFacade";
      
      public static const SEND_TEAM_INVITE:String = "SEND_TEAM_INVITE";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SET_TEAM_PARMS:String = "SET_TEAM_PARMS";
      
      public static const SHOW_TEAM_INSTANCE:String = "SHOW_TEAM_INSTANCE";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const KUAFU_STATUS:String = "KUAFU_STATUS";
      
      public function Team_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TEAM,PipeConstants.SEND_TEAM_INVITE,PipeConstants.SET_TEAM_PARMS,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.ENTER_SCENE,PipeConstants.KUAFU_STATUS],this.handlePipeMessage,Team_ApplicationFacade);
      }
      
      public static function getInstance() : Team_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Team_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Team_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Team_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_TEAM:
               this.startup();
               break;
            case PipeConstants.SEND_TEAM_INVITE:
               sendNotification(SEND_TEAM_INVITE,_loc2_);
               break;
            case PipeConstants.SET_TEAM_PARMS:
               sendNotification(SET_TEAM_PARMS,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(SHOW_TEAM_INSTANCE,_loc2_);
               break;
            case PipeConstants.ENTER_SCENE:
               sendNotification(ENTER_SCENE,_loc2_);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(KUAFU_STATUS);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

