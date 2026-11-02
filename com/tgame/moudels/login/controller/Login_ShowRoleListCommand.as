package com.tgame.moudels.login.controller
{
   import com.tgame.moudels.login.view.Login_LoginMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Login_ShowRoleListCommand extends SimpleCommand
   {
      
      public function Login_ShowRoleListCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Login_LoginMediator = facade.retrieveMediator(Login_LoginMediator.NAME) as Login_LoginMediator;
         _loc2_.showSelectRoleUI(param1.getBody() as Array);
      }
   }
}

