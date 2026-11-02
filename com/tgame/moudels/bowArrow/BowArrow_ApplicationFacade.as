package com.tgame.moudels.bowArrow
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.bowArrow.controller.BowArrow_StartUpCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BowArrow_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.bowArrow.BowArrow_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const BUG_GOODS:String = "BUY_GOODS";
      
      public static const SHOW_GOODS_PANEL:String = "SHOW_GOODS_PANEL";
      
      public static const UPDATE_SKILL:String = "UPDATE_SKILL";
      
      public static const BOW_DINGJI_JIHUO_SHUXING:String = "BOW_DINGJI_JIHUO_SHUXING";
      
      public function BowArrow_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsg(PipeConstants.STARTUP_BOWARROW,this.handlePipeMessage,BowArrow_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.SHOW_GOODS_PANEL,this.handlePipeMessage,BowArrow_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.GOODS_CHANGED,this.handlePipeMessage,BowArrow_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.UPDATE_SKILL,this.handlePipeMessage,BowArrow_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.DINGJI_JIHUO_SHUXING,this.handlePipeMessage,BowArrow_ApplicationFacade);
      }
      
      public static function getInstance() : BowArrow_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BowArrow_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BowArrow_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BowArrow_StartUpCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_BOWARROW:
               this.startup();
               break;
            case PipeConstants.SHOW_GOODS_PANEL:
               sendNotification(SHOW_GOODS_PANEL,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(BUG_GOODS,_loc2_);
               break;
            case PipeConstants.UPDATE_SKILL:
               sendNotification(UPDATE_SKILL,_loc2_);
               break;
            case PipeConstants.DINGJI_JIHUO_SHUXING:
               sendNotification(BOW_DINGJI_JIHUO_SHUXING,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

