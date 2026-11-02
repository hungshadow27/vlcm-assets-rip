package com.tgame.moudels.ganjiangmoye.controller
{
   import com.tgame.moudels.ganjiangmoye.model.GanJiangMoYe_MsgReceivedProxy;
   import com.tgame.moudels.ganjiangmoye.model.GanJiangMoYe_MsgSenderProxy;
   import com.tgame.moudels.ganjiangmoye.view.GanJiangMoYe_Mediator;
   import com.tgame.moudels.ganjiangmoye.view.GanJiangMoYe_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class GanJiangMoYe_StartupCommand extends SimpleCommand
   {
      
      public function GanJiangMoYe_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new GanJiangMoYe_MsgReceivedProxy());
         facade.registerProxy(new GanJiangMoYe_MsgSenderProxy());
         facade.registerMediator(new GanJiangMoYe_Mediator());
         facade.registerMediator(new GanJiangMoYe_TargetMediator());
      }
   }
}

