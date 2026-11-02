package com.tgame.moudels.biwudahui
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.biwudahui.controller.Biwudahui_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Biwudahui_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.biwudahui.Biwudahui_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_BIWUDUIJUE_PANEL:String = "SHOW_BIWUDUIJUE_PANEL";
      
      public static const SHOW_BIWU_VS_BIFEN:String = "SHOW_BIWU_VS_BIFEN";
      
      public function Biwudahui_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BIWUDAHUI,PipeConstants.SHOW_BIWUDUIJUE_PANEL,PipeConstants.KUAFU_STATUS],this.handlePipeMessage,Biwudahui_ApplicationFacade);
      }
      
      public static function getInstance() : Biwudahui_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Biwudahui_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Biwudahui_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Biwudahui_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_BIWUDAHUI:
               this.startup();
               break;
            case PipeConstants.SHOW_BIWUDUIJUE_PANEL:
               sendNotification(SHOW_BIWUDUIJUE_PANEL,_loc2_);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(SHOW_BIWU_VS_BIFEN,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

