package com.tgame.moudels.rank
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.rank.controller.Rank_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Rank_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.rank.Rank_ApplicationFacade";
      
      public static const SEND_CHONGBAI_BISHI:String = "SEND_CHONGBAI_BISHI";
      
      public static const SHOW_FB_RANK_PLANE:String = "SHOW_FB_RANK_PLANE";
      
      public static const KUA_FU_RANK_DATA_SEND:String = "KUA_FU_RANK_DATA_SEND";
      
      public static const LOOK_PLAYER_ZHAN_DOU_LI:String = "LOOK_PLAYER_ZHAN_DOU_LI";
      
      public static const REQUEST_YUENANRANKING_PANEL:String = "REQUEST_YUENANRANKING_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Rank_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_RANK,PipeConstants.CHONGBAI_BISHI,PipeConstants.KUA_FU_RANK_DATA_SEND,PipeConstants.LOOK_PLAYER_ZHAN_DOU_LI,PipeConstants.REQUEST_YUENANRANKING_PANEL],this.handlePipeMessage,Rank_ApplicationFacade);
      }
      
      public static function getInstance() : Rank_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Rank_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Rank_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         PipeManager.removeMsgs([PipeConstants.STARTUP_RANK,PipeConstants.CHONGBAI_BISHI,PipeConstants.SHOW_FB_RANK_PLANE,PipeConstants.LOOK_PLAYER_ZHAN_DOU_LI,PipeConstants.REQUEST_YUENANRANKING_PANEL],Rank_ApplicationFacade);
         Facade.removeCore(Rank_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Rank_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_RANK:
               this.startup();
               break;
            case PipeConstants.CHONGBAI_BISHI:
               this.sendChongbai_bishi(_loc2_);
               break;
            case PipeConstants.KUA_FU_RANK_DATA_SEND:
               sendNotification(KUA_FU_RANK_DATA_SEND,_loc2_);
               break;
            case PipeConstants.LOOK_PLAYER_ZHAN_DOU_LI:
               sendNotification(LOOK_PLAYER_ZHAN_DOU_LI,_loc2_);
               break;
            case PipeConstants.REQUEST_YUENANRANKING_PANEL:
               sendNotification(REQUEST_YUENANRANKING_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
      
      private function sendChongbai_bishi(param1:Object) : void
      {
         sendNotification(SEND_CHONGBAI_BISHI,param1);
      }
   }
}

