package com.tgame.moudels.longyajuexing.controller
{
   import com.tgame.moudels.longyajuexing.model.LongYaJueXing_MsgReceivedProxy;
   import com.tgame.moudels.longyajuexing.model.LongYaJueXing_MsgSenderProxy;
   import com.tgame.moudels.longyajuexing.view.LongYaJueXing_Mediator;
   import com.tgame.moudels.longyajuexing.view.LongYaJueXing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LongYaJueXing_StartupCommand extends SimpleCommand
   {
      
      public function LongYaJueXing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LongYaJueXing_MsgReceivedProxy());
         facade.registerProxy(new LongYaJueXing_MsgSenderProxy());
         facade.registerMediator(new LongYaJueXing_Mediator());
         facade.registerMediator(new LongYaJueXing_TargetPanelMediator());
      }
   }
}

