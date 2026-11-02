package com.tgame.moudels.yunlongzhen.controller
{
   import com.tgame.moudels.yunlongzhen.model.YunLongZhen_MsgReceivedProxy;
   import com.tgame.moudels.yunlongzhen.model.YunLongZhen_MsgSenderProxy;
   import com.tgame.moudels.yunlongzhen.view.YunLongZhen_Mediator;
   import com.tgame.moudels.yunlongzhen.view.YunLongZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YunLongZhen_StartupCommand extends SimpleCommand
   {
      
      public function YunLongZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YunLongZhen_MsgReceivedProxy());
         facade.registerProxy(new YunLongZhen_MsgSenderProxy());
         facade.registerMediator(new YunLongZhen_Mediator());
         facade.registerMediator(new YunLongZhen_TargetPanelMediator());
      }
   }
}

