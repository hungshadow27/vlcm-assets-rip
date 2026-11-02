package com.tgame.moudels.lianti
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.lianti.controller.Lianti_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Lianti_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.lianti.Lianti_ApplicationFacade";
      
      public static const ROUSHEN_DINGJI_JIHUO_SHUXING:String = "ROUSHEN_DINGJI_JIHUO_SHUXING";
      
      public static const ROUSHEN_MOHUA:String = "ROUSHEN_MOHUA";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Lianti_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_LIANTI,PipeConstants.DINGJI_JIHUO_SHUXING,PipeConstants.SHOW_MO_HUA],this.handlePipeMessage,Lianti_ApplicationFacade);
      }
      
      public static function getInstance() : Lianti_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Lianti_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Lianti_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Lianti_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_LIANTI:
               this.startup();
               break;
            case PipeConstants.DINGJI_JIHUO_SHUXING:
               sendNotification(ROUSHEN_DINGJI_JIHUO_SHUXING,_loc2_);
               break;
            case PipeConstants.SHOW_MO_HUA:
               sendNotification(ROUSHEN_MOHUA,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

