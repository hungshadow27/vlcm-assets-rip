package com.tgame.moudels.mall.controller
{
   import com.tgame.moudels.mall.model.Mall_MsgReceivedProxy;
   import com.tgame.moudels.mall.model.Mall_MsgSenderProxy;
   import com.tgame.moudels.mall.view.Mall_FreeCadeMediator;
   import com.tgame.moudels.mall.view.Mall_JiFenMediator;
   import com.tgame.moudels.mall.view.Mall_LabourMediator;
   import com.tgame.moudels.mall.view.Mall_LunJianMediator;
   import com.tgame.moudels.mall.view.Mall_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Mall_StartupCommand extends SimpleCommand
   {
      
      public function Mall_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Mall_MsgReceivedProxy());
         facade.registerProxy(new Mall_MsgSenderProxy());
         facade.registerMediator(new Mall_Mediator());
         facade.registerMediator(new Mall_LabourMediator());
         facade.registerMediator(new Mall_LunJianMediator());
         facade.registerMediator(new Mall_FreeCadeMediator());
         facade.registerMediator(new Mall_JiFenMediator());
      }
   }
}

