package com.tgame.moudels.scene.controller
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.NetWorkManager;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Scene_EnterLineCommand extends SimpleCommand
   {
      
      public function Scene_EnterLineCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"正在连接分线服务器"),0.7);
         KeyboardManager.enable = false;
         NetWorkManager.connectLine();
      }
   }
}

