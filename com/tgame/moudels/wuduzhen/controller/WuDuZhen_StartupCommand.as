package com.tgame.moudels.wuduzhen.controller
{
   import com.tgame.moudels.wuduzhen.model.WuDuZhen_MsgReceivedProxy;
   import com.tgame.moudels.wuduzhen.model.WuDuZhen_MsgSenderProxy;
   import com.tgame.moudels.wuduzhen.view.WuDuZhen_Mediator;
   import com.tgame.moudels.wuduzhen.view.WuDuZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WuDuZhen_StartupCommand extends SimpleCommand
   {
      
      public function WuDuZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WuDuZhen_MsgReceivedProxy());
         facade.registerProxy(new WuDuZhen_MsgSenderProxy());
         facade.registerMediator(new WuDuZhen_Mediator());
         facade.registerMediator(new WuDuZhen_TargetPanelMediator());
      }
   }
}

