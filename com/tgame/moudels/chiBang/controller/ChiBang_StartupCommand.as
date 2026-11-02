package com.tgame.moudels.chiBang.controller
{
   import com.tgame.moudels.chiBang.model.ChiBang_MsgReceivedProxy;
   import com.tgame.moudels.chiBang.model.ChiBang_MsgSenderProxy;
   import com.tgame.moudels.chiBang.view.ChiBang_MainMediator;
   import com.tgame.moudels.chiBang.view.ChiBang_TargetMediator;
   import com.tgame.moudels.chiBang.view.ChiBang_changjingMediator;
   import com.tgame.moudels.chiBang.view.XinMo_mediator;
   import com.tgame.moudels.chiBang.view.YuLingHeCheng_mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ChiBang_StartupCommand extends SimpleCommand
   {
      
      public function ChiBang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ChiBang_MsgReceivedProxy());
         facade.registerProxy(new ChiBang_MsgSenderProxy());
         facade.registerMediator(new ChiBang_MainMediator());
         facade.registerMediator(new ChiBang_TargetMediator());
         facade.registerMediator(new YuLingHeCheng_mediator());
         facade.registerMediator(new ChiBang_changjingMediator());
         facade.registerMediator(new XinMo_mediator());
      }
   }
}

