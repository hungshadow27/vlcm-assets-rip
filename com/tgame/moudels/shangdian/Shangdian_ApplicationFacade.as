package com.tgame.moudels.shangdian
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shangdian.controller.Shangdian_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Shangdian_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shangdian.Shangdian_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Shangdian_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHANGDIAN,PipeConstants.SHOW_XIANSHISHANGDIAN_PANEL],this.handlePipeMessage,Shangdian_ApplicationFacade);
      }
      
      public static function getInstance() : Shangdian_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Shangdian_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Shangdian_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Shangdian_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_SHANGDIAN:
               this.startup();
               break;
            case PipeConstants.SHOW_XIANSHISHANGDIAN_PANEL:
               sendNotification(_loc2_,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

