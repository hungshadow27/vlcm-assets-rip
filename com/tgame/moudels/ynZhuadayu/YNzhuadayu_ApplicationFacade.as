package com.tgame.moudels.ynZhuadayu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynZhuadayu.controller.YNzhuadayu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNzhuadayu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynZhuadayu.YNzhuadayu_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YNZHUADAYUPANEL:String = "SHOW_YNZHUADAYUPANEL";
      
      public function YNzhuadayu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNZHUADAYU,PipeConstants.SHOW_YNZHUADAYUPANEL],this.handlePipeMessage,YNzhuadayu_ApplicationFacade);
      }
      
      public static function getInstance() : YNzhuadayu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNzhuadayu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNzhuadayu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNzhuadayu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNZHUADAYU:
               this.startup();
               break;
            case PipeConstants.SHOW_YNZHUADAYUPANEL:
               sendNotification(SHOW_YNZHUADAYUPANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

