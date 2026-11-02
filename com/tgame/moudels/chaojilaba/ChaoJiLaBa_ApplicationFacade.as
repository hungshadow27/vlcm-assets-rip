package com.tgame.moudels.chaojilaba
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.chaojilaba.controller.ChaoJiLaBa_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ChaoJiLaBa_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.chaojilaba.ChaoJiLaBa_ApplicationFacade";
      
      public static const GET_CHAOJILABA_PANEL:String = "GET_CHAOJILABA_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ChaoJiLaBa_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.GET_CHAOJILABA_PANEL,PipeConstants.STARTUP_CHAOJILABA],this.handlePipeMessage,ChaoJiLaBa_ApplicationFacade);
      }
      
      public static function getInstance() : ChaoJiLaBa_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ChaoJiLaBa_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ChaoJiLaBa_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ChaoJiLaBa_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_CHAOJILABA:
               this.startup();
               break;
            case PipeConstants.GET_CHAOJILABA_PANEL:
               sendNotification(GET_CHAOJILABA_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

