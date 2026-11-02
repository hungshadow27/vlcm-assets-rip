package com.tgame.moudels.duanwujie2015.controller
{
   import com.tgame.moudels.duanwujie2015.model.DuanWuJie2015_MsgReceivedProxy;
   import com.tgame.moudels.duanwujie2015.model.DuanWuJie2015_MsgSendProxy;
   import com.tgame.moudels.duanwujie2015.view.DuanWuJie2015_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DuanWuJie2015_StartupCommand extends SimpleCommand
   {
      
      public function DuanWuJie2015_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DuanWuJie2015_MsgReceivedProxy());
         facade.registerProxy(new DuanWuJie2015_MsgSendProxy());
         facade.registerMediator(new DuanWuJie2015_Mediator());
      }
   }
}

