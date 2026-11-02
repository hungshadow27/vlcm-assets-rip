package com.tgame.moudels.fengyangzhen.controller
{
   import com.tgame.moudels.fengyangzhen.model.FengYangZhen_MsgReceivedProxy;
   import com.tgame.moudels.fengyangzhen.model.FengYangZhen_MsgSenderProxy;
   import com.tgame.moudels.fengyangzhen.view.FengYangZhen_Mediator;
   import com.tgame.moudels.fengyangzhen.view.FengYangZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class FengYangZhen_StartupCommand extends SimpleCommand
   {
      
      public function FengYangZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new FengYangZhen_MsgReceivedProxy());
         facade.registerProxy(new FengYangZhen_MsgSenderProxy());
         facade.registerMediator(new FengYangZhen_Mediator());
         facade.registerMediator(new FengYangZhen_TargetPanelMediator());
      }
   }
}

