package com.tgame.moudels.refreshPoint
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.refreshPoint.controller.RefreshPoint_StartCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class RefreshPoint_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.refreshPoint.RefreshPoint_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ADD_POINT:String = "ADD_POINT";
      
      public function RefreshPoint_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_REFRESH_POINT,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,RefreshPoint_ApplicationFacade);
      }
      
      public static function getInstance() : RefreshPoint_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new RefreshPoint_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as RefreshPoint_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         PipeManager.removeMsgs([PipeConstants.STARTUP_RANK,PipeConstants.NPC_REQ_FUNCTION],RefreshPoint_ApplicationFacade);
         Facade.removeCore(RefreshPoint_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,RefreshPoint_StartCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_REFRESH_POINT:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.XIDIAN)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_REFRESHPOINT_PLANE);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

