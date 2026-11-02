package com.tgame.moudels.login
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.login.controller.Login_ShutdownCommand;
   import com.tgame.moudels.login.controller.Login_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Login_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.login.Login_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHUTDOWN:String = "SHUTDOWN";
      
      public static const SHOW_LOGINUI:String = "SHOW_LOGINUI";
      
      public static const SHOW_LINE:String = "SHOW_LINE";
      
      public static const SHOW_ROLE_LIST:String = "SHOW_ROLE_LIST";
      
      public static const DELETE_CHAR:String = "DELETE_CHAR";
      
      public static const CREATE_ROLE_SUCCESS:String = "CREATE_ROLE_SUCCESS";
      
      public static const LOGIN_DEFEAT:String = "LOGIN_DEFEAT";
      
      public function Login_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_LOGIN,PipeConstants.SHOW_LINE],this.handlePipeMessage,Login_ApplicationFacade);
      }
      
      public static function getInstance() : Login_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Login_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Login_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         this.shutdown();
         PipeManager.removeMsgs([PipeConstants.STARTUP_LOGIN,PipeConstants.SHOW_LINE],Login_ApplicationFacade);
         Facade.removeCore(Login_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Login_StartupCommand);
         registerCommand(SHUTDOWN,Login_ShutdownCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_LOGIN:
               this.startup();
               break;
            case PipeConstants.SHOW_LINE:
               sendNotification(SHOW_LINE,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
      
      private function shutdown() : void
      {
         sendNotification(SHUTDOWN);
      }
   }
}

