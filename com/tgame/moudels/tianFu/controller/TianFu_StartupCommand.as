package com.tgame.moudels.tianFu.controller
{
   import com.tgame.moudels.tianFu.model.TianFu_MsgReceivedProxy;
   import com.tgame.moudels.tianFu.model.TianFu_MsgSenderProxy;
   import com.tgame.moudels.tianFu.view.TianFuSuiPianHeChengMediator;
   import com.tgame.moudels.tianFu.view.TianFu_Mediator;
   import com.tgame.moudels.tianFu.view.TianFu_TargetPanelMediator;
   import com.tgame.moudels.tianFu.view.XiangQianTianFu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TianFu_StartupCommand extends SimpleCommand
   {
      
      public function TianFu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TianFu_MsgReceivedProxy());
         facade.registerProxy(new TianFu_MsgSenderProxy());
         facade.registerMediator(new TianFu_Mediator());
         facade.registerMediator(new TianFu_TargetPanelMediator());
         facade.registerMediator(new TianFuSuiPianHeChengMediator());
         facade.registerMediator(new XiangQianTianFu_Mediator());
      }
   }
}

