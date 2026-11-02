package com.tgame.moudels.tulongdao.controller
{
   import com.tgame.moudels.tulongdao.model.TuLongDao_MsgReceivedProxy;
   import com.tgame.moudels.tulongdao.model.TuLongDao_MsgSenderProxy;
   import com.tgame.moudels.tulongdao.view.TuLongDaoFuBen_Mediator;
   import com.tgame.moudels.tulongdao.view.TuLongDao_Mediator;
   import com.tgame.moudels.tulongdao.view.TuLongDao_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TuLongDao_StartupCommand extends SimpleCommand
   {
      
      public function TuLongDao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TuLongDao_MsgReceivedProxy());
         facade.registerProxy(new TuLongDao_MsgSenderProxy());
         facade.registerMediator(new TuLongDao_Mediator());
         facade.registerMediator(new TuLongDao_TargetPanelMediator());
         facade.registerMediator(new TuLongDaoFuBen_Mediator());
      }
   }
}

