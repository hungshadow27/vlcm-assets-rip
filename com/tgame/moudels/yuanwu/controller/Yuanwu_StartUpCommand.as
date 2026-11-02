package com.tgame.moudels.yuanwu.controller
{
   import com.tgame.moudels.yuanwu.model.Yuanwu_ReceivedProxy;
   import com.tgame.moudels.yuanwu.model.Yuanwu_SenderProxy;
   import com.tgame.moudels.yuanwu.view.YuanwuHeXin_Mediator;
   import com.tgame.moudels.yuanwu.view.Yuanwu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Yuanwu_StartUpCommand extends SimpleCommand
   {
      
      public function Yuanwu_StartUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new Yuanwu_Mediator());
         facade.registerMediator(new YuanwuHeXin_Mediator());
         facade.registerProxy(new Yuanwu_ReceivedProxy());
         facade.registerProxy(new Yuanwu_SenderProxy());
      }
   }
}

