package com.tgame.moudels.baguazhen.controller
{
   import com.tgame.moudels.baguazhen.model.BaGuaZhen_MsgReceivedProxy;
   import com.tgame.moudels.baguazhen.model.BaGuaZhen_MsgSenderProxy;
   import com.tgame.moudels.baguazhen.view.BaGuaZhen_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BaGuaZhen_StartupCommand extends SimpleCommand
   {
      
      public function BaGuaZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BaGuaZhen_MsgReceivedProxy());
         facade.registerProxy(new BaGuaZhen_MsgSenderProxy());
         facade.registerMediator(new BaGuaZhen_Mediator());
      }
   }
}

