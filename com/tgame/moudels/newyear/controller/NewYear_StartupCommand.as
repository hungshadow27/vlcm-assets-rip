package com.tgame.moudels.newyear.controller
{
   import com.tgame.moudels.newyear.model.NewYear_MsgReceivedProxy;
   import com.tgame.moudels.newyear.model.NewYear_MsgSenderProxy;
   import com.tgame.moudels.newyear.view.ChunLian_Mediator;
   import com.tgame.moudels.newyear.view.NewYear_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class NewYear_StartupCommand extends SimpleCommand
   {
      
      public function NewYear_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new NewYear_MsgReceivedProxy());
         facade.registerProxy(new NewYear_MsgSenderProxy());
         facade.registerMediator(new NewYear_Mediator());
         facade.registerMediator(new ChunLian_Mediator());
      }
   }
}

