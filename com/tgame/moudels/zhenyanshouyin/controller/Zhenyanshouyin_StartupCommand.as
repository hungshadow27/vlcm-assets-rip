package com.tgame.moudels.zhenyanshouyin.controller
{
   import com.tgame.moudels.zhenyanshouyin.model.Zhenyanshouyin_MsgReceivedProxy;
   import com.tgame.moudels.zhenyanshouyin.model.Zhenyanshouyin_MsgSenderProxy;
   import com.tgame.moudels.zhenyanshouyin.view.Zhenyanshouyin_Mediator;
   import com.tgame.moudels.zhenyanshouyin.view.Zhenyanshouyin_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Zhenyanshouyin_StartupCommand extends SimpleCommand
   {
      
      public function Zhenyanshouyin_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Zhenyanshouyin_MsgReceivedProxy());
         facade.registerProxy(new Zhenyanshouyin_MsgSenderProxy());
         facade.registerMediator(new Zhenyanshouyin_Mediator());
         facade.registerMediator(new Zhenyanshouyin_TargetPanelMediator());
      }
   }
}

