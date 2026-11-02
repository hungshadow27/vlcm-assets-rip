package com.tgame.moudels.BeiMingShenGong.controller
{
   import com.tgame.moudels.BeiMingShenGong.model.BeiMingShenGong_MsgReceivedProxy;
   import com.tgame.moudels.BeiMingShenGong.model.BeiMingShenGong_MsgSenderProxy;
   import com.tgame.moudels.BeiMingShenGong.view.BeiMingShenGong_Mediator;
   import com.tgame.moudels.BeiMingShenGong.view.BeiMingShenGong_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BeiMingShenGong_StartupCommand extends SimpleCommand
   {
      
      public function BeiMingShenGong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BeiMingShenGong_MsgReceivedProxy());
         facade.registerProxy(new BeiMingShenGong_MsgSenderProxy());
         facade.registerMediator(new BeiMingShenGong_Mediator());
         facade.registerMediator(new BeiMingShenGong_TargetPanelMediator());
      }
   }
}

