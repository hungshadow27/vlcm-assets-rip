package com.tgame.moudels.biguan.controller
{
   import com.tgame.moudels.biguan.model.Biguan_MsgReceivedProxy;
   import com.tgame.moudels.biguan.model.Biguan_MsgSenderProxy;
   import com.tgame.moudels.biguan.view.Biguan_BiguanMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Biguan_StartUpCommand extends SimpleCommand
   {
      
      public function Biguan_StartUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new Biguan_BiguanMediator());
         facade.registerProxy(new Biguan_MsgSenderProxy());
         facade.registerProxy(new Biguan_MsgReceivedProxy());
      }
   }
}

