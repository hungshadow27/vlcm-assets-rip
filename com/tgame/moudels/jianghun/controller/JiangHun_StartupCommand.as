package com.tgame.moudels.jianghun.controller
{
   import com.tgame.moudels.jianghun.model.JiangHun_MsgReceivedProxy;
   import com.tgame.moudels.jianghun.model.JiangHun_MsgSenderProxy;
   import com.tgame.moudels.jianghun.view.JiangHun_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JiangHun_StartupCommand extends SimpleCommand
   {
      
      public function JiangHun_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JiangHun_MsgReceivedProxy());
         facade.registerProxy(new JiangHun_MsgSenderProxy());
         facade.registerMediator(new JiangHun_Mediator());
      }
   }
}

