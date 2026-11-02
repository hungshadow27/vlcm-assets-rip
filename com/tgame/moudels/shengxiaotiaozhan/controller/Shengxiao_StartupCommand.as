package com.tgame.moudels.shengxiaotiaozhan.controller
{
   import com.tgame.moudels.shengxiaotiaozhan.model.Shengxiao_MsgReceivedProxy;
   import com.tgame.moudels.shengxiaotiaozhan.model.Shengxiao_MsgSendProxy;
   import com.tgame.moudels.shengxiaotiaozhan.view.Shengxiao_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Shengxiao_StartupCommand extends SimpleCommand
   {
      
      public function Shengxiao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Shengxiao_MsgReceivedProxy());
         facade.registerProxy(new Shengxiao_MsgSendProxy());
         facade.registerMediator(new Shengxiao_Mediator());
      }
   }
}

