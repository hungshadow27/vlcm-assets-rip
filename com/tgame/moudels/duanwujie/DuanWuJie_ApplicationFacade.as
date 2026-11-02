package com.tgame.moudels.duanwujie
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.duanwujie.controller.DuanWuJie_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DuanWuJie_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.duanwujie.DuanWuJie_ApplicationFacade";
      
      public static const GET_DUANWUJIE_PANEL:String = "GET_DUANWUJIE_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function DuanWuJie_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.GET_DUANWUJIE_PANEL,PipeConstants.STARTUP_DUANWUJIE],this.handlePipeMessage,DuanWuJie_ApplicationFacade);
      }
      
      public static function getInstance() : DuanWuJie_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DuanWuJie_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DuanWuJie_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DuanWuJie_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_DUANWUJIE:
               this.startup();
               break;
            case PipeConstants.GET_DUANWUJIE_PANEL:
               sendNotification(GET_DUANWUJIE_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

