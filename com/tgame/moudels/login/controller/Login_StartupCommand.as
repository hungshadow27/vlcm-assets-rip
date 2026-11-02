package com.tgame.moudels.login.controller
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.Login_ApplicationFacade;
   import com.tgame.moudels.login.model.Login_LoginSocketManager;
   import com.tgame.moudels.login.model.Login_MsgReceivedProxy;
   import com.tgame.moudels.login.model.Login_MsgSenderProxy;
   import com.tgame.moudels.login.view.Login_LoginMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Login_StartupCommand extends SimpleCommand
   {
      
      public function Login_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Login_LoginSocketManager());
         facade.registerProxy(new Login_MsgSenderProxy());
         facade.registerProxy(new Login_MsgReceivedProxy());
         facade.registerMediator(new Login_LoginMediator());
         facade.registerCommand(Login_ApplicationFacade.SHOW_LINE,Login_ShowLineCommand);
         facade.registerCommand(Login_ApplicationFacade.SHOW_ROLE_LIST,Login_ShowRoleListCommand);
         facade.registerCommand(Login_ApplicationFacade.DELETE_CHAR,Login_deleteCharCommand);
         facade.registerCommand(Login_ApplicationFacade.CREATE_ROLE_SUCCESS,Login_CreateRoleSuccessCommand);
         facade.registerCommand(Login_ApplicationFacade.LOGIN_DEFEAT,Login_DefeatCommand);
         TPreLoader.showPreLoadingUI(LanResManager.getLanTextWords(this,"正在连接登陆服务器"));
         TPreLoader.updatePreLoadingUI(0.6);
         NetWorkManager.connectLogin();
         NetWorkManager.connectChat();
      }
   }
}

