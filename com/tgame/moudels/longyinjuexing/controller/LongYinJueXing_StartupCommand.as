package com.tgame.moudels.longyinjuexing.controller
{
   import com.tgame.moudels.longyinjuexing.model.LongYinJueXing_MsgReceivedProxy;
   import com.tgame.moudels.longyinjuexing.model.LongYinJueXing_MsgSenderProxy;
   import com.tgame.moudels.longyinjuexing.view.LongYinJueXing_Mediator;
   import com.tgame.moudels.longyinjuexing.view.LongYinJueXing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LongYinJueXing_StartupCommand extends SimpleCommand
   {
      
      public function LongYinJueXing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LongYinJueXing_MsgReceivedProxy());
         facade.registerProxy(new LongYinJueXing_MsgSenderProxy());
         facade.registerMediator(new LongYinJueXing_Mediator());
         facade.registerMediator(new LongYinJueXing_TargetPanelMediator());
      }
   }
}

