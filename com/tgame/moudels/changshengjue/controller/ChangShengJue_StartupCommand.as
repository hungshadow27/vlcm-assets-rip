package com.tgame.moudels.changshengjue.controller
{
   import com.tgame.moudels.changshengjue.model.ChangShengJue_MsgReceivedProxy;
   import com.tgame.moudels.changshengjue.model.ChangShengJue_MsgSenderProxy;
   import com.tgame.moudels.changshengjue.view.ChangShengJue_Mediator;
   import com.tgame.moudels.changshengjue.view.ChangShengJue_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ChangShengJue_StartupCommand extends SimpleCommand
   {
      
      public function ChangShengJue_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ChangShengJue_MsgSenderProxy());
         facade.registerProxy(new ChangShengJue_MsgReceivedProxy());
         facade.registerMediator(new ChangShengJue_Mediator());
         facade.registerMediator(new ChangShengJue_TargetMediator());
      }
   }
}

