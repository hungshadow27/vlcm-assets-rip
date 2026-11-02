package com.tgame.moudels.twitchGift.controller
{
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgReceivedProxy;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.moudels.twitchGift.view.Baoxiang_Mediator;
   import com.tgame.moudels.twitchGift.view.CardNumGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ExpGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.HuangJinBaoXiang_Mediator;
   import com.tgame.moudels.twitchGift.view.Liandanlu_Mediator;
   import com.tgame.moudels.twitchGift.view.MiJiGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.QianChuiBaiLian_Mediator;
   import com.tgame.moudels.twitchGift.view.QianKunGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ShouYuanGongFa_Mediator;
   import com.tgame.moudels.twitchGift.view.SquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.StoneGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.TenStarGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.TreasureMap_Advancefd_Mediator;
   import com.tgame.moudels.twitchGift.view.TreasureMap_Normal_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_ChengJiu_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_KongMingSuo_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_TianJiSuo_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_WuLiangMiZang_Mediator;
   import com.tgame.moudels.twitchGift.view.XunZhanglu_Mediator;
   import com.tgame.moudels.twitchGift.view.YuanPanGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ZhenQiGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ZuanShiBaoXing_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TwitchGift_StartDownCommand extends SimpleCommand
   {
      
      public function TwitchGift_StartDownCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TwitchGift_MsgReceivedProxy());
         facade.registerProxy(new TwitchGift_MsgSendProxy());
         facade.registerMediator(new TwitchGift_TianJiSuo_Mediator());
         facade.registerMediator(new TwitchGift_KongMingSuo_Mediator());
         facade.registerMediator(new TwitchGift_ChengJiu_Mediator());
         facade.registerMediator(new TreasureMap_Advancefd_Mediator());
         facade.registerMediator(new TreasureMap_Normal_Mediator());
         facade.registerMediator(new SquirrelGift_Mediator());
         facade.registerMediator(new ExpGoildSquirrelGift_Mediator());
         facade.registerMediator(new StoneGoildSquirrelGift_Mediator());
         facade.registerMediator(new ZhenQiGoildSquirrelGift_Mediator());
         facade.registerMediator(new MiJiGoildSquirrelGift_Mediator());
         facade.registerMediator(new TenStarGoildSquirrelGift_Mediator());
         facade.registerMediator(new CardNumGift_Mediator());
         facade.registerMediator(new QianChuiBaiLian_Mediator());
         facade.registerMediator(new QianKunGift_Mediator());
         facade.registerMediator(new TwitchGift_WuLiangMiZang_Mediator());
         facade.registerMediator(new HuangJinBaoXiang_Mediator());
         facade.registerMediator(new ZuanShiBaoXing_Mediator());
         facade.registerMediator(new Liandanlu_Mediator());
         facade.registerMediator(new Baoxiang_Mediator());
         facade.registerMediator(new XunZhanglu_Mediator());
         facade.registerMediator(new YuanPanGift_Mediator());
         facade.registerMediator(new ShouYuanGongFa_Mediator());
      }
   }
}

