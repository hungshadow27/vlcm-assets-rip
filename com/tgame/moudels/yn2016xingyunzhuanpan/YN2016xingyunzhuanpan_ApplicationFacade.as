package com.tgame.moudels.yn2016xingyunzhuanpan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yn2016xingyunzhuanpan.controller.YN2016xingyunzhuanpan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YN2016xingyunzhuanpan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yn2016xingyunzhuanpan.YN2016xingyunzhuanpan_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YN2016XINGYUNZHUANPAN:String = "SHOW_YN2016XINGYUNZHUANPAN";
      
      public function YN2016xingyunzhuanpan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YN2016XINGYUNZHUANPAN,PipeConstants.SHOW_YN2016XINGYUNZHUANPAN],this.handlePipeMessage,YN2016xingyunzhuanpan_ApplicationFacade);
      }
      
      public static function getInstance() : YN2016xingyunzhuanpan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YN2016xingyunzhuanpan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YN2016xingyunzhuanpan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YN2016xingyunzhuanpan_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YN2016XINGYUNZHUANPAN:
               this.startup();
               break;
            case PipeConstants.SHOW_YN2016XINGYUNZHUANPAN:
               sendNotification(SHOW_YN2016XINGYUNZHUANPAN,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

