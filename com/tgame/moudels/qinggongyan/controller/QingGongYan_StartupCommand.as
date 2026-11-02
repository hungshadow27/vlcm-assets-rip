package com.tgame.moudels.qinggongyan.controller
{
   import com.tgame.moudels.qinggongyan.model.QingGongYan_MsgReceivedProxy;
   import com.tgame.moudels.qinggongyan.model.QingGongYan_MsgSenderProxy;
   import com.tgame.moudels.qinggongyan.view.QingGongYanOver_PanelMediator;
   import com.tgame.moudels.qinggongyan.view.QingGongYan_PanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QingGongYan_StartupCommand extends SimpleCommand
   {
      
      public function QingGongYan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QingGongYan_MsgReceivedProxy());
         facade.registerProxy(new QingGongYan_MsgSenderProxy());
         facade.registerMediator(new QingGongYan_PanelMediator());
         facade.registerMediator(new QingGongYanOver_PanelMediator());
      }
   }
}

