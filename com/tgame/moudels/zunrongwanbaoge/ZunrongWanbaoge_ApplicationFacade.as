package com.tgame.moudels.zunrongwanbaoge
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zunrongwanbaoge.controller.ZunrongWanbaoge_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZunrongWanbaoge_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zunrongwanbaoge.ZunrongWanbaoge_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_WANBAOGEHUIGUI_PANEL:String = "SHOW_WANBAOGEHUIGUI_PANEL";
      
      public function ZunrongWanbaoge_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZUNRONGWANBAOGE,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_WANBAOGEHUIGUI_PANEL],this.handlePipeMessage,ZunrongWanbaoge_ApplicationFacade);
      }
      
      public static function getInstance() : ZunrongWanbaoge_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZunrongWanbaoge_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZunrongWanbaoge_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ZunrongWanbaoge_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ZUNRONGWANBAOGE:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SHOW_WANBAOGEHUIGUI_PANEL:
               sendNotification(SHOW_WANBAOGEHUIGUI_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

