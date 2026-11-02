package com.tgame.moudels.zhenqiDoll
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhenqiDoll.controller.ZhenqiDoll_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZhenqiDoll_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhenqiDoll.ZhenqiDoll_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_GOODS_PANEL:String = "SHOW_GOODS_PANEL";
      
      public static const UPDATE_ZHENQI:String = "UPDATE_ZHENQI";
      
      public static const SELECT_DOLL:String = "SELECT_DOLL";
      
      public static const SELECT_DOLL_SUPER:String = "SELECT_DOLL_SUPER";
      
      public function ZhenqiDoll_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZHEN_DOLL,PipeConstants.SHOW_GOODS_PANEL,PipeConstants.SELECT_DOLL,PipeConstants.SELECT_DOLL_SUPER],this.handlePipeMessage,ZhenqiDoll_ApplicationFacade);
      }
      
      public static function getInstance() : ZhenqiDoll_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZhenqiDoll_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZhenqiDoll_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ZhenqiDoll_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ZHEN_DOLL:
               this.startup();
               break;
            case PipeConstants.SHOW_GOODS_PANEL:
               sendNotification(SHOW_GOODS_PANEL,_loc2_);
               break;
            case PipeConstants.SELECT_DOLL:
               sendNotification(SELECT_DOLL,_loc2_);
               break;
            case PipeConstants.SELECT_DOLL_SUPER:
               sendNotification(SELECT_DOLL_SUPER,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

