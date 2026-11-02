package com.tgame.moudels.yn2016newyear
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yn2016newyear.controller.YN2016newyear_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YN2016newyear_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yn2016newyear.YN2016newyear_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YN2016CGPANEL:String = "SHOW_YN2016CGPANEL";
      
      public static const SHOW_YN2016DLPANEL:String = "SHOW_YN2016DLPANEL";
      
      public static const SHOW_YN2016ONLINEPANEL:String = "SHOW_YN2016ONLINEPANEL";
      
      public static const SHOW_YNNEWYEARSHUOMING:String = "SHOW_YNNEWYEARSHUOMING";
      
      public static const SHOW_YN2016XIAOFEIPANEL:String = "SHOW_YN2016XIAOFEIPANEL";
      
      public function YN2016newyear_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUENAN2016NEWYEAR,PipeConstants.SHOW_YN2016CGPANEL,PipeConstants.SHOW_YN2016DLPANEL,PipeConstants.SHOW_YN2016ONLINEPANEL,PipeConstants.SHOW_YNNEWYEARSHUOMING,PipeConstants.SHOW_YN2016XIAOFEI],this.handlePipeMessage,YN2016newyear_ApplicationFacade);
      }
      
      public static function getInstance() : YN2016newyear_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YN2016newyear_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YN2016newyear_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YN2016newyear_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENAN2016NEWYEAR:
               this.startup();
               break;
            case PipeConstants.SHOW_YN2016CGPANEL:
               sendNotification(SHOW_YN2016CGPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016DLPANEL:
               sendNotification(SHOW_YN2016DLPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016ONLINEPANEL:
               sendNotification(SHOW_YN2016ONLINEPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YNNEWYEARSHUOMING:
               sendNotification(SHOW_YNNEWYEARSHUOMING,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016XIAOFEI:
               sendNotification(SHOW_YN2016XIAOFEIPANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

