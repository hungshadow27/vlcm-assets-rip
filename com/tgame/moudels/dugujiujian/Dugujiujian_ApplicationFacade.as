package com.tgame.moudels.dugujiujian
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.dugujiujian.controller.Dugujiujian_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Dugujiujian_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.dugujiujian.Dugujiujian_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const QINGQIUHUANZHUANG:String = "QINGQIUHUANZHUANG";
      
      public static const REFREASH_DUGUJIUJIAN_INFO:String = "refresh_dugujiujian_info";
      
      public function Dugujiujian_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_DUGUJIUJIAN,PipeConstants.QINGQIUHUANZHUANG],this.handlePipeMessage,Dugujiujian_ApplicationFacade);
      }
      
      public static function getInstance() : Dugujiujian_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Dugujiujian_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Dugujiujian_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Dugujiujian_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_DUGUJIUJIAN:
               this.startup();
               break;
            case PipeConstants.QINGQIUHUANZHUANG:
               sendNotification(QINGQIUHUANZHUANG);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

