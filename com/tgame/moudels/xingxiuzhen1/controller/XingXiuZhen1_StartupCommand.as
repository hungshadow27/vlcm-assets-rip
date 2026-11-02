package com.tgame.moudels.xingxiuzhen1.controller
{
   import com.tgame.moudels.xingxiuzhen1.model.XingXiuZhen1_MsgReceivedProxy;
   import com.tgame.moudels.xingxiuzhen1.model.XingXiuZhen1_MsgSenderProxy;
   import com.tgame.moudels.xingxiuzhen1.view.XingXiuZhen1_Mediator;
   import com.tgame.moudels.xingxiuzhen1.view.XingXiuZhen1_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XingXiuZhen1_StartupCommand extends SimpleCommand
   {
      
      public function XingXiuZhen1_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XingXiuZhen1_MsgSenderProxy());
         facade.registerProxy(new XingXiuZhen1_MsgReceivedProxy());
         facade.registerMediator(new XingXiuZhen1_Mediator());
         facade.registerMediator(new XingXiuZhen1_TargetMediator());
      }
   }
}

