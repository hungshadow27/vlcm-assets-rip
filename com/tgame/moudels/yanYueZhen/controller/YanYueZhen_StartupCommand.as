package com.tgame.moudels.yanYueZhen.controller
{
   import com.tgame.moudels.yanYueZhen.model.YanYueZhen_MsgReceivedProxy;
   import com.tgame.moudels.yanYueZhen.model.YanYueZhen_MsgSenderProxy;
   import com.tgame.moudels.yanYueZhen.view.YanYueZhen_Mediator;
   import com.tgame.moudels.yanYueZhen.view.YanYueZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YanYueZhen_StartupCommand extends SimpleCommand
   {
      
      public function YanYueZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YanYueZhen_MsgReceivedProxy());
         facade.registerProxy(new YanYueZhen_MsgSenderProxy());
         facade.registerMediator(new YanYueZhen_Mediator());
         facade.registerMediator(new YanYueZhen_TargetPanelMediator());
      }
   }
}

