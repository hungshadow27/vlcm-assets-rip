package com.tgame.moudels.xunzhang.controller
{
   import com.tgame.moudels.xunzhang.model.XunZhang_MsgReceivedProxy;
   import com.tgame.moudels.xunzhang.model.XunZhang_MsgSenderProxy;
   import com.tgame.moudels.xunzhang.view.XunZhang_Huodong_TargetMediator;
   import com.tgame.moudels.xunzhang.view.XunZhang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XunZhang_StartupCommand extends SimpleCommand
   {
      
      public function XunZhang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XunZhang_MsgReceivedProxy());
         facade.registerProxy(new XunZhang_MsgSenderProxy());
         facade.registerMediator(new XunZhang_Mediator());
         facade.registerMediator(new XunZhang_Huodong_TargetMediator());
      }
   }
}

