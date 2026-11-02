package com.tgame.moudels.yuLiZhen.controller
{
   import com.tgame.moudels.yuLiZhen.model.YuLiZhen_MsgReceivedProxy;
   import com.tgame.moudels.yuLiZhen.model.YuLiZhen_MsgSenderProxy;
   import com.tgame.moudels.yuLiZhen.view.YuLiZhen_Mediator;
   import com.tgame.moudels.yuLiZhen.view.YuLiZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YuLiZhen_StartupCommand extends SimpleCommand
   {
      
      public function YuLiZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YuLiZhen_MsgReceivedProxy());
         facade.registerProxy(new YuLiZhen_MsgSenderProxy());
         facade.registerMediator(new YuLiZhen_Mediator());
         facade.registerMediator(new YuLiZhen_TargetPanelMediator());
      }
   }
}

