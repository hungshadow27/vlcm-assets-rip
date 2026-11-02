package com.tgame.moudels.zixiashengong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zixiashengong.controller.ZiXia_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZiXia_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zixiashengong.ZiXia_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REFRESH_ZIXIASHENGONG_INFO:String = "refresh_zixiashengong_info";
      
      public function ZiXia_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZIXIASHENGONG,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,ZiXia_ApplicationFacade);
      }
      
      public static function getInstance() : ZiXia_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZiXia_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZiXia_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ZiXia_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_ZIXIASHENGONG:
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

