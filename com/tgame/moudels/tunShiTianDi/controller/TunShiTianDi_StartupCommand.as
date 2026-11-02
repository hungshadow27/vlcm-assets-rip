package com.tgame.moudels.tunShiTianDi.controller
{
   import com.tgame.moudels.tunShiTianDi.model.TunShiTianDi_MsgReceivedProxy;
   import com.tgame.moudels.tunShiTianDi.model.TunShiTianDi_MsgSenderProxy;
   import com.tgame.moudels.tunShiTianDi.view.TunShiTianDiResult_Mediator;
   import com.tgame.moudels.tunShiTianDi.view.TunShiTianDi_Mediator;
   import com.tgame.moudels.tunShiTianDi.view.TunShiTianZhenRong_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TunShiTianDi_StartupCommand extends SimpleCommand
   {
      
      public function TunShiTianDi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TunShiTianDi_MsgReceivedProxy());
         facade.registerProxy(new TunShiTianDi_MsgSenderProxy());
         facade.registerMediator(new TunShiTianDi_Mediator());
         facade.registerMediator(new TunShiTianZhenRong_Mediator());
         facade.registerMediator(new TunShiTianDiResult_Mediator());
      }
   }
}

