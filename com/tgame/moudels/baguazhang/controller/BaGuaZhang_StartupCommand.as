package com.tgame.moudels.baguazhang.controller
{
   import com.tgame.moudels.baguazhang.model.BaGuaZhang_MsgReceivedProxy;
   import com.tgame.moudels.baguazhang.model.BaGuaZhang_MsgSendProxy;
   import com.tgame.moudels.baguazhang.view.BaGuaZhang_Mediator;
   import com.tgame.moudels.baguazhang.view.TargetPlayerBaGuaZhang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BaGuaZhang_StartupCommand extends SimpleCommand
   {
      
      public function BaGuaZhang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BaGuaZhang_MsgReceivedProxy());
         facade.registerProxy(new BaGuaZhang_MsgSendProxy());
         facade.registerMediator(new BaGuaZhang_Mediator());
         facade.registerMediator(new TargetPlayerBaGuaZhang_Mediator());
      }
   }
}

