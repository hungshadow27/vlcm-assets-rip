package com.tgame.moudels.newPlayerGuide
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.newPlayerGuide.controller.NewPlayerGuide_ShutDownCommand;
   import com.tgame.moudels.newPlayerGuide.controller.NewPlayerGuide_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class NewPlayerGuide_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.newPlayerGuide.NewPlayerGuide_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHUTDOWN:String = "SHUTDOWN";
      
      public function NewPlayerGuide_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_NEW_PLAYER_GUIDE,PipeConstants.KUAFU_STATUS],this.handlePipeMessage,NewPlayerGuide_ApplicationFacade);
      }
      
      public static function getInstance() : NewPlayerGuide_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new NewPlayerGuide_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as NewPlayerGuide_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         this.shutdown();
         PipeManager.removeMsg(PipeConstants.STARTUP_NEW_PLAYER_GUIDE,NewPlayerGuide_ApplicationFacade);
         Facade.removeCore(NewPlayerGuide_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,NewPlayerGuide_StartupCommand);
         registerCommand(SHUTDOWN,NewPlayerGuide_ShutDownCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_NEW_PLAYER_GUIDE:
               this.startup();
               break;
            case PipeConstants.KUAFU_STATUS:
               if(_loc2_ as Boolean)
               {
                  NewPlayerGuideStaticFun.removeAllImageInstanceGuide();
               }
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

