package com.tgame.moudels.xunzhangzhanshi.controller
{
   import com.tgame.moudels.xunzhangzhanshi.model.XunZhangZhanshi_MsgReceivedProxy;
   import com.tgame.moudels.xunzhangzhanshi.model.XunZhangZhanshi_MsgSenderProxy;
   import com.tgame.moudels.xunzhangzhanshi.view.XunZhangZhanshi_Huodong_TargetMediator;
   import com.tgame.moudels.xunzhangzhanshi.view.XunZhangZhanshi_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XunZhangZhanshi_StartupCommand extends SimpleCommand
   {
      
      public function XunZhangZhanshi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XunZhangZhanshi_MsgReceivedProxy());
         facade.registerProxy(new XunZhangZhanshi_MsgSenderProxy());
         facade.registerMediator(new XunZhangZhanshi_Mediator());
         facade.registerMediator(new XunZhangZhanshi_Huodong_TargetMediator());
      }
   }
}

