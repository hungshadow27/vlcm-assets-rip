package com.tgame.moudels.wuxingzhen.controller
{
   import com.tgame.moudels.wuxingzhen.model.WuXingZhen_MsgReceivedProxy;
   import com.tgame.moudels.wuxingzhen.model.WuXingZhen_MsgSenderProxy;
   import com.tgame.moudels.wuxingzhen.view.WuXingZhen_Mediator;
   import com.tgame.moudels.wuxingzhen.view.WuXingZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WuXingZhen_StartupCommand extends SimpleCommand
   {
      
      public function WuXingZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WuXingZhen_MsgReceivedProxy());
         facade.registerProxy(new WuXingZhen_MsgSenderProxy());
         facade.registerMediator(new WuXingZhen_Mediator());
         facade.registerMediator(new WuXingZhen_TargetPanelMediator());
      }
   }
}

