package com.tgame.moudels.doudizhu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.doudizhu.controller.DouDiZhu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DouDiZhu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.doudizhu.DouDiZhu_ApplicationFacade";
      
      public static const GET_DOUDIZHU_PANEL:String = "GET_DOUDIZHU_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function DouDiZhu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.GET_DOUDIZHU_PANEL,PipeConstants.STARTUP_DOUDIZHU],this.handlePipeMessage,DouDiZhu_ApplicationFacade);
      }
      
      public static function getInstance() : DouDiZhu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DouDiZhu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DouDiZhu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DouDiZhu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_DOUDIZHU:
               this.startup();
               break;
            case PipeConstants.GET_DOUDIZHU_PANEL:
               sendNotification(GET_DOUDIZHU_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

