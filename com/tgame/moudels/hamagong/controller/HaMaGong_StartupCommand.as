package com.tgame.moudels.hamagong.controller
{
   import com.tgame.moudels.hamagong.model.HaMaGong_MsgReceivedProxy;
   import com.tgame.moudels.hamagong.model.HaMaGong_MsgSenderProxy;
   import com.tgame.moudels.hamagong.view.HaMaGong_Mediator;
   import com.tgame.moudels.hamagong.view.HaMaGong_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class HaMaGong_StartupCommand extends SimpleCommand
   {
      
      public function HaMaGong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new HaMaGong_MsgReceivedProxy());
         facade.registerProxy(new HaMaGong_MsgSenderProxy());
         facade.registerMediator(new HaMaGong_Mediator());
         facade.registerMediator(new HaMaGong_TargetMediator());
      }
   }
}

