package com.tgame.moudels.moxue
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.moxue.controller.MoXue_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MoXue_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.moxue.MoXue_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_GOODS_PANEL:String = "SHOW_GOODS_PANEL";
      
      public static const SELECT_DOLL:String = "SELECT_DOLL";
      
      public function MoXue_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MOXUE_DOLL,PipeConstants.SHOW_GOODS_PANEL,PipeConstants.SELECT_MOXUE_DOLL,PipeConstants.SHOW_MOXUE_DOLL_PANEL],this.handlePipeMessage,MoXue_ApplicationFacade);
      }
      
      public static function getInstance() : MoXue_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MoXue_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MoXue_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MoXue_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MOXUE_DOLL:
               this.startup();
               break;
            case PipeConstants.SHOW_GOODS_PANEL:
               sendNotification(SHOW_GOODS_PANEL,_loc2_);
               break;
            case PipeConstants.SELECT_MOXUE_DOLL:
               sendNotification(SELECT_DOLL,_loc2_);
               break;
            case PipeConstants.SHOW_MOXUE_DOLL_PANEL:
               sendNotification(SHOW_GOODS_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

