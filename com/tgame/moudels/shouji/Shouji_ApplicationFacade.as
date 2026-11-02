package com.tgame.moudels.shouji
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shouji.controller.Shouji_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Shouji_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shouji.Shouji_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function Shouji_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHOUJI,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,Shouji_ApplicationFacade);
      }
      
      public static function getInstance() : Shouji_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Shouji_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Shouji_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Shouji_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SHOUJI:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

