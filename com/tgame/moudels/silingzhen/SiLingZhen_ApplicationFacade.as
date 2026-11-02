package com.tgame.moudels.silingzhen
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.silingzhen.controller.SiLingZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class SiLingZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.silingzhen.SiLingZhen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public function SiLingZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SILINGZHEN,PipeConstants.GOODS_CHANGED,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,SiLingZhen_ApplicationFacade);
      }
      
      public static function getInstance() : SiLingZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new SiLingZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as SiLingZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,SiLingZhen_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SILINGZHEN:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.SI_LIN_ZHEN_YIN_CHANG_SHU_XING)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

