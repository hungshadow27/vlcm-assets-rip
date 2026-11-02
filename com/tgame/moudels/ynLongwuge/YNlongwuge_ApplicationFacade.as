package com.tgame.moudels.ynLongwuge
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynLongwuge.controller.YNlongwuge_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNlongwuge_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynLongwuge.YNlongwuge_ApplicationFacade";
      
      public static const YN_SHOW_LONGWUGEPANEL:String = "YN_SHOW_LONGWUGEPANEL";
      
      public static const YN_REQUEST_LONGWUGE:String = "YN_REQUEST_LONGWUGE";
      
      public static const STARTUP:String = "STARTUP";
      
      public function YNlongwuge_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUENANLONGWUGE,PipeConstants.YN_REQUEST_LONGWUGE],this.handlePipeMessage,YNlongwuge_ApplicationFacade);
      }
      
      public static function getInstance() : YNlongwuge_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNlongwuge_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNlongwuge_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNlongwuge_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENANLONGWUGE:
               this.startup();
               break;
            case PipeConstants.YN_REQUEST_LONGWUGE:
               sendNotification(YN_REQUEST_LONGWUGE,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

