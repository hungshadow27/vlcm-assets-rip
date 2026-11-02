package com.tgame.moudels.wanhunzhen.controller
{
   import com.tgame.moudels.wanhunzhen.model.WanHunZhen_MsgReceivedProxy;
   import com.tgame.moudels.wanhunzhen.model.WanHunZhen_MsgSenderProxy;
   import com.tgame.moudels.wanhunzhen.view.WanHunZhen_Mediator;
   import com.tgame.moudels.wanhunzhen.view.WanHunZhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WanHunZhen_StartupCommand extends SimpleCommand
   {
      
      public function WanHunZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WanHunZhen_MsgSenderProxy());
         facade.registerProxy(new WanHunZhen_MsgReceivedProxy());
         facade.registerMediator(new WanHunZhen_Mediator());
         facade.registerMediator(new WanHunZhen_TargetMediator());
      }
   }
}

