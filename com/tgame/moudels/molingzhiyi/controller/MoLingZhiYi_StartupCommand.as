package com.tgame.moudels.molingzhiyi.controller
{
   import com.tgame.moudels.molingzhiyi.model.MoLingZhiYi_MsgReceivedProxy;
   import com.tgame.moudels.molingzhiyi.model.MoLingZhiYi_MsgSenderProxy;
   import com.tgame.moudels.molingzhiyi.view.MoLingZhiYi_MainMediator;
   import com.tgame.moudels.molingzhiyi.view.MoLingZhiYi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MoLingZhiYi_StartupCommand extends SimpleCommand
   {
      
      public function MoLingZhiYi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MoLingZhiYi_MsgReceivedProxy());
         facade.registerProxy(new MoLingZhiYi_MsgSenderProxy());
         facade.registerMediator(new MoLingZhiYi_MainMediator());
         facade.registerMediator(new MoLingZhiYi_TargetMediator());
      }
   }
}

