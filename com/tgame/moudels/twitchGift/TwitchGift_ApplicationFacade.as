package com.tgame.moudels.twitchGift
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.twitchGift.controller.TwitchGift_StartDownCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TwitchGift_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.newPlayerGuide.TwitchGift_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NEW_ITEM_TO_BACKPACK:String = "NEW_ITEM_TO_BACKPACK";
      
      public static const SHOW_SQUIRREL_PANEL:String = "SHOW_SQUIRREL_PANEL";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_QIAN_CHUI_BAI_LIAN_PLANE:String = "SHOW_QIAN_CHUI_BAI_LIAN_PLANE";
      
      public static const USE_QIAN_KUN_DAI:String = "USE_QIAN_KUN_DAI";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public static const LONGYUAN_SKILL_CHOUJIANG:String = "LONGYUAN_SKILL_CHOUJIANG";
      
      public static const SHOW_YUANPAN_PANEL:String = "SHOW_YUANPAN_PANEL";
      
      public function TwitchGift_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TEITCH_GIFT,PipeConstants.NEW_ITEM_TO_BACKPACK,PipeConstants.SHOW_SQUIRREL_PANEL,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE,PipeConstants.SHOW_YUANPAN_PANEL,PipeConstants.LONGYUAN_SKILL_CHOUJIANG],this.handlePipeMessage,TwitchGift_ApplicationFacade);
      }
      
      public static function getInstance() : TwitchGift_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TwitchGift_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TwitchGift_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         PipeManager.removeMsg(PipeConstants.STARTUP_TEITCH_GIFT,TwitchGift_ApplicationFacade);
         Facade.removeCore(TwitchGift_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TwitchGift_StartDownCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_TEITCH_GIFT:
               this.startup();
               break;
            case PipeConstants.NEW_ITEM_TO_BACKPACK:
               sendNotification(NEW_ITEM_TO_BACKPACK,_loc2_);
               break;
            case PipeConstants.SHOW_SQUIRREL_PANEL:
               sendNotification(SHOW_SQUIRREL_PANEL,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.SQUIRREL)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SQUIRREL_PANEL);
               }
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE:
               sendNotification(SHOW_QIAN_CHUI_BAI_LIAN_PLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YUANPAN_PANEL:
               sendNotification(SHOW_YUANPAN_PANEL,_loc2_);
               break;
            case PipeConstants.LONGYUAN_SKILL_CHOUJIANG:
               sendNotification(LONGYUAN_SKILL_CHOUJIANG,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

