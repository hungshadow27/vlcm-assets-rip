package com.tgame.moudels.liumaishenjian.controller
{
   import com.tgame.moudels.liumaishenjian.model.Liumaishenjian_MsgReceivedProxy;
   import com.tgame.moudels.liumaishenjian.model.Liumaishenjian_MsgSenderProxy;
   import com.tgame.moudels.liumaishenjian.view.Liumaishenjian_Mediator;
   import com.tgame.moudels.liumaishenjian.view.Liumaishenjian_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Liumaishenjian_StartupCommand extends SimpleCommand
   {
      
      public function Liumaishenjian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Liumaishenjian_MsgReceivedProxy());
         facade.registerProxy(new Liumaishenjian_MsgSenderProxy());
         facade.registerMediator(new Liumaishenjian_Mediator());
         facade.registerMediator(new Liumaishenjian_TargetMediator());
      }
   }
}

