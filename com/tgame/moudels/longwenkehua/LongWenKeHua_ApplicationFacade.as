package com.tgame.moudels.longwenkehua
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.longwenkehua.controller.LongWenKeHua_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class LongWenKeHua_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.longwenkehua.LongWenKeHua_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const LONGWENKEHUA_PANEL:String = "LONGWENKEHUA_PANEL";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function LongWenKeHua_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_LONGWENKEHUA,PipeConstants.SHOW_LONGWENKEHUA_PANEL,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,LongWenKeHua_ApplicationFacade);
      }
      
      public static function getInstance() : LongWenKeHua_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new LongWenKeHua_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as LongWenKeHua_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,LongWenKeHua_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_LONGWENKEHUA:
               this.startup();
               break;
            case PipeConstants.SHOW_LONGWENKEHUA_PANEL:
               sendNotification(LONGWENKEHUA_PANEL,_loc3_);
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

