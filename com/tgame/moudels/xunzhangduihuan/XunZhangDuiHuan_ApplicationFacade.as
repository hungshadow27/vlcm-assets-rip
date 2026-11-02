package com.tgame.moudels.xunzhangduihuan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xunzhangduihuan.controller.XunZhangDuiHuan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XunZhangDuiHuan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xunzhangduihuan.XunZhangDuiHuan_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_XUNZHANGDUIHUAN_PANEL:String = "SHOW_XUNZHANGDUIHUAN_PANEL";
      
      public function XunZhangDuiHuan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XUNZHANGDUIHUAN,PipeConstants.SHOW_XUNZHANGDUIHUAN_PANEL],this.handlePipeMessage,XunZhangDuiHuan_ApplicationFacade);
      }
      
      public static function getInstance() : XunZhangDuiHuan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XunZhangDuiHuan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XunZhangDuiHuan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XunZhangDuiHuan_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_XUNZHANGDUIHUAN:
               this.startup();
               break;
            case PipeConstants.SHOW_XUNZHANGDUIHUAN_PANEL:
               sendNotification(SHOW_XUNZHANGDUIHUAN_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

