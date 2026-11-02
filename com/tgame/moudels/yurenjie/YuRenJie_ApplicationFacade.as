package com.tgame.moudels.yurenjie
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yurenjie.controller.YuRenJie_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YuRenJie_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yurenjie.YuRenJie_ApplicationFacade";
      
      public static const GET_YURENJIE_PANEL:String = "GET_YURENJIE_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function YuRenJie_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.GET_YURENJIE_PANEL,PipeConstants.STARTUP_YURENJIE],this.handlePipeMessage,YuRenJie_ApplicationFacade);
      }
      
      public static function getInstance() : YuRenJie_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YuRenJie_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YuRenJie_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YuRenJie_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YURENJIE:
               this.startup();
               break;
            case PipeConstants.GET_YURENJIE_PANEL:
               sendNotification(GET_YURENJIE_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

