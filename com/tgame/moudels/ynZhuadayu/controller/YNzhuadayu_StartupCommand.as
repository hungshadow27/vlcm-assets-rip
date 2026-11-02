package com.tgame.moudels.ynZhuadayu.controller
{
   import com.tgame.moudels.ynZhuadayu.model.YNzhuadayu_MsgReceivedProxy;
   import com.tgame.moudels.ynZhuadayu.model.YNzhuadayu_MsgSendProxy;
   import com.tgame.moudels.ynZhuadayu.view.YNzhuadayu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNzhuadayu_StartupCommand extends SimpleCommand
   {
      
      public function YNzhuadayu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNzhuadayu_MsgReceivedProxy());
         facade.registerProxy(new YNzhuadayu_MsgSendProxy());
         facade.registerMediator(new YNzhuadayu_Mediator());
      }
   }
}

