package com.tgame.moudels.duanwujie2015
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.duanwujie2015.controller.DuanWuJie2015_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DuanWuJie2015_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.duanwujie2015.DuanWuJie2015_ApplicationFacade";
      
      public static const GET_DUANWUJIE2015_PANEL:String = "GET_DUANWUJIE2015_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function DuanWuJie2015_ApplicationFacade(param1:String)
      {
         super(NAME);
         PipeManager.registerMsgs([PipeConstants.GET_DUANWUJIE2015_PANEL,PipeConstants.STARTUP_DUANWUJIE2015],this.handlePipeMessage,DuanWuJie2015_ApplicationFacade);
      }
      
      public static function getInstance() : DuanWuJie2015_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DuanWuJie2015_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DuanWuJie2015_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DuanWuJie2015_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_DUANWUJIE2015:
               this.startup();
               break;
            case PipeConstants.GET_DUANWUJIE2015_PANEL:
               sendNotification(GET_DUANWUJIE2015_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

