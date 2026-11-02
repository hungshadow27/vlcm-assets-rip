package com.tgame.moudels.wuxingzhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wuxingzhen.controller.WuXingZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class WuXingZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wuxingzhen.WuXingZhen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function WuXingZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WUXINGZHEN,undefined,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,WuXingZhen_ApplicationFacade);
      }
      
      public static function getInstance() : WuXingZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new WuXingZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as WuXingZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,WuXingZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_WUXINGZHEN:
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

