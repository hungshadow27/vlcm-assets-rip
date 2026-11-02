package com.tgame.moudels.zhanhunhuode.controller
{
   import com.tgame.moudels.zhanhunhuode.model.Zhanhunhuode_MsgReceivedProxy;
   import com.tgame.moudels.zhanhunhuode.model.Zhanhunhuode_MsgSenderProxy;
   import com.tgame.moudels.zhanhunhuode.view.Zhanhunhuode_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Zhanhunhuode_StartupCommand extends SimpleCommand
   {
      
      public function Zhanhunhuode_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Zhanhunhuode_MsgReceivedProxy());
         facade.registerProxy(new Zhanhunhuode_MsgSenderProxy());
         facade.registerMediator(new Zhanhunhuode_Mediator());
      }
   }
}

