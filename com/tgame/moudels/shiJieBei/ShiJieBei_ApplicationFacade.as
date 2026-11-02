package com.tgame.moudels.shiJieBei
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shiJieBei.controller.ShiJieBei_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ShiJieBei_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.shiJieBei.ShiJieBei_ApplicationFacade";
      
      public static const SHOW_SHIJIEBEI_PANEL:String = "SHOW_SHIJIEBEI_PANEL";
      
      public function ShiJieBei_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHIJIEBEI],this.handlePipeMessage,ShiJieBei_ApplicationFacade);
      }
      
      public static function getInstance() : ShiJieBei_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ShiJieBei_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ShiJieBei_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ShiJieBei_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SHIJIEBEI:
               sendNotification(STARTUP);
         }
      }
   }
}

