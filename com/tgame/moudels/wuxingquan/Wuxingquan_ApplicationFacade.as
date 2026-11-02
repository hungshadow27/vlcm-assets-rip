package com.tgame.moudels.wuxingquan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wuxingquan.controller.Wuxingquan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Wuxingquan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wuxingquan.Wuxingquan_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REFRESH_WUXINGQUAN_INFO:String = "refresh_wuxingquan_info";
      
      public function Wuxingquan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WUXINGQUAN],this.handlePipeMessage,Wuxingquan_ApplicationFacade);
      }
      
      public static function getInstance() : Wuxingquan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Wuxingquan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Wuxingquan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Wuxingquan_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_WUXINGQUAN:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

