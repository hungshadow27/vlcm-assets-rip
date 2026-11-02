package com.tgame.moudels.fabao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.fabao.controller.Fabao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Fabao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.fabao.Fabao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REQUEST_FABAOPANEL:* = "REQUEST_FABAOPANEL";
      
      public static const REQUEST_FABAOLINGLIPANEL:String = "REQUEST_FABAOLINGLIPANEL";
      
      public function Fabao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_FABAO,PipeConstants.REQUEST_FABAOPANEL,PipeConstants.REQUEST_FABAOLINGLIPANEL],this.handlePipeMessage,Fabao_ApplicationFacade);
      }
      
      public static function getInstance() : Fabao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Fabao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Fabao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Fabao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_FABAO:
               this.startup();
               break;
            case PipeConstants.REQUEST_FABAOPANEL:
               sendNotification(REQUEST_FABAOPANEL,_loc2_);
               break;
            case PipeConstants.REQUEST_FABAOLINGLIPANEL:
               sendNotification(REQUEST_FABAOLINGLIPANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

