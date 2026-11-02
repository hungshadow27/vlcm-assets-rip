package com.tgame.moudels.scene.controller
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.moudels.scene.model.Scene_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Scene_ClientReadyCommand extends SimpleCommand
   {
      
      public function Scene_ClientReadyCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"正在请求进入场景"),0.8);
         var _loc2_:Scene_MsgSenderProxy = facade.retrieveProxy(Scene_MsgSenderProxy.NAME) as Scene_MsgSenderProxy;
         _loc2_.send_10019();
      }
   }
}

