package com.tgame.moudels.jueZhanGuangMingDing.controller
{
   import com.tgame.moudels.jueZhanGuangMingDing.model.JueZhanGuangMingDing_MsgReceivedProxy;
   import com.tgame.moudels.jueZhanGuangMingDing.model.JueZhanGuangMingDing_MsgSenderProxy;
   import com.tgame.moudels.jueZhanGuangMingDing.view.JueZhanGuangMingDing_Mediator;
   import com.tgame.moudels.jueZhanGuangMingDing.view.JueZhanGuangMingDing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JueZhanGuangMingDing_StartupCommand extends SimpleCommand
   {
      
      public function JueZhanGuangMingDing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JueZhanGuangMingDing_MsgReceivedProxy());
         facade.registerProxy(new JueZhanGuangMingDing_MsgSenderProxy());
         facade.registerMediator(new JueZhanGuangMingDing_Mediator());
         facade.registerMediator(new JueZhanGuangMingDing_TargetPanelMediator());
      }
   }
}

