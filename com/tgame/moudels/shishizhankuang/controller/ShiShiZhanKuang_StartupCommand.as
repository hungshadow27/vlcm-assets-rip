package com.tgame.moudels.shishizhankuang.controller
{
   import com.tgame.moudels.shishizhankuang.model.Shishizhankuang_MsgReceivedProxy;
   import com.tgame.moudels.shishizhankuang.model.Shishizhankuang_MsgSenderProxy;
   import com.tgame.moudels.shishizhankuang.view.ShishiZhankuang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShiShiZhanKuang_StartupCommand extends SimpleCommand
   {
      
      public function ShiShiZhanKuang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Shishizhankuang_MsgReceivedProxy());
         facade.registerProxy(new Shishizhankuang_MsgSenderProxy());
         facade.registerMediator(new ShishiZhankuang_Mediator());
      }
   }
}

