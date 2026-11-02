package com.tgame.moudels.ChristmasRank
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ChristmasRank.controller.ChristmasRank_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ChristmasRank_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.ChristmasRank.ChristmasRank_ApplicationFacade";
      
      public function ChristmasRank_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CHRISTMASRANK],this.handlePipeMessage,ChristmasRank_ApplicationFacade);
      }
      
      public static function getInstance() : ChristmasRank_ApplicationFacade
      {
         if(instanceMap[PipeConstants.STARTUP_CHRISTMASRANK] == null)
         {
            instanceMap[PipeConstants.STARTUP_CHRISTMASRANK] = new ChristmasRank_ApplicationFacade(PipeConstants.STARTUP_CHRISTMASRANK);
         }
         return instanceMap[PipeConstants.STARTUP_CHRISTMASRANK] as ChristmasRank_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ChristmasRank_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_CHRISTMASRANK:
               sendNotification(STARTUP);
         }
      }
   }
}

