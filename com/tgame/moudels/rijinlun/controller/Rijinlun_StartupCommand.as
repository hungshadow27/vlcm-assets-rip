package com.tgame.moudels.rijinlun.controller
{
   import com.tgame.moudels.rijinlun.model.Rijinlun_MsgReceivedProxy;
   import com.tgame.moudels.rijinlun.model.Rijinlun_MsgSenderProxy;
   import com.tgame.moudels.rijinlun.view.Rijinlun_MainMediator;
   import com.tgame.moudels.rijinlun.view.Rijinlun_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Rijinlun_StartupCommand extends SimpleCommand
   {
      
      public function Rijinlun_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Rijinlun_MsgReceivedProxy());
         facade.registerProxy(new Rijinlun_MsgSenderProxy());
         facade.registerMediator(new Rijinlun_MainMediator());
         facade.registerMediator(new Rijinlun_TargetMediator());
      }
   }
}

