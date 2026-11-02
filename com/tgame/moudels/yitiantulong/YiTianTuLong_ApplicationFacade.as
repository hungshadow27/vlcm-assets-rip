package com.tgame.moudels.yitiantulong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yitiantulong.controller.YiTianTuLong_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YiTianTuLong_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yitiantulong.YiTianTuLong_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_YITIANTULONG_PANEL:String = "SHOW_YITIANTULONG_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const BAITUOSHANXIA:String = "BAITUOSHANXIA";
      
      public function YiTianTuLong_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YITIANTULONG,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_YITIANTULONG_PANEL,PipeConstants.SHOW_BAITUOSHAN_PANEL],this.handlePipeMessage,YiTianTuLong_ApplicationFacade);
      }
      
      public static function getInstance() : YiTianTuLong_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YiTianTuLong_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YiTianTuLong_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YiTianTuLong_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_YITIANTULONG:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SHOW_YITIANTULONG_PANEL:
               sendNotification(SHOW_YITIANTULONG_PANEL,_loc3_);
               break;
            case PipeConstants.SHOW_BAITUOSHAN_PANEL:
               sendNotification(BAITUOSHANXIA);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

