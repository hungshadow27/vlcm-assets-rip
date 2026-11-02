package com.tgame.moudels.xingxiuzhen.controller
{
   import com.tgame.moudels.xingxiuzhen.model.XingXiuZhen_MsgReceivedProxy;
   import com.tgame.moudels.xingxiuzhen.model.XingXiuZhen_MsgSenderProxy;
   import com.tgame.moudels.xingxiuzhen.view.XingXiuZhen_Mediator;
   import com.tgame.moudels.xingxiuzhen.view.XingXiuZhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XingXiuZhen_StartupCommand extends SimpleCommand
   {
      
      public function XingXiuZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XingXiuZhen_MsgSenderProxy());
         facade.registerProxy(new XingXiuZhen_MsgReceivedProxy());
         facade.registerMediator(new XingXiuZhen_Mediator());
         facade.registerMediator(new XingXiuZhen_TargetMediator());
      }
   }
}

