package com.tgame.moudels.rank.controller
{
   import com.tgame.moudels.rank.Rank_ApplicationFacade;
   import com.tgame.moudels.rank.model.Rank_MsgReceivedProxy;
   import com.tgame.moudels.rank.model.Rank_MsgSendProxy;
   import com.tgame.moudels.rank.view.Rank_AttackPanelMediator;
   import com.tgame.moudels.rank.view.Rank_FBRankMediator;
   import com.tgame.moudels.rank.view.Rank_RankMediator;
   import com.tgame.moudels.rank.view.Rank_YNMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Rank_StartupCommand extends SimpleCommand
   {
      
      public function Rank_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerCommand(Rank_ApplicationFacade.SEND_CHONGBAI_BISHI,Rand_OtherSendMsgCommand);
         facade.registerProxy(new Rank_MsgSendProxy());
         facade.registerProxy(new Rank_MsgReceivedProxy());
         facade.registerMediator(new Rank_RankMediator());
         facade.registerMediator(new Rank_FBRankMediator());
         facade.registerMediator(new Rank_AttackPanelMediator());
         facade.registerMediator(new Rank_YNMediator());
      }
   }
}

