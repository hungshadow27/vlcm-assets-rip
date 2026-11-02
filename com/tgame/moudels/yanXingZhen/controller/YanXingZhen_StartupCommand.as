package com.tgame.moudels.yanXingZhen.controller
{
   import com.tgame.moudels.yanXingZhen.model.YanXingZhen_MsgReceivedProxy;
   import com.tgame.moudels.yanXingZhen.model.YanXingZhen_MsgSenderProxy;
   import com.tgame.moudels.yanXingZhen.view.YanXingZhen_Mediator;
   import com.tgame.moudels.yanXingZhen.view.YanXingZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YanXingZhen_StartupCommand extends SimpleCommand
   {
      
      public function YanXingZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YanXingZhen_MsgReceivedProxy());
         facade.registerProxy(new YanXingZhen_MsgSenderProxy());
         facade.registerMediator(new YanXingZhen_Mediator());
         facade.registerMediator(new YanXingZhen_TargetPanelMediator());
      }
   }
}

