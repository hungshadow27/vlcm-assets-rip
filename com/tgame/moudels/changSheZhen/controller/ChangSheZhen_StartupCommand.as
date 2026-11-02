package com.tgame.moudels.changSheZhen.controller
{
   import com.tgame.moudels.changSheZhen.model.ChangSheZhen_MsgReceivedProxy;
   import com.tgame.moudels.changSheZhen.model.ChangSheZhen_MsgSenderProxy;
   import com.tgame.moudels.changSheZhen.view.ChangSheZhen_Mediator;
   import com.tgame.moudels.changSheZhen.view.ChangSheZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ChangSheZhen_StartupCommand extends SimpleCommand
   {
      
      public function ChangSheZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ChangSheZhen_MsgReceivedProxy());
         facade.registerProxy(new ChangSheZhen_MsgSenderProxy());
         facade.registerMediator(new ChangSheZhen_Mediator());
         facade.registerMediator(new ChangSheZhen_TargetPanelMediator());
      }
   }
}

