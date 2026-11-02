package com.tgame.moudels.TaiXuanShenGong.controller
{
   import com.tgame.moudels.TaiXuanShenGong.model.TaiXuanShenGong_MsgReceivedProxy;
   import com.tgame.moudels.TaiXuanShenGong.model.TaiXuanShenGong_MsgSenderProxy;
   import com.tgame.moudels.TaiXuanShenGong.view.TaiXuanShenGong_Mediator;
   import com.tgame.moudels.TaiXuanShenGong.view.TaiXuanShenGong_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TaiXuanShenGong_StartupCommand extends SimpleCommand
   {
      
      public function TaiXuanShenGong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TaiXuanShenGong_MsgReceivedProxy());
         facade.registerProxy(new TaiXuanShenGong_MsgSenderProxy());
         facade.registerMediator(new TaiXuanShenGong_Mediator());
         facade.registerMediator(new TaiXuanShenGong_TargetPanelMediator());
      }
   }
}

