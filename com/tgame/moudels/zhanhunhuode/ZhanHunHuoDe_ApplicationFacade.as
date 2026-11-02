package com.tgame.moudels.zhanhunhuode
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhanhunhuode.controller.Zhanhunhuode_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZhanHunHuoDe_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhanhunhuode.ZhanHunHuoDe_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_ZHANHUNHUODE:String = "SHOW_ZHANHUNHUODE";
      
      public function ZhanHunHuoDe_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZHANHUNHUODE,PipeConstants.SHOW_ZHANHUNHUODE],this.handlePipeMessage,ZhanHunHuoDe_ApplicationFacade);
      }
      
      public static function getInstance() : ZhanHunHuoDe_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZhanHunHuoDe_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZhanHunHuoDe_ApplicationFacade;
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ZHANHUNHUODE:
               this.startup();
               break;
            case PipeConstants.SHOW_ZHANHUNHUODE:
               sendNotification(SHOW_ZHANHUNHUODE,_loc2_);
         }
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Zhanhunhuode_StartupCommand);
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

