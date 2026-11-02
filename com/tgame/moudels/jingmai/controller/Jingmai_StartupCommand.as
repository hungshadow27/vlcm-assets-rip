package com.tgame.moudels.jingmai.controller
{
   import com.tgame.moudels.jingmai.model.Jingmai_MsgReceivedProxy;
   import com.tgame.moudels.jingmai.model.Jingmai_MsgSenderProxy;
   import com.tgame.moudels.jingmai.view.Jingmai_MaincharJingmaiPlaneMediator;
   import com.tgame.moudels.jingmai.view.Jingmai_TargetJingmaiPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Jingmai_StartupCommand extends SimpleCommand
   {
      
      public function Jingmai_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Jingmai_MsgReceivedProxy());
         facade.registerProxy(new Jingmai_MsgSenderProxy());
         facade.registerMediator(new Jingmai_MaincharJingmaiPlaneMediator());
         facade.registerMediator(new Jingmai_TargetJingmaiPlaneMediator());
      }
   }
}

