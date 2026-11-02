package com.tgame.moudels.mingyugong.controller
{
   import com.tgame.moudels.mingyugong.model.MingYuGong_MsgReceivedProxy;
   import com.tgame.moudels.mingyugong.model.MingYuGong_MsgSenderProxy;
   import com.tgame.moudels.mingyugong.view.MingYuGong_Mediator;
   import com.tgame.moudels.mingyugong.view.MingYuGong_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MingYuGong_StartupCommand extends SimpleCommand
   {
      
      public function MingYuGong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MingYuGong_MsgReceivedProxy());
         facade.registerProxy(new MingYuGong_MsgSenderProxy());
         facade.registerMediator(new MingYuGong_Mediator());
         facade.registerMediator(new MingYuGong_TargetPanelMediator());
      }
   }
}

