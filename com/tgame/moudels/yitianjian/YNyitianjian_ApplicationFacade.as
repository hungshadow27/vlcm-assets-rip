package com.tgame.moudels.yitianjian
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yitianjian.controller.YNyitianjian_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNyitianjian_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yitianjian.YNyitianjian_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YNYITIANJIAN:String = "SHOW_YNYITIANJIAN";
      
      public function YNyitianjian_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNYITIANJIAN,PipeConstants.SHOW_YNYITIANJIAN],this.handlePipeMessage,YNyitianjian_ApplicationFacade);
      }
      
      public static function getInstance() : YNyitianjian_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNyitianjian_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNyitianjian_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNyitianjian_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNYITIANJIAN:
               this.startup();
               break;
            case PipeConstants.SHOW_YNYITIANJIAN:
               sendNotification(SHOW_YNYITIANJIAN,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

