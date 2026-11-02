package com.tgame.moudels.pangxiezhen.controller
{
   import com.tgame.moudels.pangxiezhen.model.PangXieZhen_MsgReceivedProxy;
   import com.tgame.moudels.pangxiezhen.model.PangXieZhen_MsgSenderProxy;
   import com.tgame.moudels.pangxiezhen.view.PangXieZhen_Mediator;
   import com.tgame.moudels.pangxiezhen.view.PangXieZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class PangXieZhen_StartupCommand extends SimpleCommand
   {
      
      public function PangXieZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new PangXieZhen_MsgReceivedProxy());
         facade.registerProxy(new PangXieZhen_MsgSenderProxy());
         facade.registerMediator(new PangXieZhen_Mediator());
         facade.registerMediator(new PangXieZhen_TargetPanelMediator());
      }
   }
}

