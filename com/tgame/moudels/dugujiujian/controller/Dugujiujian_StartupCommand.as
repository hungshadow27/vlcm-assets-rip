package com.tgame.moudels.dugujiujian.controller
{
   import com.tgame.moudels.dugujiujian.model.Dugujiujian_MsgReceivedProxy;
   import com.tgame.moudels.dugujiujian.model.Dugujiujian_MsgSenderProxy;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_PlaneMediator;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Dugujiujian_StartupCommand extends SimpleCommand
   {
      
      public function Dugujiujian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Dugujiujian_MsgReceivedProxy());
         facade.registerProxy(new Dugujiujian_MsgSenderProxy());
         facade.registerMediator(new Dugujiujian_PlaneMediator());
         facade.registerMediator(new Dugujiujian_LingwuPanelMediator());
         facade.registerMediator(new Dugujiujian_TargetPanelMediator());
      }
   }
}

