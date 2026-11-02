package com.tgame.moudels.moving.controller
{
   import com.tgame.moudels.moving.model.Moving_MsgSendProxy;
   import com.tgame.moudels.moving.view.Moving_MovingMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Moving_StartupCommand extends SimpleCommand
   {
      
      public function Moving_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Moving_MsgSendProxy());
         facade.registerMediator(new Moving_MovingMediator());
      }
   }
}

