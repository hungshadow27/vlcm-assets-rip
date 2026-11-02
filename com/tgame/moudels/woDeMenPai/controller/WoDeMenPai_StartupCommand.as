package com.tgame.moudels.woDeMenPai.controller
{
   import com.tgame.moudels.woDeMenPai.model.WoDeMenPai_MsgReceivedProxy;
   import com.tgame.moudels.woDeMenPai.model.WoDeMenPai_MsgSenderProxy;
   import com.tgame.moudels.woDeMenPai.view.WoDeChuanGong_Mediator;
   import com.tgame.moudels.woDeMenPai.view.WoDeMenPai_Mediator;
   import com.tgame.moudels.woDeMenPai.view.WoDeMenPai_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WoDeMenPai_StartupCommand extends SimpleCommand
   {
      
      public function WoDeMenPai_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WoDeMenPai_MsgSenderProxy());
         facade.registerProxy(new WoDeMenPai_MsgReceivedProxy());
         facade.registerMediator(new WoDeMenPai_Mediator());
         facade.registerMediator(new WoDeChuanGong_Mediator());
         facade.registerMediator(new WoDeMenPai_TargetMediator());
      }
   }
}

