package com.tgame.moudels.stone
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.stone.controller.Stone_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Stone_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.stone.Stone_ApplicationFacade";
      
      public static const CLOSE_EASY_STONE_PLANE:String = "PipeConstants.CLOSE_EQUIP_PUDDING_PLANE";
      
      public static const NEW_ITEM_TO_BACKPACK:String = "NEW_ITEM_TO_BACKPACK";
      
      public static const SHOW_STONE_PLANE:String = "SHOW_STONE_PLANE";
      
      public static const SYNTHESIZE_NOT_ITEM:String = "STONE_NOT_ITEM";
      
      public static const EXPENDGAS_AND_PROBABILITY:String = "EXPENDGAS_AND_PROBABILITY";
      
      public static const CLOSE_STONE_LOAD_BUFF:String = "CLOSE_STONE_LOAD_BUFF";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE:String = "SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE";
      
      public static const EASY_EQUIP_ADD_STONE:String = "EASY_EQUIP_ADD_STONE";
      
      public static const ITEM_SWAP_OR_MOVE:String = "ITEM_SWAP_OR_MOVE";
      
      public static const SIX_STONE_TO_SEVEN_STONE_PROBABILITY:String = "SIX_STONE_TO_SEVEN_STONE_PROBABILITY";
      
      public static const SHOW_HUIZHANG_PANEL:String = "SHOW_HUIZHANG_PANEL";
      
      public static const MENU_XIANGQIAN_FANHUI:String = "MENU_XIANGQIAN_FANHUI";
      
      public static const MENU_XIANGQIAN:String = "MENU_XIANGQIAN";
      
      public static const SUPER_XIANGQIAN:String = "SUPER_XIANGQIAN";
      
      public static const MENU_XUNZHANGXIANGQIAN:String = "MENU_XUNZHANGXIANGQIAN";
      
      public function Stone_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_STONE,PipeConstants.STONE_EXPENDGAS_AND_PROBABILITY,PipeConstants.SYNTHESIZE_NOT_ITEM,PipeConstants.CLOSE_EASY_STONE_PLANE,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.NEW_ITEM_TO_BACKPACK,PipeConstants.SHOW_STONE_PLANE,PipeConstants.CLOSE_STONE_LOAD_BUFF,PipeConstants.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE,PipeConstants.EASY_EQUIP_ADD_STONE,PipeConstants.ITEM_SWAP_OR_MOVE,PipeConstants.SIX_STONE_TO_SEVEN_STONE_PROBABILITY,PipeConstants.SHOW_HUIZHANG_PANEL,PipeConstants.MENU_XIANGQIAN,PipeConstants.SUPER_XIANGQIAN,PipeConstants.MENU_XIANGQIAN_FANHUI,PipeConstants.MENU_XUNZHANGXIANGQIAN],this.handlePipeMessage,Stone_ApplicationFacade);
      }
      
      public static function getInstance() : Stone_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Stone_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Stone_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Stone_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_STONE:
               this.startup();
               break;
            case PipeConstants.CLOSE_EASY_STONE_PLANE:
               sendNotification(CLOSE_EASY_STONE_PLANE);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.STONE)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
               }
               if(_loc3_ == NpcFunctionType.HUI_ZHANG_HE_CHENG)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
               }
               break;
            case PipeConstants.NEW_ITEM_TO_BACKPACK:
               sendNotification(NEW_ITEM_TO_BACKPACK,_loc2_);
               break;
            case PipeConstants.SHOW_STONE_PLANE:
               sendNotification(SHOW_STONE_PLANE,_loc2_);
               break;
            case PipeConstants.STONE_EXPENDGAS_AND_PROBABILITY:
               sendNotification(EXPENDGAS_AND_PROBABILITY,_loc2_);
               break;
            case PipeConstants.SYNTHESIZE_NOT_ITEM:
               sendNotification(SYNTHESIZE_NOT_ITEM,_loc2_);
               break;
            case PipeConstants.CLOSE_STONE_LOAD_BUFF:
               sendNotification(CLOSE_STONE_LOAD_BUFF,_loc2_);
               break;
            case PipeConstants.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE:
               sendNotification(SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE,_loc2_);
               break;
            case PipeConstants.EASY_EQUIP_ADD_STONE:
               sendNotification(EASY_EQUIP_ADD_STONE,_loc2_);
               break;
            case PipeConstants.ITEM_SWAP_OR_MOVE:
               sendNotification(ITEM_SWAP_OR_MOVE,_loc2_);
               break;
            case PipeConstants.SIX_STONE_TO_SEVEN_STONE_PROBABILITY:
               sendNotification(SIX_STONE_TO_SEVEN_STONE_PROBABILITY,_loc2_);
               break;
            case PipeConstants.SHOW_HUIZHANG_PANEL:
               sendNotification(SHOW_HUIZHANG_PANEL,_loc2_);
               break;
            case PipeConstants.MENU_XIANGQIAN:
               sendNotification(MENU_XIANGQIAN,_loc2_);
               break;
            case PipeConstants.SUPER_XIANGQIAN:
               sendNotification(SUPER_XIANGQIAN,_loc2_);
               break;
            case PipeConstants.MENU_XIANGQIAN_FANHUI:
               sendNotification(MENU_XIANGQIAN_FANHUI,_loc2_);
               break;
            case PipeConstants.MENU_XUNZHANGXIANGQIAN:
               sendNotification(MENU_XUNZHANGXIANGQIAN,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

