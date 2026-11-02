package com.tgame.moudels.shijianshalou
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shijianshalou.controller.ShiJianShaLou_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ShiJianShalou_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shijianshalou.ShiJianShalou_ApplicationFacade";
      
      public static const SHOW_SHIJIANSHALOU_PANEL:String = "SHOW_SHIJIANSHALOU_PANEL";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_CAISHENXUNBAO_PANEL:String = "SHOW_CAISHENXUNBAO_PANEL";
      
      public static const SHOW_ZHIZUONANGUAPAI_PANEL:String = "SHOW_ZHIZUONANGUAPAI_PANEL";
      
      public static const CLICK_XUEREN:String = "CLICK_XUEREN";
      
      public static const CLICK_BAOHE:String = "CLICK_BAOHE";
      
      public static const SHOW_CHUNJIE_PANEL:String = "SHOW_CHUNJIE_PANEL";
      
      public static const SHOW_LANTERNFESTIVAL_PANEL:String = "SHOW_LANTERNFESTIVAL_PANEL";
      
      public static const CLICK_DENGMI:String = "CLICK_DENGMI";
      
      public static const GET_SHIJIANSHALOU_PANEL:String = "GET_SHIJIANSHALOU_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ShiJianShalou_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.SHOW_SHIJIANSHALOU_PANEL,PipeConstants.STARTUP_SHIJIANSHALOU,PipeConstants.GET_SHIJIANSHALOU_PANEL],this.handlePipeMessage,ShiJianShalou_ApplicationFacade);
      }
      
      public static function getInstance() : ShiJianShalou_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ShiJianShalou_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ShiJianShalou_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ShiJianShaLou_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SHIJIANSHALOU:
               sendNotification(STARTUP);
               break;
            case PipeConstants.SHOW_SHIJIANSHALOU_PANEL:
               sendNotification(SHOW_SHIJIANSHALOU_PANEL,_loc2_);
               break;
            case PipeConstants.GET_SHIJIANSHALOU_PANEL:
               sendNotification(GET_SHIJIANSHALOU_PANEL,_loc2_);
         }
      }
   }
}

