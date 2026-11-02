package com.tgame.moudels.zhenqiDoll.controller
{
   import com.tgame.moudels.zhenqiDoll.model.ZhenqiDoll_MsgReceivedProxy;
   import com.tgame.moudels.zhenqiDoll.model.ZhenqiDoll_MsgSenderProxy;
   import com.tgame.moudels.zhenqiDoll.view.ZhenqiDoll_Mediator;
   import com.tgame.moudels.zhenqiDoll.view.ZhenqiDoll_SuperMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZhenqiDoll_StartupCommand extends SimpleCommand
   {
      
      public function ZhenqiDoll_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZhenqiDoll_MsgReceivedProxy());
         facade.registerProxy(new ZhenqiDoll_MsgSenderProxy());
         facade.registerMediator(new ZhenqiDoll_Mediator());
         facade.registerMediator(new ZhenqiDoll_SuperMediator());
      }
   }
}

