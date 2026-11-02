package com.tgame.moudels.zhanWenKeHua
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhanWenKeHua.controller.ZhanWenKeHua_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZhanWenKeHua_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhanWenKeHua.ZhanWenKeHua_ApplicationFacade";
      
      public static const NEW_ITEM_TO_BACKPACK:String = "NEW_ITEM_TO_BACKPACK";
      
      public static const EXPENDGAS_AND_PROBABILITY:String = "EXPENDGAS_AND_PROBABILITY";
      
      public static const CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF:String = "CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF";
      
      public static const ITEM_SWAP_OR_MOVE:String = "ITEM_SWAP_OR_MOVE";
      
      public static const SYNTHESIZE_NOT_ITEM:String = "SYNTHESIZE_NOT_ITEM";
      
      public static const SHOW_ZHAN_WEN_KE_HUA_PANEL:String = "SHOW_ZHAN_WEN_KE_HUA_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ZhanWenKeHua_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZHAN_WEN_KE_HUA,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.NEW_ITEM_TO_BACKPACK,PipeConstants.ZHAN_WEN_KE_HUA_EXPENDGAS_AND_PROBABILITY,PipeConstants.CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF,PipeConstants.ITEM_SWAP_OR_MOVE,PipeConstants.SYNTHESIZE_NOT_ITEM,PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL],this.handlePipeMessage,ZhanWenKeHua_ApplicationFacade);
      }
      
      public static function getInstance() : ZhanWenKeHua_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZhanWenKeHua_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZhanWenKeHua_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ZhanWenKeHua_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ZHAN_WEN_KE_HUA:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.ZHAN_WEI_KE_HUA)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL,1);
               }
               break;
            case PipeConstants.NEW_ITEM_TO_BACKPACK:
               sendNotification(NEW_ITEM_TO_BACKPACK,_loc2_);
               break;
            case PipeConstants.ZHAN_WEN_KE_HUA_EXPENDGAS_AND_PROBABILITY:
               sendNotification(EXPENDGAS_AND_PROBABILITY,_loc2_);
               break;
            case PipeConstants.CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF:
               sendNotification(CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF,_loc2_);
               break;
            case PipeConstants.ITEM_SWAP_OR_MOVE:
               sendNotification(ITEM_SWAP_OR_MOVE,_loc2_);
               break;
            case PipeConstants.SYNTHESIZE_NOT_ITEM:
               sendNotification(SYNTHESIZE_NOT_ITEM,_loc2_);
               break;
            case PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL:
               sendNotification(SHOW_ZHAN_WEN_KE_HUA_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

