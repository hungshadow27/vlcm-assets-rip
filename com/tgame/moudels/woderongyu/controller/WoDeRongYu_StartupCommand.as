package com.tgame.moudels.woderongyu.controller
{
   import com.tgame.moudels.woderongyu.model.WoDeRongYu_MsgReceivedProxy;
   import com.tgame.moudels.woderongyu.model.WoDeRongYu_MsgSenderProxy;
   import com.tgame.moudels.woderongyu.view.WoDeRongYu_Mediator;
   import com.tgame.moudels.woderongyu.view.WoDeRongYu_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WoDeRongYu_StartupCommand extends SimpleCommand
   {
      
      public function WoDeRongYu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WoDeRongYu_MsgSenderProxy());
         facade.registerProxy(new WoDeRongYu_MsgReceivedProxy());
         facade.registerMediator(new WoDeRongYu_Mediator());
         facade.registerMediator(new WoDeRongYu_TargetMediator());
      }
   }
}

