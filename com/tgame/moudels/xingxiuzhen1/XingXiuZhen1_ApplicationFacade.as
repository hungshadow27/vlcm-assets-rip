package com.tgame.moudels.xingxiuzhen1
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xingxiuzhen1.controller.XingXiuZhen1_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XingXiuZhen1_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xingxiuzhen1.XingXiuZhen1_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function XingXiuZhen1_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XINGXIUZHEN1,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,XingXiuZhen1_ApplicationFacade);
      }
      
      public static function getInstance() : XingXiuZhen1_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XingXiuZhen1_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XingXiuZhen1_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XingXiuZhen1_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XINGXIUZHEN1:
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

