package com.tgame.moudels.tianyuyanmeng
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tianyuyanmeng.controller.TianYuYanMeng_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TianYuYanMeng_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.tianyuyanmeng.TianYuYanMeng_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function TianYuYanMeng_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TIANYUYANMENG,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,TianYuYanMeng_ApplicationFacade);
      }
      
      public static function getInstance() : TianYuYanMeng_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TianYuYanMeng_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TianYuYanMeng_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TianYuYanMeng_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_TIANYUYANMENG:
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

