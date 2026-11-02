package com.tgame.moudels.cangjingge.controller
{
   import com.tgame.moudels.cangjingge.model.Cangjingge_MsgReceivedProxy;
   import com.tgame.moudels.cangjingge.model.Cangjingge_MsgSenderProxy;
   import com.tgame.moudels.cangjingge.view.Cangjingge_LingwuPanelMediator;
   import com.tgame.moudels.cangjingge.view.Cangjingge_PanelMediator;
   import com.tgame.moudels.cangjingge.view.Cangjingge_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Cangjingge_StartupCommand extends SimpleCommand
   {
      
      public function Cangjingge_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Cangjingge_MsgReceivedProxy());
         facade.registerProxy(new Cangjingge_MsgSenderProxy());
         facade.registerMediator(new Cangjingge_PanelMediator());
         facade.registerMediator(new Cangjingge_LingwuPanelMediator());
         facade.registerMediator(new Cangjingge_TargetPanelMediator());
      }
   }
}

