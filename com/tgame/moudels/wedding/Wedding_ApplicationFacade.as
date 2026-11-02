package com.tgame.moudels.wedding
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wedding.controller.Wedding_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Wedding_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wedding.Wedding_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SELECT_YUPEI:String = "SELECT_YUPEI";
      
      public static const SELECT_YUPEI_SWITCH:String = "SELECT_YUPEI_SWITCH";
      
      public static const UPDATE_FUQI_SKILL:String = "UPDATE_FUQI_SKILL";
      
      public static const QIUHUN:String = "QIUHUN";
      
      public static const SEND_QIUHUN:String = "SEND_QIUHUN";
      
      public function Wedding_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WEDDING,PipeConstants.SELECT_YUPEI,PipeConstants.SELECT_YUPEI_SWITCH,PipeConstants.UPDATE_SKILL,PipeConstants.SEND_QIUHUN],this.handlePipeMessage,Wedding_ApplicationFacade);
      }
      
      public static function getInstance() : Wedding_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Wedding_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Wedding_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Wedding_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_WEDDING:
               this.startup();
               break;
            case PipeConstants.SELECT_YUPEI:
               sendNotification(SELECT_YUPEI,_loc2_);
               break;
            case PipeConstants.SELECT_YUPEI_SWITCH:
               sendNotification(SELECT_YUPEI_SWITCH,_loc2_);
               break;
            case PipeConstants.UPDATE_SKILL:
               sendNotification(UPDATE_FUQI_SKILL,_loc2_);
               break;
            case PipeConstants.SEND_QIUHUN:
               sendNotification(SEND_QIUHUN,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

