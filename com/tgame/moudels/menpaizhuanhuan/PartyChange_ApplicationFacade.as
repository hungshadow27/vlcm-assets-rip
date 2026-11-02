package com.tgame.moudels.menpaizhuanhuan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.menpaizhuanhuan.controller.PartyChange_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class PartyChange_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.menpaizhuanhuan.PartyChange_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function PartyChange_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MENPAIZHUANGHUAN],this.handlePipeMessage,PartyChange_ApplicationFacade);
      }
      
      public static function getInstance() : PartyChange_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new PartyChange_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as PartyChange_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,PartyChange_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_MENPAIZHUANGHUAN:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

