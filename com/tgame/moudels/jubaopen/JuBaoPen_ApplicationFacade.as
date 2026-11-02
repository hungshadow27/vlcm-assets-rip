package com.tgame.moudels.jubaopen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jubaopen.controller.JuBaoPen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JuBaoPen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jubaopen.JuBaoPen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_JUBAOPEN_PANEL:String = "SHOW_JUBAOPEN_PANEL";
      
      public static const CLOSE_JUBAOPEN_PANEL:String = "CLOSE_JUBAOPEN_PANEL";
      
      public function JuBaoPen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JUBAOPEN,PipeConstants.SHOW_JUBAOPEN_PANEL,PipeConstants.CLOSE_JUBAOPEN_PANEL],this.handlePipeMessage,JuBaoPen_ApplicationFacade);
      }
      
      public static function getInstance() : JuBaoPen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JuBaoPen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JuBaoPen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JuBaoPen_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_JUBAOPEN:
               this.startup();
               break;
            case PipeConstants.SHOW_JUBAOPEN_PANEL:
               sendNotification(SHOW_JUBAOPEN_PANEL);
               break;
            case PipeConstants.CLOSE_JUBAOPEN_PANEL:
               sendNotification(CLOSE_JUBAOPEN_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

