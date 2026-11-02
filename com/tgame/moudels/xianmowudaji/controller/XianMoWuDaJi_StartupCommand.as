package com.tgame.moudels.xianmowudaji.controller
{
   import com.tgame.moudels.xianmowudaji.model.XianMoWuDaJi_MsgReceivedProxy;
   import com.tgame.moudels.xianmowudaji.model.XianMoWuDaJi_MsgSendProxy;
   import com.tgame.moudels.xianmowudaji.view.XianMoWuDaJi_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XianMoWuDaJi_StartupCommand extends SimpleCommand
   {
      
      public function XianMoWuDaJi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XianMoWuDaJi_MsgReceivedProxy());
         facade.registerProxy(new XianMoWuDaJi_MsgSendProxy());
         facade.registerMediator(new XianMoWuDaJi_Mediator());
      }
   }
}

