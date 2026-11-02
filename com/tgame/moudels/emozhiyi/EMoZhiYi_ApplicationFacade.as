package com.tgame.moudels.emozhiyi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.emozhiyi.controller.EMoZhiYi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class EMoZhiYi_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.emozhiyi.EMoZhiYi_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_YULING_HECHENG_PANEL:String = "SHOW_YULING_HECHENG_PANEL";
      
      public static const UP_DOWN_FEIXING:String = "UP_DOWN_FEIXING";
      
      public static const SHOW_XINMO_PANEL:String = "SHOW_XINMO_PANEL";
      
      public function EMoZhiYi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_EMOZHIYI,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,EMoZhiYi_ApplicationFacade);
      }
      
      public static function getInstance() : EMoZhiYi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new EMoZhiYi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as EMoZhiYi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,EMoZhiYi_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_EMOZHIYI:
               sendNotification(STARTUP);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
   }
}

