package com.tgame.moudels.xunzhangyangcheng.controller
{
   import com.tgame.moudels.xunzhangyangcheng.model.XunZhangYangCheng_MsgReceivedProxy;
   import com.tgame.moudels.xunzhangyangcheng.model.XunZhangYangCheng_MsgSenderProxy;
   import com.tgame.moudels.xunzhangyangcheng.view.XunZhangYangCheng_Mediator;
   import com.tgame.moudels.xunzhangyangcheng.view.XunZhangYangCheng_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XunZhangYangCheng_StartupCommand extends SimpleCommand
   {
      
      public function XunZhangYangCheng_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XunZhangYangCheng_MsgReceivedProxy());
         facade.registerProxy(new XunZhangYangCheng_MsgSenderProxy());
         facade.registerMediator(new XunZhangYangCheng_Mediator());
         facade.registerMediator(new XunZhangYangCheng_TargetMediator());
      }
   }
}

