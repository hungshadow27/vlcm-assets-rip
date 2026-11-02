package com.tgame.moudels.ynShijiebei
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynShijiebei.controller.YNshijiebei_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNshijiebei_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynShijiebei.YNshijiebei_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REQUEST_YUENANSHIJIEBEIRANK_PANEL:String = "REQUEST_YUENANSHIJIEBEIRANK_PANEL";
      
      public static const YN_SHOW_MIKRANK_PANEL:String = "YN_SHOW_MIKRANK_PANEL";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public function YNshijiebei_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.REQUEST_YUENANSHIJIEBEIRANK_PANEL,PipeConstants.STARTUP_YUENANSHIJIEBEIRANK,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.YN_SHOW_MIKRANK_PANEL],this.handlePipeMessage,YNshijiebei_ApplicationFacade);
      }
      
      public static function getInstance() : YNshijiebei_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNshijiebei_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNshijiebei_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNshijiebei_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENANSHIJIEBEIRANK:
               this.startup();
               break;
            case PipeConstants.REQUEST_YUENANSHIJIEBEIRANK_PANEL:
               sendNotification(REQUEST_YUENANSHIJIEBEIRANK_PANEL);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
               break;
            case PipeConstants.YN_SHOW_MIKRANK_PANEL:
               sendNotification(YN_SHOW_MIKRANK_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

