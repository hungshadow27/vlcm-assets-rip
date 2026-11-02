package com.tgame.moudels.ynTulongdao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynTulongdao.controller.YNtulongdao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNtulongdao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynTulongdao.YNtulongdao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YNTULONGDAOPANEL:String = "SHOW_YNTULONGDAOPANEL";
      
      public function YNtulongdao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNTULONGDAO,PipeConstants.SHOW_YNTULONGDAOPANEL],this.handlePipeMessage,YNtulongdao_ApplicationFacade);
      }
      
      public static function getInstance() : YNtulongdao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNtulongdao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNtulongdao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNtulongdao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNTULONGDAO:
               this.startup();
               break;
            case PipeConstants.SHOW_YNTULONGDAOPANEL:
               sendNotification(SHOW_YNTULONGDAOPANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

