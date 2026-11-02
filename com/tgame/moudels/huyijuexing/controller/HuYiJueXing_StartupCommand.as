package com.tgame.moudels.huyijuexing.controller
{
   import com.tgame.moudels.huyijuexing.model.HuYiJueXing_MsgReceivedProxy;
   import com.tgame.moudels.huyijuexing.model.HuYiJueXing_MsgSenderProxy;
   import com.tgame.moudels.huyijuexing.view.HuYiJueXingXiangQian_Mediator;
   import com.tgame.moudels.huyijuexing.view.HuYiJueXing_Mediator;
   import com.tgame.moudels.huyijuexing.view.HuYiJueXing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class HuYiJueXing_StartupCommand extends SimpleCommand
   {
      
      public function HuYiJueXing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new HuYiJueXing_MsgReceivedProxy());
         facade.registerProxy(new HuYiJueXing_MsgSenderProxy());
         facade.registerMediator(new HuYiJueXing_Mediator());
         facade.registerMediator(new HuYiJueXing_TargetPanelMediator());
         facade.registerMediator(new HuYiJueXingXiangQian_Mediator());
      }
   }
}

