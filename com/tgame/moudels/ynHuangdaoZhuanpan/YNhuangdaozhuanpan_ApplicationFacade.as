package com.tgame.moudels.ynHuangdaoZhuanpan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynHuangdaoZhuanpan.controller.YNhuangdaozhuanpan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNhuangdaozhuanpan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynHuangdaoZhuanpan.YNhuangdaozhuanpan_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function YNhuangdaozhuanpan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNHUANGDAOZHUANPAN],this.handlePipeMessage,YNhuangdaozhuanpan_ApplicationFacade);
      }
      
      public static function getInstance() : YNhuangdaozhuanpan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNhuangdaozhuanpan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNhuangdaozhuanpan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNhuangdaozhuanpan_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNHUANGDAOZHUANPAN:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

