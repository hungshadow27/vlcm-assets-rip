package com.tgame.moudels.yuncheng
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yuncheng.controller.YunCheng_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YunCheng_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yuncheng.YunCheng_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function YunCheng_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUNCHENG],this.handlePipeMessage,YunCheng_ApplicationFacade);
      }
      
      public static function getInstance() : YunCheng_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YunCheng_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YunCheng_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YunCheng_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUNCHENG:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

