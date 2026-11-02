package com.tgame.moudels.WoHuCangLong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.WoHuCangLong.controller.WoHuCangLong_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class WoHuCangLong_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.WoHuCangLong.WoHuCangLong_ApplicationFacade";
      
      public static const SHOW_WOHUCANGLONG_PANEL:String = "SHOW_WOHUCANGLONG_PANEL";
      
      public function WoHuCangLong_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WOHUCANGLONG,PipeConstants.SHOW_WOHUCANGLONG_PANEL],this.handlePipeMessage,WoHuCangLong_ApplicationFacade);
      }
      
      public static function getInstance() : WoHuCangLong_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new WoHuCangLong_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as WoHuCangLong_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,WoHuCangLong_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_WOHUCANGLONG:
               this.startup();
               break;
            case PipeConstants.SHOW_WOHUCANGLONG_PANEL:
               sendNotification(SHOW_WOHUCANGLONG_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

