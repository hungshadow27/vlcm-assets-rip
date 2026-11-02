package com.tgame.moudels.char.controller
{
   import com.tgame.moudels.char.model.Char_CharProxy;
   import com.tgame.moudels.char.model.Char_MsgReceivedProxy;
   import com.tgame.moudels.char.model.Char_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Char_StartupCommand extends SimpleCommand
   {
      
      public function Char_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Char_CharProxy());
         facade.registerProxy(new Char_MsgReceivedProxy());
         facade.registerProxy(new Char_MsgSenderProxy());
      }
   }
}

