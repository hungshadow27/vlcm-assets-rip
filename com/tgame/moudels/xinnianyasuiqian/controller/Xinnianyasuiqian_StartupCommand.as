package com.tgame.moudels.xinnianyasuiqian.controller
{
   import com.tgame.moudels.xinnianyasuiqian.model.Xinnianyasuiqian_MsgReceivedProxy;
   import com.tgame.moudels.xinnianyasuiqian.model.Xinnianyasuiqian_MsgSenderProxy;
   import com.tgame.moudels.xinnianyasuiqian.view.UI_XinnianyasuiqianKanWanJia_Mediator;
   import com.tgame.moudels.xinnianyasuiqian.view.Xinnianyasuiqian_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Xinnianyasuiqian_StartupCommand extends SimpleCommand
   {
      
      public function Xinnianyasuiqian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new Xinnianyasuiqian_Mediator());
         facade.registerProxy(new Xinnianyasuiqian_MsgReceivedProxy());
         facade.registerProxy(new Xinnianyasuiqian_MsgSenderProxy());
         facade.registerMediator(new UI_XinnianyasuiqianKanWanJia_Mediator());
      }
   }
}

