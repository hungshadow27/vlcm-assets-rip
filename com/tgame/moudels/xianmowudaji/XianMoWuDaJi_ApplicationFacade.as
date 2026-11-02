package com.tgame.moudels.xianmowudaji
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xianmowudaji.controller.XianMoWuDaJi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XianMoWuDaJi_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xianmowudaji.XianMoWuDaJi_ApplicationFacade";
      
      public static const GET_XIANMOWUDAJI:String = "GET_XIANMOWUDAJI";
      
      public static const STARTUP:String = "STARTUP";
      
      public function XianMoWuDaJi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XIANMOWUDAJI,PipeConstants.GET_XIANMOWUDAJI],this.handlePipeMessage,XianMoWuDaJi_ApplicationFacade);
      }
      
      public static function getInstance() : XianMoWuDaJi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XianMoWuDaJi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XianMoWuDaJi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XianMoWuDaJi_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XIANMOWUDAJI:
               this.startup();
               break;
            case PipeConstants.GET_XIANMOWUDAJI:
               sendNotification(GET_XIANMOWUDAJI);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

