package com.tgame.moudels.yn2014zhongqiu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yn2014zhongqiu.controller.YN2014Zhongqiu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YN2014Zhongqiu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yn2014zhongqiu.YN2014Zhongqiu_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REQUEST_YUENAN2014ZHONGQIU_PANEL:String = "REQUEST_YUENAN2014ZHONGQIU_PANEL";
      
      public function YN2014Zhongqiu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUENAN2014ZHOGNQIU,PipeConstants.REQUEST_YUENAN2014ZHONGQIU_PANEL],this.handlePipeMessage,YN2014Zhongqiu_ApplicationFacade);
      }
      
      public static function getInstance() : YN2014Zhongqiu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YN2014Zhongqiu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YN2014Zhongqiu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YN2014Zhongqiu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENAN2014ZHOGNQIU:
               this.startup();
               break;
            case PipeConstants.REQUEST_YUENAN2014ZHONGQIU_PANEL:
               sendNotification(REQUEST_YUENAN2014ZHONGQIU_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

