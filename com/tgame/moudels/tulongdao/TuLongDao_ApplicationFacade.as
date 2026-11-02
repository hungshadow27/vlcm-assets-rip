package com.tgame.moudels.tulongdao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tulongdao.controller.TuLongDao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TuLongDao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.tulongdao.TuLongDao_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SEND_XIANJING:String = "SEND_XIANJING";
      
      public function TuLongDao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TULONGDAO,PipeConstants.SEND_XIANJING,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,TuLongDao_ApplicationFacade);
      }
      
      public static function getInstance() : TuLongDao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TuLongDao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TuLongDao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TuLongDao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_TULONGDAO:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SEND_XIANJING:
               sendNotification(SEND_XIANJING,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

