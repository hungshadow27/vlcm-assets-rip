package com.tgame.moudels.yuanwu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yuanwu.controller.Yuanwu_StartUpCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Yuanwu_Application extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yuanwu.Yuanwu_Application";
      
      public static const STARTUP:String = "startup";
      
      public function Yuanwu_Application(param1:String)
      {
         super(NAME);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUANWU,PipeConstants.BUY_GOOD_SUCCESS,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_YUANWU_PANEL,PipeConstants.SHOW_TARGETYUANWU_PANEL,PipeConstants.SHOW_YUANWUPEIYANG_PANEL,PipeConstants.SHOW_YUANWUHEXIN_PANEL,PipeConstants.SHOW_YUANWUPEIDAI_PANEL],this.handlePipeMessage,Yuanwu_Application);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Yuanwu_StartUpCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUANWU:
               sendNotification(STARTUP);
               break;
            case PipeConstants.GOODS_CHANGED:
            case PipeConstants.BUY_GOOD_SUCCESS:
            case PipeConstants.SHOW_YUANWU_PANEL:
            case PipeConstants.SHOW_TARGETYUANWU_PANEL:
            case PipeConstants.SHOW_YUANWUPEIYANG_PANEL:
            case PipeConstants.SHOW_YUANWUPEIDAI_PANEL:
            case PipeConstants.SHOW_YUANWUHEXIN_PANEL:
               sendNotification(param1.name,_loc2_);
         }
      }
   }
}

