package com.tgame.moudels.buchangfuben
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.buchangfuben.controller.BuchangFuben_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BuchangFuben_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.buchangfuben.BuchangFuben_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_BUCHANGFUBEN_PANEL:String = "SHOW_BUCHANGFUBEN_PANEL";
      
      public function BuchangFuben_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BUCHANGFUBEN,PipeConstants.SHOW_BUCHANGFUBEN_PANEL],this.handlePipeMessage,BuchangFuben_ApplicationFacade);
      }
      
      public static function getInstance() : BuchangFuben_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BuchangFuben_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BuchangFuben_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BuchangFuben_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_BUCHANGFUBEN:
               this.startup();
               break;
            case PipeConstants.SHOW_BUCHANGFUBEN_PANEL:
               sendNotification(SHOW_BUCHANGFUBEN_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

