package com.tgame.moudels.biwudahui.controller
{
   import com.tgame.moudels.biwudahui.model.Biwudahui_MsgReceivedProxy;
   import com.tgame.moudels.biwudahui.model.Biwudahui_MsgSenderProxy;
   import com.tgame.moudels.biwudahui.view.Biwudahui_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Biwudahui_StartupCommand extends SimpleCommand
   {
      
      public function Biwudahui_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new Biwudahui_Mediator());
         facade.registerProxy(new Biwudahui_MsgReceivedProxy());
         facade.registerProxy(new Biwudahui_MsgSenderProxy());
      }
   }
}

