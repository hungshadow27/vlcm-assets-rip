package com.tgame.moudels.moxuezhanchang.controller
{
   import com.tgame.moudels.moxuezhanchang.model.MoXueZhanChang_MsgReceivedProxy;
   import com.tgame.moudels.moxuezhanchang.model.MoXueZhanChang_MsgSenderProxy;
   import com.tgame.moudels.moxuezhanchang.view.MoXueZhanChangTips_Mediator;
   import com.tgame.moudels.moxuezhanchang.view.MoXueZhanChang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MoXueZhanChang_StartupCommand extends SimpleCommand
   {
      
      public function MoXueZhanChang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MoXueZhanChang_MsgReceivedProxy());
         facade.registerProxy(new MoXueZhanChang_MsgSenderProxy());
         facade.registerMediator(new MoXueZhanChang_Mediator());
         facade.registerMediator(new MoXueZhanChangTips_Mediator());
      }
   }
}

