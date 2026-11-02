package com.tgame.moudels.qishangquan.controller
{
   import com.tgame.moudels.qishangquan.model.QiShangQuan_MsgReceivedProxy;
   import com.tgame.moudels.qishangquan.model.QiShangQuan_MsgSenderProxy;
   import com.tgame.moudels.qishangquan.view.QiShangQuan_PlaneMediator;
   import com.tgame.moudels.qishangquan.view.QiShangQuan_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QiShangQuan_StartupCommand extends SimpleCommand
   {
      
      public function QiShangQuan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QiShangQuan_MsgReceivedProxy());
         facade.registerProxy(new QiShangQuan_MsgSenderProxy());
         facade.registerMediator(new QiShangQuan_PlaneMediator());
         facade.registerMediator(new QiShangQuan_TargetPanelMediator());
      }
   }
}

