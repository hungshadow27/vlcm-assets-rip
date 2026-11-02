package com.tgame.moudels.liumaishenjian
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.liumaishenjian.controller.Liumaishenjian_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Liumaishenjian_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.liumaishenjian.Liumaishenjian_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Liumaishenjian_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_LIUMAISHENJIAN],this.handlePipeMessage,Liumaishenjian_ApplicationFacade);
      }
      
      public static function getInstance() : Liumaishenjian_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Liumaishenjian_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Liumaishenjian_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Liumaishenjian_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_LIUMAISHENJIAN:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

