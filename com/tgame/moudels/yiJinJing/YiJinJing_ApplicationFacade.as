package com.tgame.moudels.yiJinJing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yiJinJing.controller.YiJinJing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YiJinJing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yiJinJing.YiJinJing_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const USE_ITEM_JIYUAN_UP:String = "USE_ITEM_JIYUAN_UP";
      
      public static const STARTUP:String = "STARTUP";
      
      public function YiJinJing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YIJINJING,PipeConstants.GOODS_CHANGED,PipeConstants.USE_ITEM_JIYUAN_UP],this.handlePipeMessage,YiJinJing_ApplicationFacade);
      }
      
      public static function getInstance() : YiJinJing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YiJinJing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YiJinJing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YiJinJing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_YIJINJING:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.USE_ITEM_JIYUAN_UP:
               sendNotification(USE_ITEM_JIYUAN_UP);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

