package com.tgame.moudels.xiaoyaoyufeng
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xiaoyaoyufeng.controller.XiaoYaoYuFeng_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XiaoYaoYuFeng_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xiaoyaoyufeng.XiaoYaoYuFeng_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL:String = "SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL";
      
      public function XiaoYaoYuFeng_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XIAOYAOYUFENG,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL],this.handlePipeMessage,XiaoYaoYuFeng_ApplicationFacade);
      }
      
      public static function getInstance() : XiaoYaoYuFeng_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XiaoYaoYuFeng_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XiaoYaoYuFeng_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XiaoYaoYuFeng_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XIAOYAOYUFENG:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL:
               sendNotification(SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

