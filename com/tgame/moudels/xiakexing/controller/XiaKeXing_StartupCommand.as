package com.tgame.moudels.xiakexing.controller
{
   import com.tgame.moudels.xiakexing.model.XiaKeXing_MsgReceivedProxy;
   import com.tgame.moudels.xiakexing.model.XiaKeXing_MsgSenderProxy;
   import com.tgame.moudels.xiakexing.view.XiaKeXing_Mediator;
   import com.tgame.moudels.xiakexing.view.XiaKeXing_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XiaKeXing_StartupCommand extends SimpleCommand
   {
      
      public function XiaKeXing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XiaKeXing_MsgSenderProxy());
         facade.registerProxy(new XiaKeXing_MsgReceivedProxy());
         facade.registerMediator(new XiaKeXing_Mediator());
         facade.registerMediator(new XiaKeXing_TargetMediator());
      }
   }
}

