package com.tgame.moudels.shendiaoxialv
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shendiaoxialv.controller.ShenDiaoXiaLv_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ShenDiaoXiaLv_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shendiaoxialv.ShenDiaoXiaLv_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const KUAFU_STATUS:String = "KUAFU_STATUS";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ShenDiaoXiaLv_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHENDIAOXIALV,PipeConstants.GOODS_CHANGED,PipeConstants.KUAFU_STATUS],this.handlePipeMessage,ShenDiaoXiaLv_ApplicationFacade);
      }
      
      public static function getInstance() : ShenDiaoXiaLv_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ShenDiaoXiaLv_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ShenDiaoXiaLv_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ShenDiaoXiaLv_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_SHENDIAOXIALV:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(KUAFU_STATUS);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

