package com.tgame.moudels.wuxiakapai
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wuxiakapai.controller.Wuxiakapai_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Wuxiakapai_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wuxiakapai.Wuxiakapai_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REQUEST_WUXIAKAPAI:String = "REQUEST_WUXIAKAPAI";
      
      public function Wuxiakapai_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WUXIAKAPAI,PipeConstants.REQUEST_WUXIAKAPAI],this.handlePipeMessage,Wuxiakapai_ApplicationFacade);
      }
      
      public static function getInstance() : Wuxiakapai_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Wuxiakapai_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Wuxiakapai_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Wuxiakapai_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_WUXIAKAPAI:
               this.startup();
               break;
            case PipeConstants.REQUEST_WUXIAKAPAI:
               sendNotification(REQUEST_WUXIAKAPAI,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

