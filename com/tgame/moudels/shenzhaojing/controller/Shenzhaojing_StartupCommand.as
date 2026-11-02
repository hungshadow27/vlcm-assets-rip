package com.tgame.moudels.shenzhaojing.controller
{
   import com.tgame.moudels.shenzhaojing.model.Shenzhaojing_MsgReceivedProxy;
   import com.tgame.moudels.shenzhaojing.model.Shenzhaojing_MsgSenderProxy;
   import com.tgame.moudels.shenzhaojing.view.Shenzhaojing_PanelMediator;
   import com.tgame.moudels.shenzhaojing.view.Shenzhaojing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Shenzhaojing_StartupCommand extends SimpleCommand
   {
      
      public function Shenzhaojing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Shenzhaojing_MsgReceivedProxy());
         facade.registerProxy(new Shenzhaojing_MsgSenderProxy());
         facade.registerMediator(new Shenzhaojing_PanelMediator());
         facade.registerMediator(new Shenzhaojing_TargetPanelMediator());
      }
   }
}

