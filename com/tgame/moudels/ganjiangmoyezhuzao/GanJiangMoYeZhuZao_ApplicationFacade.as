package com.tgame.moudels.ganjiangmoyezhuzao
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ganjiangmoyezhuzao.controller.GanJiangMoYeZhuZao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class GanJiangMoYeZhuZao_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.ganjiangmoyezhuzao.GanJiangMoYeZhuZao_ApplicationFacade";
      
      public function GanJiangMoYeZhuZao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_GANJIANGMOYEZHUZAO,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,GanJiangMoYeZhuZao_ApplicationFacade);
      }
      
      public static function getInstance() : GanJiangMoYeZhuZao_ApplicationFacade
      {
         if(instanceMap[PipeConstants.STARTUP_GANJIANGMOYEZHUZAO] == null)
         {
            instanceMap[PipeConstants.STARTUP_GANJIANGMOYEZHUZAO] = new GanJiangMoYeZhuZao_ApplicationFacade(PipeConstants.STARTUP_GANJIANGMOYEZHUZAO);
         }
         return instanceMap[PipeConstants.STARTUP_AOJIANZHUZAO] as GanJiangMoYeZhuZao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,GanJiangMoYeZhuZao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_GANJIANGMOYEZHUZAO:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.GANJIANGMOYE_DUANZAO && !Fun.isVisible(GameInstance.uiInstance._ganjiangmoyezhuzaoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GANJIANGMOYEZHUZAO_PLANE);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

