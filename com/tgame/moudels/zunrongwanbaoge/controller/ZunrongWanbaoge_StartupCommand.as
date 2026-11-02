package com.tgame.moudels.zunrongwanbaoge.controller
{
   import com.tgame.moudels.zunrongwanbaoge.model.ZunrongWanbaoge_MsgReceivedProxy;
   import com.tgame.moudels.zunrongwanbaoge.model.ZunrongWanbaoge_MsgSenderProxy;
   import com.tgame.moudels.zunrongwanbaoge.view.ZunrongWanbaogeHuigui_Mediator;
   import com.tgame.moudels.zunrongwanbaoge.view.ZunrongWanbaoge_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZunrongWanbaoge_StartupCommand extends SimpleCommand
   {
      
      public function ZunrongWanbaoge_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZunrongWanbaoge_MsgReceivedProxy());
         facade.registerProxy(new ZunrongWanbaoge_MsgSenderProxy());
         facade.registerMediator(new ZunrongWanbaoge_Mediator());
         facade.registerMediator(new ZunrongWanbaogeHuigui_Mediator());
      }
   }
}

