package com.tgame.moudels.VIP
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.VIP.controller.VIP_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class VIP_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.VIP.VIP_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_VIP_PANEL:String = "SHOW_VIP_PANEL";
      
      public function VIP_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_VIP,PipeConstants.SHOW_VIP_PANEL],this.handlePipeMessage,VIP_ApplicationFacade);
      }
      
      public static function getInstance() : VIP_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new VIP_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as VIP_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,VIP_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_VIP:
               this.startup();
               break;
            case PipeConstants.SHOW_VIP_PANEL:
               sendNotification(SHOW_VIP_PANEL);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

