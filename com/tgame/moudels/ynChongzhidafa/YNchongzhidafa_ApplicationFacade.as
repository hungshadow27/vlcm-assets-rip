package com.tgame.moudels.ynChongzhidafa
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynChongzhidafa.controller.YNchongzhidafa_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNchongzhidafa_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynChongzhidafa.YNchongzhidafa_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YNCHONGZHIDAFAPANEL:String = "SHOW_YNCHONGZHIDAFAPANEL";
      
      public function YNchongzhidafa_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNCHONGZHIDAFA,PipeConstants.SHOW_YNCHONGZHIDAFAPANEL],this.handlePipeMessage,YNchongzhidafa_ApplicationFacade);
      }
      
      public static function getInstance() : YNchongzhidafa_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNchongzhidafa_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNchongzhidafa_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNchongzhidafa_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNCHONGZHIDAFA:
               this.startup();
               break;
            case PipeConstants.SHOW_YNCHONGZHIDAFAPANEL:
               sendNotification(SHOW_YNCHONGZHIDAFAPANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

