package com.tgame.moudels.xiakexing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xiakexing.controller.XiaKeXing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XiaKeXing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xiakexing.XiaKeXing_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function XiaKeXing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XIAKEXING,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,XiaKeXing_ApplicationFacade);
      }
      
      public static function getInstance() : XiaKeXing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XiaKeXing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XiaKeXing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XiaKeXing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XIAKEXING:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

