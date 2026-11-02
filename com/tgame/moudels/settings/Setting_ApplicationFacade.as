package com.tgame.moudels.settings
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.settings.controller.Settings_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Setting_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.settings.Setting_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SETTING_DATA:String = "SETTING_DATA";
      
      public function Setting_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SETTING,PipeConstants.SETTING_DATA],this.handlePipeMessage,Setting_ApplicationFacade);
      }
      
      public static function getInstance() : Setting_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Setting_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Setting_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Settings_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SETTING:
               this.startup();
               break;
            case PipeConstants.SETTING_DATA:
               sendNotification(SETTING_DATA,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

