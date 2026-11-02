package com.tgame.moudels.lianti.controller
{
   import com.tgame.moudels.lianti.model.Lianti_MsgReceivedProxy;
   import com.tgame.moudels.lianti.model.Lianti_MsgSenderProxy;
   import com.tgame.moudels.lianti.view.Lianti_MaincharLiantiPanelMediator;
   import com.tgame.moudels.lianti.view.Lianti_TargetLiantiPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Lianti_StartupCommand extends SimpleCommand
   {
      
      public function Lianti_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Lianti_MsgReceivedProxy());
         facade.registerProxy(new Lianti_MsgSenderProxy());
         facade.registerMediator(new Lianti_MaincharLiantiPanelMediator());
         facade.registerMediator(new Lianti_TargetLiantiPanelMediator());
      }
   }
}

