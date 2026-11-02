package com.tgame.moudels.skill
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.skill.controller.Skill_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Skill_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.skill.Skill_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SKILL_LEVEL_UPDATE:String = "SKILL_LEVEL_UPDATE";
      
      public static const KUAFU_STATUS:String = "KUAFU_STATUS";
      
      public function Skill_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SKILL,PipeConstants.SKILL_LEVEL_UPDATE,PipeConstants.KUAFU_STATUS],this.handlePipeMessage,Skill_ApplicationFacade);
      }
      
      public static function getInstance() : Skill_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Skill_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Skill_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Skill_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SKILL:
               this.startup();
               break;
            case PipeConstants.SKILL_LEVEL_UPDATE:
               sendNotification(SKILL_LEVEL_UPDATE,_loc2_);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(KUAFU_STATUS,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

