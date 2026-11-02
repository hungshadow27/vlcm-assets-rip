package com.tgame.moudels.tianshangzhihun.controller
{
   import com.tgame.moudels.tianshangzhihun.model.TianShangZhiHun_MsgReceivedProxy;
   import com.tgame.moudels.tianshangzhihun.model.TianShangZhiHun_MsgSenderProxy;
   import com.tgame.moudels.tianshangzhihun.view.TianShangZhiHun_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TianShangZhiHun_StartupCommand extends SimpleCommand
   {
      
      public function TianShangZhiHun_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TianShangZhiHun_MsgReceivedProxy());
         facade.registerProxy(new TianShangZhiHun_MsgSenderProxy());
         facade.registerMediator(new TianShangZhiHun_Mediator());
      }
   }
}

