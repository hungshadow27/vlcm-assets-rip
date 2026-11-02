package com.tgame.moudels.ynLianhuanchongzhi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynLianhuanchongzhi.controller.YNlianhuanchongzhi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNlianhuanchongzhi_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynLianhuanchongzhi.YNlianhuanchongzhi_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const YN_REQUEST_LIANHUANCHONGZHI_PANEL:String = "YN_REQUEST_LIANHUANCHONGZHI_PANEL";
      
      public static const YN_REQUEST_SHOUCICHONGZHI_PANEL:String = "YN_REQUEST_SHOUCICHONGZHI_PANEL";
      
      public static const YN_REQUEST_SHOUCICHONGZHI2_PANEL:String = "YN_REQUEST_SHOUCICHONGZHI2_PANEL";
      
      public function YNlianhuanchongzhi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.YN_REQUEST_LIANHUANCHONGZHI_PANEL,PipeConstants.STARTUP_YUENANLIANHUANCHONGZHI,PipeConstants.YN_REQUEST_SHOUCICHONGZHI_PANEL,PipeConstants.YN_REQUEST_SHOUCICHONGZHI2_PANEL],this.handlePipeMessage,YNlianhuanchongzhi_ApplicationFacade);
      }
      
      public static function getInstance() : YNlianhuanchongzhi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNlianhuanchongzhi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNlianhuanchongzhi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNlianhuanchongzhi_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENANLIANHUANCHONGZHI:
               this.startup();
               break;
            case PipeConstants.YN_REQUEST_LIANHUANCHONGZHI_PANEL:
               sendNotification(YN_REQUEST_LIANHUANCHONGZHI_PANEL,_loc2_);
               break;
            case PipeConstants.YN_REQUEST_SHOUCICHONGZHI_PANEL:
               sendNotification(YN_REQUEST_SHOUCICHONGZHI_PANEL,_loc2_);
               break;
            case PipeConstants.YN_REQUEST_SHOUCICHONGZHI2_PANEL:
               sendNotification(YN_REQUEST_SHOUCICHONGZHI2_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

