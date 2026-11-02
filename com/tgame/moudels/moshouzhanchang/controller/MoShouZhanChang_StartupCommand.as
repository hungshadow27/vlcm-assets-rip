package com.tgame.moudels.moshouzhanchang.controller
{
   import com.tgame.moudels.moshouzhanchang.model.MoShouZhanChang_MsgReceivedProxy;
   import com.tgame.moudels.moshouzhanchang.model.MoShouZhanChang_MsgSendProxy;
   import com.tgame.moudels.moshouzhanchang.view.MoShouZhanChang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MoShouZhanChang_StartupCommand extends SimpleCommand
   {
      
      public function MoShouZhanChang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MoShouZhanChang_MsgReceivedProxy());
         facade.registerProxy(new MoShouZhanChang_MsgSendProxy());
         facade.registerMediator(new MoShouZhanChang_Mediator());
      }
   }
}

