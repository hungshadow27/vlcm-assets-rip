package com.tgame.moudels.XiSuiJing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.XiSuiJing.controller.XiSuiJing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XiSuiJing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.XiSuiJing.XiSuiJing_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const XISUIJING_DINGJI_JIHUO_SHUXING:String = "XISUIJING_DINGJI_JIHUO_SHUXING";
      
      public static const STARTUP:String = "STARTUP";
      
      public function XiSuiJing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XISUIJING,PipeConstants.GOODS_CHANGED,PipeConstants.DINGJI_JIHUO_SHUXING],this.handlePipeMessage,XiSuiJing_ApplicationFacade);
      }
      
      public static function getInstance() : XiSuiJing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XiSuiJing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XiSuiJing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XiSuiJing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XISUIJING:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.DINGJI_JIHUO_SHUXING:
               sendNotification(XISUIJING_DINGJI_JIHUO_SHUXING,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

