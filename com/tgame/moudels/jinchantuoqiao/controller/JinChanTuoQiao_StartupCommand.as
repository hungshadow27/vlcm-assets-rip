package com.tgame.moudels.jinchantuoqiao.controller
{
   import com.tgame.moudels.jinchantuoqiao.model.JinChanTuoQiao_MsgReceivedProxy;
   import com.tgame.moudels.jinchantuoqiao.model.JinChanTuoQiao_MsgSenderProxy;
   import com.tgame.moudels.jinchantuoqiao.view.JinChanTuoQiao_Mediator;
   import com.tgame.moudels.jinchantuoqiao.view.JinChanTuoQiao_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JinChanTuoQiao_StartupCommand extends SimpleCommand
   {
      
      public function JinChanTuoQiao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JinChanTuoQiao_MsgSenderProxy());
         facade.registerProxy(new JinChanTuoQiao_MsgReceivedProxy());
         facade.registerMediator(new JinChanTuoQiao_Mediator());
         facade.registerMediator(new JinChanTuoQiao_TargetMediator());
      }
   }
}

