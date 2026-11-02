package com.tgame.moudels.kongmingquan.controller
{
   import com.tgame.moudels.kongmingquan.model.KongMingQuan_MsgReceivedProxy;
   import com.tgame.moudels.kongmingquan.model.KongMingQuan_MsgSenderProxy;
   import com.tgame.moudels.kongmingquan.view.KongMingQuan_Mediator;
   import com.tgame.moudels.kongmingquan.view.KongMingQuan_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class KongMingQuan_StartupCommand extends SimpleCommand
   {
      
      public function KongMingQuan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new KongMingQuan_MsgSenderProxy());
         facade.registerProxy(new KongMingQuan_MsgReceivedProxy());
         facade.registerMediator(new KongMingQuan_Mediator());
         facade.registerMediator(new KongMingQuan_TargetMediator());
      }
   }
}

