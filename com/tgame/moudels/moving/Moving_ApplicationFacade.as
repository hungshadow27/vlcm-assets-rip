package com.tgame.moudels.moving
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.moving.controller.Moving_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Moving_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.moving.Moving_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const MOVING_DRAG:String = "MOVING_DRAG";
      
      public function Moving_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MOVING,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,Moving_ApplicationFacade);
      }
      
      public static function getInstance() : Moving_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Moving_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Moving_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         PipeManager.removeMsgs([PipeConstants.STARTUP_MOVING,PipeConstants.NPC_REQ_FUNCTION],Moving_ApplicationFacade);
         Facade.removeCore(Moving_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Moving_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MOVING:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.TUNVLANG_DUIHUAN)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MOVING_PANEL);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

