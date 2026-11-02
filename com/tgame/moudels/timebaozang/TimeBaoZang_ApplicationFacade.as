package com.tgame.moudels.timebaozang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.timebaozang.controller.TimeBaoZang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TimeBaoZang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.timebaozang.TimeBaoZang_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_TIMEBAOZANG_PANEL:String = "SHOW_TIMEBAOZANG_PANEL";
      
      public function TimeBaoZang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TIMEBAOZANG,PipeConstants.SHOW_TIMEBAOZANG_PANEL],this.handlePipeMessage,TimeBaoZang_ApplicationFacade);
      }
      
      public static function getInstance() : TimeBaoZang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TimeBaoZang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TimeBaoZang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TimeBaoZang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_TIMEBAOZANG:
               this.startup();
               break;
            case PipeConstants.SHOW_TIMEBAOZANG_PANEL:
               sendNotification(SHOW_TIMEBAOZANG_PANEL,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

