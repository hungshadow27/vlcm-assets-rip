package com.tgame.moudels.qingrenjiesonghuabang
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.qingrenjiesonghuabang.controller.QingRenJieSongHuaBang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class QingRenJieSongHuaBang_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.qingrenjiesonghuabang.QingRenJieSongHuaBang_ApplicationFacade";
      
      public function QingRenJieSongHuaBang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_QINGRENJIE_SONGHUABANG,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,QingRenJieSongHuaBang_ApplicationFacade);
      }
      
      public static function getInstance() : QingRenJieSongHuaBang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new QingRenJieSongHuaBang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as QingRenJieSongHuaBang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,QingRenJieSongHuaBang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_QINGRENJIE_SONGHUABANG:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.QINGRENJIE_CHAKANSONGHUABANG && !Fun.isVisible(GameInstance.uiInstance._qingrenjieSongHuaBangPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIE_SONGHUABANG_PLANE);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

