package com.tgame.moudels.quanshenjuexing.controller
{
   import com.tgame.moudels.quanshenjuexing.model.QuanShenJueXing_MsgReceivedProxy;
   import com.tgame.moudels.quanshenjuexing.model.QuanShenJueXing_MsgSenderProxy;
   import com.tgame.moudels.quanshenjuexing.view.QuanShenJueXing_Mediator;
   import com.tgame.moudels.quanshenjuexing.view.QuanShenJueXing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QuanShenJueXing_StartupCommand extends SimpleCommand
   {
      
      public function QuanShenJueXing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QuanShenJueXing_MsgReceivedProxy());
         facade.registerProxy(new QuanShenJueXing_MsgSenderProxy());
         facade.registerMediator(new QuanShenJueXing_Mediator());
         facade.registerMediator(new QuanShenJueXing_TargetPanelMediator());
      }
   }
}

