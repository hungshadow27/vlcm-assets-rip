package com.tgame.moudels.chat.controller
{
   import com.tgame.moudels.chat.model.Chat_ChatProxy;
   import com.tgame.moudels.chat.model.Chat_MsgReceivedProxy;
   import com.tgame.moudels.chat.model.Chat_MsgSendProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Chat_StartupCommand extends SimpleCommand
   {
      
      public function Chat_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Chat_ChatProxy());
         facade.registerProxy(new Chat_MsgReceivedProxy());
         facade.registerProxy(new Chat_MsgSendProxy());
      }
   }
}

