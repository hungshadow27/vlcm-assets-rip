package com.tgame.moudels.biwuCrossP
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.biwuCrossP.controller.BiwuCrossP_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BiwuCrossP_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.biwuCrossP.BiwuCrossP_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_BIWU_CROSSPLATFORM_PANEL:String = "SHOW_BIWU_CROSSPLATFORM_PANEL";
      
      public static const SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL:String = "SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL";
      
      public static const KUA_FU_RANK_DATA_RECEIVED:String = "KUA_FU_RANK_DATA_RECEIVED";
      
      public static const GET_CONQUER_HISTORY_DATA:String = "GET_CONQUER_HISTORY_DATA";
      
      public static const KUAFU_STATUS:String = "KUAFU_STATUS";
      
      public static const YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA:String = "YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA";
      
      public function BiwuCrossP_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BIWU_CROSSPLATFORM,PipeConstants.SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL,PipeConstants.KUA_FU_RANK_DATA_RECEIVED,PipeConstants.GET_CONQUER_HISTORY_DATA,PipeConstants.KUAFU_STATUS,PipeConstants.YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA],this.handlePipeMessage,BiwuCrossP_ApplicationFacade);
      }
      
      public static function getInstance() : BiwuCrossP_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BiwuCrossP_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BiwuCrossP_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BiwuCrossP_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_BIWU_CROSSPLATFORM:
               this.startup();
               break;
            case PipeConstants.SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL:
               sendNotification(SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL,_loc2_);
               break;
            case PipeConstants.KUA_FU_RANK_DATA_RECEIVED:
               sendNotification(KUA_FU_RANK_DATA_RECEIVED,_loc2_);
               break;
            case PipeConstants.GET_CONQUER_HISTORY_DATA:
               sendNotification(GET_CONQUER_HISTORY_DATA,_loc2_);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(KUAFU_STATUS,_loc2_);
               break;
            case PipeConstants.YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA:
               sendNotification(YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

