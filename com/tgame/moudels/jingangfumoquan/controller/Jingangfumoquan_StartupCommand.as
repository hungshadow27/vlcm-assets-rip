package com.tgame.moudels.jingangfumoquan.controller
{
   import com.tgame.moudels.jingangfumoquan.model.Jingangfumoquan_MsgReceivedProxy;
   import com.tgame.moudels.jingangfumoquan.model.Jingangfumoquan_MsgSenderProxy;
   import com.tgame.moudels.jingangfumoquan.view.Jingangfumoquan_PanelMediator;
   import com.tgame.moudels.jingangfumoquan.view.Jingangfumoquan_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Jingangfumoquan_StartupCommand extends SimpleCommand
   {
      
      public function Jingangfumoquan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Jingangfumoquan_MsgReceivedProxy());
         facade.registerProxy(new Jingangfumoquan_MsgSenderProxy());
         facade.registerMediator(new Jingangfumoquan_PanelMediator());
         facade.registerMediator(new Jingangfumoquan_TargetPanelMediator());
      }
   }
}

