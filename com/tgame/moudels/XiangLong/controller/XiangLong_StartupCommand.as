package com.tgame.moudels.XiangLong.controller
{
   import com.tgame.moudels.XiangLong.model.XiangLong_MsgReceivedProxy;
   import com.tgame.moudels.XiangLong.model.XiangLong_MsgSenderProxy;
   import com.tgame.moudels.XiangLong.view.XiangLong_LingwuPanelMediator;
   import com.tgame.moudels.XiangLong.view.XiangLong_PlaneMediator;
   import com.tgame.moudels.XiangLong.view.XiangLong_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XiangLong_StartupCommand extends SimpleCommand
   {
      
      public function XiangLong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XiangLong_MsgReceivedProxy());
         facade.registerProxy(new XiangLong_MsgSenderProxy());
         facade.registerMediator(new XiangLong_PlaneMediator());
         facade.registerMediator(new XiangLong_LingwuPanelMediator());
         facade.registerMediator(new XiangLong_TargetPanelMediator());
      }
   }
}

