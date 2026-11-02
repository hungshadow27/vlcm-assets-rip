package com.tgame.moudels.chiBang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.chiBang.controller.ChiBang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ChiBang_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.chiBang.ChiBang_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_YULING_HECHENG_PANEL:String = "SHOW_YULING_HECHENG_PANEL";
      
      public static const UP_DOWN_FEIXING:String = "UP_DOWN_FEIXING";
      
      public static const SHOW_XINMO_PANEL:String = "SHOW_XINMO_PANEL";
      
      public function ChiBang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CHIBANG,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_YULING_HECHENG_PANEL,PipeConstants.UP_DOWN_FEIXING,PipeConstants.SHOW_XINMO_PANEL],this.handlePipeMessage,ChiBang_ApplicationFacade);
      }
      
      public static function getInstance() : ChiBang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ChiBang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ChiBang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ChiBang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_CHIBANG:
               sendNotification(STARTUP);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SHOW_YULING_HECHENG_PANEL:
               sendNotification(SHOW_YULING_HECHENG_PANEL);
               break;
            case PipeConstants.UP_DOWN_FEIXING:
               sendNotification(UP_DOWN_FEIXING,_loc2_);
               break;
            case PipeConstants.SHOW_XINMO_PANEL:
               sendNotification(SHOW_XINMO_PANEL);
         }
      }
   }
}

