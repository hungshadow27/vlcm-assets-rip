package com.tgame.moudels.zhanhun.controller
{
   import com.tgame.moudels.zhanhun.model.Zhanhun_MsgReceivedProxy;
   import com.tgame.moudels.zhanhun.model.Zhanhun_MsgSenderProxy;
   import com.tgame.moudels.zhanhun.view.Zhanhun_Mediator;
   import com.tgame.moudels.zhanhun.view.Zhanhun_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Zhanhun_StartupCommand extends SimpleCommand
   {
      
      public function Zhanhun_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Zhanhun_MsgReceivedProxy());
         facade.registerProxy(new Zhanhun_MsgSenderProxy());
         facade.registerMediator(new Zhanhun_Mediator());
         facade.registerMediator(new Zhanhun_TargetPanelMediator());
      }
   }
}

