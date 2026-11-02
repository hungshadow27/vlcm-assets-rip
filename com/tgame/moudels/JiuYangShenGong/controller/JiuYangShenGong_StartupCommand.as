package com.tgame.moudels.JiuYangShenGong.controller
{
   import com.tgame.moudels.JiuYangShenGong.model.JiuYangShenGong_MsgReceivedProxy;
   import com.tgame.moudels.JiuYangShenGong.model.JiuYangShenGong_MsgSenderProxy;
   import com.tgame.moudels.JiuYangShenGong.view.JiuYangShenGong_LingwuPanelMediator;
   import com.tgame.moudels.JiuYangShenGong.view.JiuYangShenGong_PlaneMediator;
   import com.tgame.moudels.JiuYangShenGong.view.JiuYangShenGong_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JiuYangShenGong_StartupCommand extends SimpleCommand
   {
      
      public function JiuYangShenGong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JiuYangShenGong_MsgReceivedProxy());
         facade.registerProxy(new JiuYangShenGong_MsgSenderProxy());
         facade.registerMediator(new JiuYangShenGong_PlaneMediator());
         facade.registerMediator(new JiuYangShenGong_LingwuPanelMediator());
         facade.registerMediator(new JiuYangShenGong_TargetPanelMediator());
      }
   }
}

