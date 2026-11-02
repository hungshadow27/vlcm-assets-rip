package com.tgame.moudels.heYiZhen.controller
{
   import com.tgame.moudels.heYiZhen.model.HeYiZhen_MsgReceivedProxy;
   import com.tgame.moudels.heYiZhen.model.HeYiZhen_MsgSenderProxy;
   import com.tgame.moudels.heYiZhen.view.HeYiZhen_Mediator;
   import com.tgame.moudels.heYiZhen.view.HeYiZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class HeYiZhen_StartupCommand extends SimpleCommand
   {
      
      public function HeYiZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new HeYiZhen_MsgReceivedProxy());
         facade.registerProxy(new HeYiZhen_MsgSenderProxy());
         facade.registerMediator(new HeYiZhen_Mediator());
         facade.registerMediator(new HeYiZhen_TargetPanelMediator());
      }
   }
}

