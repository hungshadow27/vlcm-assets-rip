package com.tgame.moudels.duomingshisanjian.controller
{
   import com.tgame.moudels.duomingshisanjian.model.DuoMingShiSanJian_MsgReceivedProxy;
   import com.tgame.moudels.duomingshisanjian.model.DuoMingShiSanJian_MsgSenderProxy;
   import com.tgame.moudels.duomingshisanjian.view.DuoMingShiSanJian_Mediator;
   import com.tgame.moudels.duomingshisanjian.view.DuoMingShiSanJian_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DuoMingShiSanJian_StartupCommand extends SimpleCommand
   {
      
      public function DuoMingShiSanJian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DuoMingShiSanJian_MsgSenderProxy());
         facade.registerProxy(new DuoMingShiSanJian_MsgReceivedProxy());
         facade.registerMediator(new DuoMingShiSanJian_Mediator());
         facade.registerMediator(new DuoMingShiSanJian_TargetMediator());
      }
   }
}

