package com.tgame.moudels.kuafuLeitai
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.kuafuLeitai.controller.KuafuLeitai_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class KuafuLeitai_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.kuafuLeitai.KuafuLeitai_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public function KuafuLeitai_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_KUAFULEITAI,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,KuafuLeitai_ApplicationFacade);
      }
      
      public static function getInstance() : KuafuLeitai_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new KuafuLeitai_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as KuafuLeitai_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,KuafuLeitai_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_KUAFULEITAI:
               this.startup();
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

