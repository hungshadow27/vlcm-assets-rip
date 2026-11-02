package com.tgame.moudels.timebaozang.controller
{
   import com.tgame.moudels.timebaozang.model.TimeBaoZang_MsgReceivedProxy;
   import com.tgame.moudels.timebaozang.model.TimeBaoZang_MsgSenderProxy;
   import com.tgame.moudels.timebaozang.view.TimeBaoZang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TimeBaoZang_StartupCommand extends SimpleCommand
   {
      
      public function TimeBaoZang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TimeBaoZang_MsgSenderProxy());
         facade.registerProxy(new TimeBaoZang_MsgReceivedProxy());
         facade.registerMediator(new TimeBaoZang_Mediator());
      }
   }
}

