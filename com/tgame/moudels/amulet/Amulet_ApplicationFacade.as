package com.tgame.moudels.amulet
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.amulet.controller.Amulet_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Amulet_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = PipeConstants.STARTUP_AMULET;
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_AMULT:String = "SHOW_AMULT";
      
      public static const SHOW_AMULT_ADD_SHELIZI:String = "SHOW_AMULT_ADD_SHELIZI";
      
      public static const ITEM_SWAP_OR_MOVE:String = "ITEM_SWAP_OR_MOVE";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public static const SHOW_SHEN_LONG_AMULT:String = "SHOW_SHEN_LONG_AMULT";
      
      public static const SHOW_RONGXUEDAN_PLANE:String = "SHOW_RONGXUEDAN_PLANE";
      
      public static const GOODS_CHANGE:String = "GOODS_CHANGE";
      
      public static const SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG:String = "SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG";
      
      public static const SHOW_BAJIGUIYUANHUFU_DA_KONG:String = "SHOW_BAJIGUIYUANHUFU_DA_KONG";
      
      public static const SHOW_BAOSHI_DUANLIAN:String = "SHOW_BAOSHI_DUANLIAN";
      
      public function Amulet_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_AMULET,PipeConstants.SHOW_AMULT,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.SHOW_AMULT_ADD_SHELIZI,PipeConstants.ITEM_SWAP_OR_MOVE,PipeConstants.SHOW_SHEN_LONG_AMULT,PipeConstants.SHOW_RONGXUEDAN_PLANE,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG,PipeConstants.SHOW_BAJIGUIYUANHUFU_DA_KONG,PipeConstants.SHOW_BAOSHI_DUANLIAN],this.handlePipeMessage,Amulet_ApplicationFacade);
      }
      
      public static function getInstance() : Amulet_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Amulet_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Amulet_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Amulet_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_AMULET:
               this.startup();
               break;
            case PipeConstants.SHOW_AMULT:
               sendNotification(SHOW_AMULT,_loc2_);
               break;
            case PipeConstants.SHOW_AMULT_ADD_SHELIZI:
               sendNotification(SHOW_AMULT_ADD_SHELIZI,_loc2_);
               break;
            case PipeConstants.ITEM_SWAP_OR_MOVE:
               sendNotification(ITEM_SWAP_OR_MOVE,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.AMULT)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
               }
               if(_loc3_ == NpcFunctionType.SHEN_LONG_AMULT)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
               }
               if(_loc3_ == NpcFunctionType.SHEN_LONG_HU_SHEN_FU_DA_KONG)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG);
               }
               break;
            case PipeConstants.SHOW_SHEN_LONG_AMULT:
               sendNotification(SHOW_SHEN_LONG_AMULT,_loc2_);
               break;
            case PipeConstants.SHOW_RONGXUEDAN_PLANE:
               sendNotification(SHOW_RONGXUEDAN_PLANE,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGE);
               break;
            case PipeConstants.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG:
               sendNotification(SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG,_loc2_);
               break;
            case PipeConstants.SHOW_BAJIGUIYUANHUFU_DA_KONG:
               sendNotification(SHOW_BAJIGUIYUANHUFU_DA_KONG,_loc2_);
               break;
            case PipeConstants.SHOW_BAOSHI_DUANLIAN:
               sendNotification(SHOW_BAOSHI_DUANLIAN,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

