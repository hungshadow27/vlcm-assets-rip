package com.tgame.moudels.jinzhongzhao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jinzhongzhao.controller.Jinzhongzhao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Jinzhongzhao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jinzhongzhao.Jinzhongzhao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Jinzhongzhao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JINZHONGZHAO],this.handlePipeMessage,Jinzhongzhao_ApplicationFacade);
      }
      
      public static function getInstance() : Jinzhongzhao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Jinzhongzhao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Jinzhongzhao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Jinzhongzhao_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JINZHONGZHAO:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

