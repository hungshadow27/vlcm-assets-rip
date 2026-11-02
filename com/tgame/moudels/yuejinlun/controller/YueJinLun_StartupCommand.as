package com.tgame.moudels.yuejinlun.controller
{
   import com.tgame.moudels.yuejinlun.model.YueJinLun_MsgReceivedProxy;
   import com.tgame.moudels.yuejinlun.model.YueJinLun_MsgSenderProxy;
   import com.tgame.moudels.yuejinlun.view.YueJinLun_Mediator;
   import com.tgame.moudels.yuejinlun.view.YueJinLun_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YueJinLun_StartupCommand extends SimpleCommand
   {
      
      public function YueJinLun_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YueJinLun_MsgReceivedProxy());
         facade.registerProxy(new YueJinLun_MsgSenderProxy());
         facade.registerMediator(new YueJinLun_Mediator());
         facade.registerMediator(new YueJinLun_TargetPanelMediator());
      }
   }
}

