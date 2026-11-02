package com.tgame.moudels.gerenchenghao.controller
{
   import com.tgame.moudels.gerenchenghao.model.GeRenChengHao_MsgReceivedProxy;
   import com.tgame.moudels.gerenchenghao.model.GeRenChengHao_MsgSenderProxy;
   import com.tgame.moudels.gerenchenghao.view.GeRenChengHao_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class GeRenChengHao_StartupCommand extends SimpleCommand
   {
      
      public function GeRenChengHao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new GeRenChengHao_MsgReceivedProxy());
         facade.registerProxy(new GeRenChengHao_MsgSenderProxy());
         facade.registerMediator(new GeRenChengHao_Mediator());
      }
   }
}

