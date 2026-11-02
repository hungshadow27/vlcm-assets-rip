package com.tgame.moudels.yn2014zhongqiu.controller
{
   import com.tgame.moudels.yn2014zhongqiu.model.YN2014Zhongqiu_MsgReceivedProxy;
   import com.tgame.moudels.yn2014zhongqiu.model.YN2014Zhongqiu_MsgSendProxy;
   import com.tgame.moudels.yn2014zhongqiu.view.YN2014Zhongqiu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YN2014Zhongqiu_StartupCommand extends SimpleCommand
   {
      
      public function YN2014Zhongqiu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YN2014Zhongqiu_MsgReceivedProxy());
         facade.registerProxy(new YN2014Zhongqiu_MsgSendProxy());
         facade.registerMediator(new YN2014Zhongqiu_Mediator());
      }
   }
}

