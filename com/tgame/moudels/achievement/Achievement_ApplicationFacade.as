package com.tgame.moudels.achievement
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.achievement.controller.Achievement_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Achievement_ApplicationFacade extends Facade
   {
      
      private static const NAME:String = PipeConstants.STARTUP_ACHIEVEMENT;
      
      public static const SHOW_CHENGJIU_DUIBI:String = "SHOW_CHENGJIU_DUIBI";
      
      private var STARTUP:String = "STARTUP";
      
      public function Achievement_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ACHIEVEMENT,PipeConstants.SHOW_CHENGJIU_PANEL],this.onHandler,Achievement_ApplicationFacade);
      }
      
      public static function getInstance() : Achievement_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Achievement_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Achievement_ApplicationFacade;
      }
      
      private function onHandler(param1:Notification) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ACHIEVEMENT:
               sendNotification(this.STARTUP);
               break;
            case PipeConstants.SHOW_CHENGJIU_PANEL:
               _loc2_ = param1.body as Array;
               if(!_loc2_)
               {
                  return;
               }
               _loc3_ = int(_loc2_[0]);
               if(_loc3_ > 0)
               {
                  sendNotification(SHOW_CHENGJIU_DUIBI,_loc2_);
               }
         }
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(this.STARTUP,Achievement_StartupCommand);
      }
   }
}

