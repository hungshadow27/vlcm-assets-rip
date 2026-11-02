package com.tgame.moudels.baoshijianshang.controller
{
   import com.tgame.moudels.baoshijianshang.model.BaoShiJianShang_MsgReceivedProxy;
   import com.tgame.moudels.baoshijianshang.model.BaoShiJianShang_MsgSenderProxy;
   import com.tgame.moudels.baoshijianshang.view.BaoShiJianShang_BaoShiJianShangMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BaoShiJianShang_StartUpCommand extends SimpleCommand
   {
      
      public function BaoShiJianShang_StartUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new BaoShiJianShang_BaoShiJianShangMediator());
         facade.registerProxy(new BaoShiJianShang_MsgReceivedProxy());
         facade.registerProxy(new BaoShiJianShang_MsgSenderProxy());
      }
   }
}

