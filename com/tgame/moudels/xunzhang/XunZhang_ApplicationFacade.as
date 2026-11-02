package com.tgame.moudels.xunzhang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xunzhang.controller.XunZhang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XunZhang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xunzhang.XunZhang_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_XUNZHANG_PANEL:String = "SHOW_XUNZHANG_PANEL";
      
      public function XunZhang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XUNZHANG,PipeConstants.SHOW_XUNZHANG_PANEL],this.handlePipeMessage,XunZhang_ApplicationFacade);
      }
      
      public static function getInstance() : XunZhang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XunZhang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XunZhang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XunZhang_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_XUNZHANG:
               this.startup();
               break;
            case PipeConstants.SHOW_XUNZHANG_PANEL:
               sendNotification(SHOW_XUNZHANG_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

