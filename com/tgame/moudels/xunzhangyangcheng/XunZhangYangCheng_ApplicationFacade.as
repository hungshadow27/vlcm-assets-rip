package com.tgame.moudels.xunzhangyangcheng
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xunzhangyangcheng.controller.XunZhangYangCheng_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XunZhangYangCheng_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xunzhangyangcheng.XunZhangYangCheng_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function XunZhangYangCheng_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XUNZHANGYANGCHENG],this.handlePipeMessage,XunZhangYangCheng_ApplicationFacade);
      }
      
      public static function getInstance() : XunZhangYangCheng_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XunZhangYangCheng_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XunZhangYangCheng_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XunZhangYangCheng_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_XUNZHANGYANGCHENG:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

