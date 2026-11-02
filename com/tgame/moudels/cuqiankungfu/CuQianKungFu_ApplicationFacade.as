package com.tgame.moudels.cuqiankungfu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.cuqiankungfu.controller.CuQianKungFu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class CuQianKungFu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.cuqiankungfu.CuQianKungFu_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function CuQianKungFu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CUQIANKUNGFU],this.handlePipeMessage,CuQianKungFu_ApplicationFacade);
      }
      
      public static function getInstance() : CuQianKungFu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new CuQianKungFu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as CuQianKungFu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,CuQianKungFu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_CUQIANKUNGFU:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

