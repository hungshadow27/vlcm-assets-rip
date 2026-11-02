package com.tgame.moudels.aojianzhuzao
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.aojianzhuzao.controller.AoJianZhuZao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class AoJianZhuZao_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.aojianzhuzao.AoJianZhuZao_ApplicationFacade";
      
      public function AoJianZhuZao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_AOJIANZHUZAO,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,AoJianZhuZao_ApplicationFacade);
      }
      
      public static function getInstance() : AoJianZhuZao_ApplicationFacade
      {
         if(instanceMap[PipeConstants.STARTUP_AOJIANZHUZAO] == null)
         {
            instanceMap[PipeConstants.STARTUP_AOJIANZHUZAO] = new AoJianZhuZao_ApplicationFacade(PipeConstants.STARTUP_AOJIANZHUZAO);
         }
         return instanceMap[PipeConstants.STARTUP_AOJIANZHUZAO] as AoJianZhuZao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,AoJianZhuZao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_AOJIANZHUZAO:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.AOJIAN_DUANZAO && !Fun.isVisible(GameInstance.uiInstance._aojianzhuzaoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_AOJIAN_ZHUZAO);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

