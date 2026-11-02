package com.tgame.moudels.yuejinlun
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yuejinlun.controller.YueJinLun_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YueJinLun_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.yuejinlun.YueJinLun_ApplicationFacade";
      
      public function YueJinLun_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUEJINLUN],this.handlePipeMessage,YueJinLun_ApplicationFacade);
      }
      
      public static function getInstance() : YueJinLun_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YueJinLun_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YueJinLun_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YueJinLun_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUEJINLUN:
               sendNotification(STARTUP);
         }
      }
   }
}

