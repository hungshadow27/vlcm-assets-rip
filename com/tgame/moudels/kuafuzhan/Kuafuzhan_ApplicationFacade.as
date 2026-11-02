package com.tgame.moudels.kuafuzhan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.kuafuzhan.controller.Kuafuzhan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Kuafuzhan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.kuafuzhan.Kuafuzhan_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public function Kuafuzhan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_KUAFUZHAN,PipeConstants.ENTER_SCENE,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,Kuafuzhan_ApplicationFacade);
      }
      
      public static function getInstance() : Kuafuzhan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Kuafuzhan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Kuafuzhan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Kuafuzhan_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_KUAFUZHAN:
               this.startup();
               break;
            case PipeConstants.ENTER_SCENE:
               sendNotification(ENTER_SCENE,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

