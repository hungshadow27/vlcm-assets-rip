package com.tgame.moudels.afk
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.afk.controller.Afk_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Afk_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.char.Attribute_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const AFK_STOP:String = "AFK_STOP";
      
      public static const UPDATE_AFK_CONFIG:String = "UPDATE_AFK_CONFIG";
      
      public function Afk_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_AFK,PipeConstants.AFK_START,PipeConstants.UPDATE_AFK_CONFIG],this.handlePipeMessage,Afk_ApplicationFacade);
      }
      
      public static function getInstance() : Afk_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Afk_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Afk_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Afk_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_AFK:
               this.startup();
               break;
            case PipeConstants.AFK_START:
               sendNotification(AFK_STOP,_loc2_);
               break;
            case PipeConstants.UPDATE_AFK_CONFIG:
               sendNotification(UPDATE_AFK_CONFIG,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

