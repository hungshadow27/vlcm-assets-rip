package com.tgame.moudels.scene.controller
{
   import com.tgame.moudels.scene.model.Scene_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Scene_EnterChatCommand extends SimpleCommand
   {
      
      public function Scene_EnterChatCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Scene_MsgSenderProxy = facade.retrieveProxy(Scene_MsgSenderProxy.NAME) as Scene_MsgSenderProxy;
         _loc2_.send_30101();
      }
   }
}

