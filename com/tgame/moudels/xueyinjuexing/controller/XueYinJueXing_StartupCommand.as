package com.tgame.moudels.xueyinjuexing.controller
{
   import com.tgame.moudels.xueyinjuexing.model.XueYinJueXing_MsgReceivedProxy;
   import com.tgame.moudels.xueyinjuexing.model.XueYinJueXing_MsgSenderProxy;
   import com.tgame.moudels.xueyinjuexing.view.XueYinJueXing_Mediator;
   import com.tgame.moudels.xueyinjuexing.view.XueYinJueXing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XueYinJueXing_StartupCommand extends SimpleCommand
   {
      
      public function XueYinJueXing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XueYinJueXing_MsgReceivedProxy());
         facade.registerProxy(new XueYinJueXing_MsgSenderProxy());
         facade.registerMediator(new XueYinJueXing_Mediator());
         facade.registerMediator(new XueYinJueXing_TargetPanelMediator());
      }
   }
}

