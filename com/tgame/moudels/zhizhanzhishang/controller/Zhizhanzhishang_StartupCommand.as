package com.tgame.moudels.zhizhanzhishang.controller
{
   import com.tgame.moudels.zhizhanzhishang.model.ZhiZhanZhiShang_MsgReceivedProxy;
   import com.tgame.moudels.zhizhanzhishang.model.ZhiZhanZhiShang_MsgSenderProxy;
   import com.tgame.moudels.zhizhanzhishang.view.ZhiZhanZhiShangLingJiang_Mediator;
   import com.tgame.moudels.zhizhanzhishang.view.ZhiZhanZhiShangTip_Mediator;
   import com.tgame.moudels.zhizhanzhishang.view.ZhiZhanZhiShang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Zhizhanzhishang_StartupCommand extends SimpleCommand
   {
      
      public function Zhizhanzhishang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZhiZhanZhiShang_MsgReceivedProxy());
         facade.registerProxy(new ZhiZhanZhiShang_MsgSenderProxy());
         facade.registerMediator(new ZhiZhanZhiShang_Mediator());
         facade.registerMediator(new ZhiZhanZhiShangLingJiang_Mediator());
         facade.registerMediator(new ZhiZhanZhiShangTip_Mediator());
      }
   }
}

