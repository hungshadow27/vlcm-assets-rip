package com.tgame.moudels.jiuyinzhenjing.controller
{
   import com.tgame.moudels.jiuyinzhenjing.model.JiuYinZhenJing_MsgReceivedProxy;
   import com.tgame.moudels.jiuyinzhenjing.model.JiuYinZhenJing_MsgSenderProxy;
   import com.tgame.moudels.jiuyinzhenjing.view.JiuYinZhenJing_LingwuPanelMediator;
   import com.tgame.moudels.jiuyinzhenjing.view.JiuYinZhenJing_PlaneMediator;
   import com.tgame.moudels.jiuyinzhenjing.view.JiuYinZhenJing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JiuYinZhenJing_StartupCommand extends SimpleCommand
   {
      
      public function JiuYinZhenJing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JiuYinZhenJing_MsgReceivedProxy());
         facade.registerProxy(new JiuYinZhenJing_MsgSenderProxy());
         facade.registerMediator(new JiuYinZhenJing_PlaneMediator());
         facade.registerMediator(new JiuYinZhenJing_LingwuPanelMediator());
         facade.registerMediator(new JiuYinZhenJing_TargetPanelMediator());
      }
   }
}

