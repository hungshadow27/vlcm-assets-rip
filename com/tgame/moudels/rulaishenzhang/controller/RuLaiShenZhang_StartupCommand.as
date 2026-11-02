package com.tgame.moudels.rulaishenzhang.controller
{
   import com.tgame.moudels.rulaishenzhang.model.RuLaiShenZhang_MsgReceivedProxy;
   import com.tgame.moudels.rulaishenzhang.model.RuLaiShenZhang_MsgSenderProxy;
   import com.tgame.moudels.rulaishenzhang.view.RuLaiShenZhang_MaincharPlaneMediator;
   import com.tgame.moudels.rulaishenzhang.view.RuLaiShenZhang_TargetCharPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class RuLaiShenZhang_StartupCommand extends SimpleCommand
   {
      
      public function RuLaiShenZhang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new RuLaiShenZhang_MsgReceivedProxy());
         facade.registerProxy(new RuLaiShenZhang_MsgSenderProxy());
         facade.registerMediator(new RuLaiShenZhang_MaincharPlaneMediator());
         facade.registerMediator(new RuLaiShenZhang_TargetCharPlaneMediator());
      }
   }
}

