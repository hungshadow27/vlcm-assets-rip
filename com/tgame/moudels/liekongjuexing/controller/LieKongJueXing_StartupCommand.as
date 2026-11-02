package com.tgame.moudels.liekongjuexing.controller
{
   import com.tgame.moudels.liekongjuexing.model.LieKongJueXing_MsgReceivedProxy;
   import com.tgame.moudels.liekongjuexing.model.LieKongJueXing_MsgSenderProxy;
   import com.tgame.moudels.liekongjuexing.view.LieKongJueXing_Mediator;
   import com.tgame.moudels.liekongjuexing.view.LieKongJueXing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LieKongJueXing_StartupCommand extends SimpleCommand
   {
      
      public function LieKongJueXing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LieKongJueXing_MsgReceivedProxy());
         facade.registerProxy(new LieKongJueXing_MsgSenderProxy());
         facade.registerMediator(new LieKongJueXing_Mediator());
         facade.registerMediator(new LieKongJueXing_TargetPanelMediator());
      }
   }
}

