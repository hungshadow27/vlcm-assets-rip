package com.tgame.moudels.friend.controller
{
   import com.tgame.moudels.friend.model.Friend_MsgReceivedProxy;
   import com.tgame.moudels.friend.model.Friend_MsgSenderProxy;
   import com.tgame.moudels.friend.view.Friend_Mediator;
   import com.tgame.moudels.friend.view.JingYanJiangLi_Mediator;
   import com.tgame.moudels.friend.view.ShiTu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Friend_StartupCommand extends SimpleCommand
   {
      
      public function Friend_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Friend_MsgReceivedProxy());
         facade.registerProxy(new Friend_MsgSenderProxy());
         facade.registerMediator(new Friend_Mediator());
         facade.registerMediator(new ShiTu_Mediator());
         facade.registerMediator(new JingYanJiangLi_Mediator());
      }
   }
}

