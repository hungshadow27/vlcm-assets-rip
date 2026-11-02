package com.tgame.moudels.jingmai
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jingmai.controller.Jingmai_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Jingmai_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jingmai.Jingmai_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SWAP_JINGMAI_ZONGLAN:String = "SWAP_JINGMAI_ZONGLAN";
      
      public function Jingmai_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JINGMAI,PipeConstants.SWAP_JINGMAI_ZONGLAN],this.handlePipeMessage,Jingmai_ApplicationFacade);
      }
      
      public static function getInstance() : Jingmai_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Jingmai_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Jingmai_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Jingmai_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_JINGMAI:
               this.startup();
               break;
            case PipeConstants.SWAP_JINGMAI_ZONGLAN:
               sendNotification(SWAP_JINGMAI_ZONGLAN,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

