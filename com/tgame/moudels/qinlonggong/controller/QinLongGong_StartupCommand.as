package com.tgame.moudels.qinlonggong.controller
{
   import com.tgame.moudels.qinlonggong.model.QinLongGong_MsgReceivedProxy;
   import com.tgame.moudels.qinlonggong.model.QinLongGong_MsgSenderProxy;
   import com.tgame.moudels.qinlonggong.view.QinLongGong_Mediator;
   import com.tgame.moudels.qinlonggong.view.QinLongGong_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QinLongGong_StartupCommand extends SimpleCommand
   {
      
      public function QinLongGong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QinLongGong_MsgSenderProxy());
         facade.registerProxy(new QinLongGong_MsgReceivedProxy());
         facade.registerMediator(new QinLongGong_Mediator());
         facade.registerMediator(new QinLongGong_TargetMediator());
      }
   }
}

