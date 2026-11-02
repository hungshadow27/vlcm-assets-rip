package com.tgame.moudels.wuxiakapai.controller
{
   import com.tgame.moudels.wuxiakapai.model.Wuxiakapai_MsgReceivedProxy;
   import com.tgame.moudels.wuxiakapai.model.Wuxiakapai_MsgSendProxy;
   import com.tgame.moudels.wuxiakapai.view.Wuxiakapai_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Wuxiakapai_StartupCommand extends SimpleCommand
   {
      
      public function Wuxiakapai_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Wuxiakapai_MsgReceivedProxy());
         facade.registerProxy(new Wuxiakapai_MsgSendProxy());
         facade.registerMediator(new Wuxiakapai_Mediator());
      }
   }
}

