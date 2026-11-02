package com.tgame.moudels.fengzhengjie.controller
{
   import com.tgame.moudels.fengzhengjie.model.FengZhengJie_MsgReceivedProxy;
   import com.tgame.moudels.fengzhengjie.model.FengZhengJie_MsgSendProxy;
   import com.tgame.moudels.fengzhengjie.view.FengZhengJie_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class FengZhengJie_StartupCommand extends SimpleCommand
   {
      
      public function FengZhengJie_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new FengZhengJie_MsgReceivedProxy());
         facade.registerProxy(new FengZhengJie_MsgSendProxy());
         facade.registerMediator(new FengZhengJie_Mediator());
      }
   }
}

