package com.tgame.moudels.baguazhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.baguazhen.controller.BaGuaZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BaGuaZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.baguazhen.BaGuaZhen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GET_BAGUAZHEN_PANEL:String = "GET_BAGUAZHEN_PANEL";
      
      public function BaGuaZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BAGUAZHEN,PipeConstants.GET_BAGUAZHEN_PANEL],this.handlePipeMessage,BaGuaZhen_ApplicationFacade);
      }
      
      public static function getInstance() : BaGuaZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BaGuaZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BaGuaZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BaGuaZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_BAGUAZHEN:
               this.startup();
               break;
            case PipeConstants.GET_BAGUAZHEN_PANEL:
               sendNotification(GET_BAGUAZHEN_PANEL);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

