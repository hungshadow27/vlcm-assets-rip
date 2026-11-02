package com.tgame.moudels.ynLongzhizhufu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynLongzhizhufu.controller.YNlongzhizhufu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNlongzhizhufu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynLongzhizhufu.YNlongzhizhufu_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const YN_REQUEST_LONGZHIZHUFU_PANEL:String = "YN_REQUEST_LONGZHIZHUFU_PANEL";
      
      public function YNlongzhizhufu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.YN_REQUEST_LONGZHIZHUFU_PANEL,PipeConstants.STARTUP_YNLONGZHIZHUFU],this.handlePipeMessage,YNlongzhizhufu_ApplicationFacade);
      }
      
      public static function getInstance() : YNlongzhizhufu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNlongzhizhufu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNlongzhizhufu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNlongzhizhufu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNLONGZHIZHUFU:
               this.startup();
               break;
            case PipeConstants.YN_REQUEST_LONGZHIZHUFU_PANEL:
               sendNotification(YN_REQUEST_LONGZHIZHUFU_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

