package com.tgame.moudels.XiSuiJing.controller
{
   import com.tgame.moudels.XiSuiJing.model.XiSuiJing_MsgReceivedProxy;
   import com.tgame.moudels.XiSuiJing.model.XiSuiJing_MsgSenderProxy;
   import com.tgame.moudels.XiSuiJing.view.XiSuiJing_Mediator;
   import com.tgame.moudels.XiSuiJing.view.XiSuiJing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XiSuiJing_StartupCommand extends SimpleCommand
   {
      
      public function XiSuiJing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XiSuiJing_MsgReceivedProxy());
         facade.registerProxy(new XiSuiJing_MsgSenderProxy());
         facade.registerMediator(new XiSuiJing_Mediator());
         facade.registerMediator(new XiSuiJing_TargetPanelMediator());
      }
   }
}

