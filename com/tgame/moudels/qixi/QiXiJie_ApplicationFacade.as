package com.tgame.moudels.qixi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.qixi.controller.QiXiJie_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class QiXiJie_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.qixi.QiXiJie_ApplicationFacade";
      
      public static const GET_QIXIJIE_PANEL:String = "GET_QIXIJIE_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function QiXiJie_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.GET_QIXIJIE_PANEL,PipeConstants.STARTUP_QIXIJIE],this.handlePipeMessage,QiXiJie_ApplicationFacade);
      }
      
      public static function getInstance() : QiXiJie_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new QiXiJie_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as QiXiJie_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,QiXiJie_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_QIXIJIE:
               this.startup();
               break;
            case PipeConstants.GET_QIXIJIE_PANEL:
               sendNotification(GET_QIXIJIE_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

