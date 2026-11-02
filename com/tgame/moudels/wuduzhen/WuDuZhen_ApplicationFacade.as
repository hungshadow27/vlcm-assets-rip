package com.tgame.moudels.wuduzhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wuduzhen.controller.WuDuZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class WuDuZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wuduzhen.WuDuZhen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function WuDuZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WUDUZHEN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,WuDuZhen_ApplicationFacade);
      }
      
      public static function getInstance() : WuDuZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new WuDuZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as WuDuZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,WuDuZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_WUDUZHEN:
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

