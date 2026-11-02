package com.tgame.moudels.tushidahui.controller
{
   import com.tgame.moudels.tushidahui.model.Tushidahui_MsgReceivedProxy;
   import com.tgame.moudels.tushidahui.model.Tushidahui_MsgSenderProxy;
   import com.tgame.moudels.tushidahui.view.Tushidahui_Mediator;
   import com.tgame.moudels.tushidahui.view.Tushidahui_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Tushidahui_StartupCommand extends SimpleCommand
   {
      
      public function Tushidahui_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Tushidahui_MsgSenderProxy());
         facade.registerProxy(new Tushidahui_MsgReceivedProxy());
         facade.registerMediator(new Tushidahui_Mediator());
         facade.registerMediator(new Tushidahui_TargetPanelMediator());
      }
   }
}

