package com.tgame.moudels.reName
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.reName.controller.Rename_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Rename_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.reName.Rename_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_RENAME_PANEL:String = "SHOW_RENAME_PANEL";
      
      public function Rename_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_RENAME,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,Rename_ApplicationFacade);
      }
      
      public static function getInstance() : Rename_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Rename_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Rename_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Rename_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_RENAME:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.RENAME_PANEL)
               {
                  sendNotification(SHOW_RENAME_PANEL);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

