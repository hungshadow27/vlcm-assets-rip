package com.tgame.moudels.cuqiankungfu.controller
{
   import com.tgame.moudels.cuqiankungfu.model.CuQianKungFu_MsgReceivedProxy;
   import com.tgame.moudels.cuqiankungfu.model.CuQianKungFu_MsgSenderProxy;
   import com.tgame.moudels.cuqiankungfu.view.CuQianKungFu_MaincharPlaneMediator;
   import com.tgame.moudels.cuqiankungfu.view.CuQianKungFu_TargetCharPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class CuQianKungFu_StartupCommand extends SimpleCommand
   {
      
      public function CuQianKungFu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new CuQianKungFu_MsgReceivedProxy());
         facade.registerProxy(new CuQianKungFu_MsgSenderProxy());
         facade.registerMediator(new CuQianKungFu_MaincharPlaneMediator());
         facade.registerMediator(new CuQianKungFu_TargetCharPlaneMediator());
      }
   }
}

