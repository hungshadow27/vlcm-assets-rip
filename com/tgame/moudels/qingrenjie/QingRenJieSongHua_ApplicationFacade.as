package com.tgame.moudels.qingrenjie
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.qingrenjie.controller.QingRenJieSongHua_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class QingRenJieSongHua_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.qingrenjie.QingRenJieSongHua_ApplicationFacade";
      
      public static const YN_SHOW_QINGRENJIEHUODONG2015:String = "YN_SHOW_QINGRENJIEHUODONG2015";
      
      public function QingRenJieSongHua_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_QINGRENJIESONGHUA,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.YN_SHOW_QINGRENJIEHUODONG2015],this.handlePipeMessage,QingRenJieSongHua_ApplicationFacade);
      }
      
      public static function getInstance() : QingRenJieSongHua_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new QingRenJieSongHua_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as QingRenJieSongHua_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,QingRenJieSongHua_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_QINGRENJIESONGHUA:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               break;
            case PipeConstants.YN_SHOW_QINGRENJIEHUODONG2015:
               sendNotification(YN_SHOW_QINGRENJIEHUODONG2015,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

