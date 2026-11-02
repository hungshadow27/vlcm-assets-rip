package com.tgame.moudels.duanwujie.controller
{
   import com.tgame.moudels.duanwujie.model.DuanWuJie_MsgReceivedProxy;
   import com.tgame.moudels.duanwujie.model.DuanWuJie_MsgSendProxy;
   import com.tgame.moudels.duanwujie.view.DuanWuJie_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DuanWuJie_StartupCommand extends SimpleCommand
   {
      
      public function DuanWuJie_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DuanWuJie_MsgReceivedProxy());
         facade.registerProxy(new DuanWuJie_MsgSendProxy());
         facade.registerMediator(new DuanWuJie_Mediator());
      }
   }
}

