package com.tgame.moudels.silingzhen.controller
{
   import com.tgame.moudels.silingzhen.model.SiLingZhen_MsgReceivedProxy;
   import com.tgame.moudels.silingzhen.model.SiLingZhen_MsgSenderProxy;
   import com.tgame.moudels.silingzhen.view.SiLingZhenYinCangShuXing_Mediator;
   import com.tgame.moudels.silingzhen.view.SiLingZhen_Mediator;
   import com.tgame.moudels.silingzhen.view.SiLingZhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class SiLingZhen_StartupCommand extends SimpleCommand
   {
      
      public function SiLingZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new SiLingZhen_MsgReceivedProxy());
         facade.registerProxy(new SiLingZhen_MsgSenderProxy());
         facade.registerMediator(new SiLingZhen_Mediator());
         facade.registerMediator(new SiLingZhen_TargetMediator());
         facade.registerMediator(new SiLingZhenYinCangShuXing_Mediator());
      }
   }
}

