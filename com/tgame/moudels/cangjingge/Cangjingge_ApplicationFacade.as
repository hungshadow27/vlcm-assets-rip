package com.tgame.moudels.cangjingge
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.cangjingge.controller.Cangjingge_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Cangjingge_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.cangjingge.Cangjingge_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Cangjingge_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CANGJINGGE],this.handlePipeMessage,Cangjingge_ApplicationFacade);
      }
      
      public static function getInstance() : Cangjingge_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Cangjingge_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Cangjingge_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Cangjingge_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_CANGJINGGE:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

