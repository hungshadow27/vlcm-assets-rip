package com.tgame.moudels.shuXingDaZaoKa
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shuXingDaZaoKa.controller.ShuxingDaZaoKa_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ShuXingDaZaoKa_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shuXingDaZaoKa.ShuXingDaZaoKa_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ShuXingDaZaoKa_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHUXINGDAZAOKA],this.handlePipeMessage,ShuXingDaZaoKa_ApplicationFacade);
      }
      
      public static function getInstance() : ShuXingDaZaoKa_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ShuXingDaZaoKa_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ShuXingDaZaoKa_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ShuxingDaZaoKa_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SHUXINGDAZAOKA:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

