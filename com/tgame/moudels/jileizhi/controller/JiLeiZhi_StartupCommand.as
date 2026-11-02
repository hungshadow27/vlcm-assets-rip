package com.tgame.moudels.jileizhi.controller
{
   import com.tgame.moudels.jileizhi.model.JiLeiZhi_MsgReceivedProxy;
   import com.tgame.moudels.jileizhi.model.JiLeiZhi_MsgSenderProxy;
   import com.tgame.moudels.jileizhi.view.JiLeiZhi_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JiLeiZhi_StartupCommand extends SimpleCommand
   {
      
      public function JiLeiZhi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JiLeiZhi_MsgReceivedProxy());
         facade.registerProxy(new JiLeiZhi_MsgSenderProxy());
         facade.registerMediator(new JiLeiZhi_Mediator());
      }
   }
}

