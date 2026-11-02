package com.tgame.moudels.mainui.controller
{
   import com.tgame.moudels.mainui.model.MainUI_MsgReceivedProxy;
   import com.tgame.moudels.mainui.model.MainUI_MsgSendProxy;
   import com.tgame.moudels.mainui.view.MainUI_BossRefurBishMediator;
   import com.tgame.moudels.mainui.view.MainUI_ConcernMsgMediator;
   import com.tgame.moudels.mainui.view.MainUI_LeftTopTipsMediator;
   import com.tgame.moudels.mainui.view.MainUI_MainUIMediator;
   import com.tgame.moudels.mainui.view.MainUI_MiniMapMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MainUI_StartupCommand extends SimpleCommand
   {
      
      public function MainUI_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MainUI_MsgSendProxy());
         facade.registerProxy(new MainUI_MsgReceivedProxy());
         facade.registerMediator(new MainUI_MainUIMediator());
         facade.registerMediator(new MainUI_MiniMapMediator());
         facade.registerMediator(new MainUI_ConcernMsgMediator());
         facade.registerMediator(new MainUI_BossRefurBishMediator());
         facade.registerMediator(new MainUI_LeftTopTipsMediator());
      }
   }
}

