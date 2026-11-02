package com.tgame.moudels.kongmingquan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.kongmingquan.controller.KongMingQuan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class KongMingQuan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.kongmingquan.KongMingQuan_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function KongMingQuan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_KONGMINGQUAN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,KongMingQuan_ApplicationFacade);
      }
      
      public static function getInstance() : KongMingQuan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new KongMingQuan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as KongMingQuan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,KongMingQuan_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_KONGMINGQUAN:
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

