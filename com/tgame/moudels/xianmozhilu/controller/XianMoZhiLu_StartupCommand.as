package com.tgame.moudels.xianmozhilu.controller
{
   import com.tgame.moudels.xianmozhilu.model.XianMoZhiLu_MsgReceivedProxy;
   import com.tgame.moudels.xianmozhilu.model.XianMoZhiLu_MsgSenderProxy;
   import com.tgame.moudels.xianmozhilu.view.XianMoZhiLu_Mediator;
   import com.tgame.moudels.xianmozhilu.view.XianMoZhiLu_ZhongZu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XianMoZhiLu_StartupCommand extends SimpleCommand
   {
      
      public function XianMoZhiLu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XianMoZhiLu_MsgSenderProxy());
         facade.registerProxy(new XianMoZhiLu_MsgReceivedProxy());
         facade.registerMediator(new XianMoZhiLu_Mediator());
         facade.registerMediator(new XianMoZhiLu_ZhongZu_Mediator());
      }
   }
}

