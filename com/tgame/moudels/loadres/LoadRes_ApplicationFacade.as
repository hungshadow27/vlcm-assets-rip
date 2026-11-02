package com.tgame.moudels.loadres
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.loadres.controller.LoadRes_ShutdownCommand;
   import com.tgame.moudels.loadres.controller.LoadRes_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class LoadRes_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.loadres.LoadRes_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHUTDOWN:String = "SHUTDOWN";
      
      public static const LOAD_LAN:String = "LOAD_LAN";
      
      public static const LOAD_CONFIG:String = "LOAD_CONFIG";
      
      public static const LOAD_SKIN:String = "LOAD_SKIN";
      
      public static const LOAD_LOGIN:String = "LOAD_LOGIN";
      
      public static const LOAD_RSL:String = "LOAD_RSL";
      
      public static const LOAD_XML:String = "LOAD_XML";
      
      public function LoadRes_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsg(PipeConstants.STARTUP_LOADRES,this.handlePipeMessage,LoadRes_ApplicationFacade);
      }
      
      public static function getInstance() : LoadRes_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new LoadRes_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as LoadRes_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         this.shutdown();
         PipeManager.removeMsg(PipeConstants.STARTUP_LOADRES,LoadRes_ApplicationFacade);
         Facade.removeCore(LoadRes_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,LoadRes_StartupCommand);
         registerCommand(SHUTDOWN,LoadRes_ShutdownCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_LOADRES:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
      
      private function shutdown() : void
      {
         sendNotification(SHUTDOWN);
      }
   }
}

