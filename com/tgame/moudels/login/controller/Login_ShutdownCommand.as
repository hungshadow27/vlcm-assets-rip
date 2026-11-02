package com.tgame.moudels.login.controller
{
   import com.tgame.moudels.login.Login_ApplicationFacade;
   import com.tgame.moudels.login.model.Login_LoginSocketManager;
   import com.tgame.moudels.login.model.Login_MsgReceivedProxy;
   import com.tgame.moudels.login.model.Login_MsgSenderProxy;
   import com.tgame.moudels.login.view.Login_LoginMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Login_ShutdownCommand extends SimpleCommand
   {
      
      public function Login_ShutdownCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.removeProxy(Login_LoginSocketManager.NAME);
         facade.removeProxy(Login_MsgSenderProxy.NAME);
         facade.removeProxy(Login_MsgReceivedProxy.NAME);
         facade.removeMediator(Login_LoginMediator.NAME);
         facade.removeCommand(Login_ApplicationFacade.SHOW_LINE);
         facade.removeCommand(Login_ApplicationFacade.SHOW_ROLE_LIST);
         facade.removeCommand(Login_ApplicationFacade.DELETE_CHAR);
         facade.removeCommand(Login_ApplicationFacade.CREATE_ROLE_SUCCESS);
         facade.removeCommand(Login_ApplicationFacade.LOGIN_DEFEAT);
      }
   }
}

