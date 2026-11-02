package com.tgame.moudels.huashanlunjian.controller
{
   import com.tgame.moudels.huashanlunjian.model.Huashanlunjian_MsgReceivedProxy;
   import com.tgame.moudels.huashanlunjian.model.Huashanlunjian_MsgSenderProxy;
   import com.tgame.moudels.huashanlunjian.view.Huashanlunjian_Mediator;
   import com.tgame.moudels.huashanlunjian.view.Huashanlunjian_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Huashanlunjian_StartupCommand extends SimpleCommand
   {
      
      public function Huashanlunjian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Huashanlunjian_MsgReceivedProxy());
         facade.registerProxy(new Huashanlunjian_MsgSenderProxy());
         facade.registerMediator(new Huashanlunjian_Mediator());
         facade.registerMediator(new Huashanlunjian_TargetPanelMediator());
      }
   }
}

