package com.tgame.moudels.shouji.controller
{
   import com.tgame.moudels.shouji.model.Shouji_MsgReceivedProxy;
   import com.tgame.moudels.shouji.model.Shouji_MsgSenderProxy;
   import com.tgame.moudels.shouji.model.Shouji_ShoujiProxy;
   import com.tgame.moudels.shouji.view.Shouji_ShoujiPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Shouji_StartupCommand extends SimpleCommand
   {
      
      public function Shouji_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Shouji_ShoujiProxy());
         facade.registerProxy(new Shouji_MsgSenderProxy());
         facade.registerProxy(new Shouji_MsgReceivedProxy());
         facade.registerMediator(new Shouji_ShoujiPlaneMediator());
      }
   }
}

