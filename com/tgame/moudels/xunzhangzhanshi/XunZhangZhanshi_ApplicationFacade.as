package com.tgame.moudels.xunzhangzhanshi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xunzhangzhanshi.controller.XunZhangZhanshi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XunZhangZhanshi_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xunzhangzhanshi.XunZhangZhanshi_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_XUNZHANG_PANEL:String = "SHOW_XUNZHANG_PANEL";
      
      public function XunZhangZhanshi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XUNZHANGZHANSHI,PipeConstants.SHOW_XUNZHANGZHANSHI_PANEL],this.handlePipeMessage,XunZhangZhanshi_ApplicationFacade);
      }
      
      public static function getInstance() : XunZhangZhanshi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XunZhangZhanshi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XunZhangZhanshi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XunZhangZhanshi_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_XUNZHANGZHANSHI:
               this.startup();
               break;
            case PipeConstants.SHOW_XUNZHANGZHANSHI_PANEL:
               sendNotification(SHOW_XUNZHANG_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

