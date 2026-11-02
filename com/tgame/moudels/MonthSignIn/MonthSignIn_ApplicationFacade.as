package com.tgame.moudels.MonthSignIn
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.MonthSignIn.controller.MonthSignIn_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MonthSignIn_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.MonthSignIn.MonthSignIn_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function MonthSignIn_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MONTHSIGNIN],this.handlePipeMessage,MonthSignIn_ApplicationFacade);
      }
      
      public static function getInstance() : MonthSignIn_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MonthSignIn_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MonthSignIn_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MonthSignIn_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_MONTHSIGNIN:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

