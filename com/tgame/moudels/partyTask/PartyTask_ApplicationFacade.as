package com.tgame.moudels.partyTask
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.partyTask.controller.PartyTask_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class PartyTask_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.partyTask.PartyTask_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const OPEN_JIE_YABIAO_PANEL:String = "OPEN_JIE_YABIAO_PANEL";
      
      public static const OPEN_JIAO_YABIAO_PANEL:String = "OPEN_JIAO_YABIAO_PANEL";
      
      public static const FANGQI_YABIAO_TASK:String = "FANGQI_YABIAO_TASK";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE:String = "QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE";
      
      public static const QINGQIUJIHUO_LONGMAI:String = "QINGQIUJIHUO_LONGMAI";
      
      public function PartyTask_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_PARTY_TASK,PipeConstants.OPEN_JIE_YABIAO_PANEL,PipeConstants.OPEN_JIAO_YABIAO_PANEL,PipeConstants.FANGQI_YABIAO_TASK,PipeConstants.ENTER_SCENE,PipeConstants.QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE,PipeConstants.QINGQIUJIHUO_LONGMAI],this.handlePipeMessage,PartyTask_ApplicationFacade);
      }
      
      public static function getInstance() : PartyTask_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new PartyTask_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as PartyTask_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,PartyTask_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_PARTY_TASK:
               this.startup();
               break;
            case PipeConstants.OPEN_JIE_YABIAO_PANEL:
               sendNotification(OPEN_JIE_YABIAO_PANEL,_loc2_);
               break;
            case PipeConstants.OPEN_JIAO_YABIAO_PANEL:
               sendNotification(OPEN_JIAO_YABIAO_PANEL,_loc2_);
               break;
            case PipeConstants.FANGQI_YABIAO_TASK:
               sendNotification(FANGQI_YABIAO_TASK,_loc2_);
               break;
            case PipeConstants.ENTER_SCENE:
               sendNotification(ENTER_SCENE,_loc2_);
               break;
            case PipeConstants.QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE:
               sendNotification(QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE,_loc2_);
               break;
            case PipeConstants.QINGQIUJIHUO_LONGMAI:
               sendNotification(QINGQIUJIHUO_LONGMAI,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

