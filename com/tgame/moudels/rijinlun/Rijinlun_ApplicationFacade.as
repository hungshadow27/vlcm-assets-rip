package com.tgame.moudels.rijinlun
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.rijinlun.controller.Rijinlun_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Rijinlun_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.rijinlun.Rijinlun_ApplicationFacade";
      
      public function Rijinlun_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_RIJINLUN],this.handlePipeMessage,Rijinlun_ApplicationFacade);
      }
      
      public static function getInstance() : Rijinlun_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Rijinlun_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Rijinlun_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Rijinlun_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_RIJINLUN:
               sendNotification(STARTUP);
         }
      }
   }
}

