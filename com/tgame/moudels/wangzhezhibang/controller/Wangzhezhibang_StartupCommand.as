package com.tgame.moudels.wangzhezhibang.controller
{
   import com.tgame.moudels.wangzhezhibang.model.Wangzhezhibang_MsgReceivedProxy;
   import com.tgame.moudels.wangzhezhibang.model.Wangzhezhibang_MsgSenderProxy;
   import com.tgame.moudels.wangzhezhibang.view.Wangzhezhibang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Wangzhezhibang_StartupCommand extends SimpleCommand
   {
      
      public function Wangzhezhibang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Wangzhezhibang_MsgSenderProxy());
         facade.registerProxy(new Wangzhezhibang_MsgReceivedProxy());
         facade.registerMediator(new Wangzhezhibang_Mediator());
      }
   }
}

