package com.tgame.moudels.wuxingquan.controller
{
   import com.tgame.moudels.wuxingquan.model.Wuxingquan_MsgReceivedProxy;
   import com.tgame.moudels.wuxingquan.model.Wuxingquan_MsgSenderProxy;
   import com.tgame.moudels.wuxingquan.view.Wuxingquan_LingwuPanelMediator;
   import com.tgame.moudels.wuxingquan.view.Wuxingquan_PlaneMediator;
   import com.tgame.moudels.wuxingquan.view.Wuxingquan_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Wuxingquan_StartupCommand extends SimpleCommand
   {
      
      public function Wuxingquan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Wuxingquan_MsgReceivedProxy());
         facade.registerProxy(new Wuxingquan_MsgSenderProxy());
         facade.registerMediator(new Wuxingquan_LingwuPanelMediator());
         facade.registerMediator(new Wuxingquan_PlaneMediator());
         facade.registerMediator(new Wuxingquan_TargetPanelMediator());
      }
   }
}

