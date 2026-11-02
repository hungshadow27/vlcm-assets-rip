package com.tgame.moudels.mall
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.mall.controller.Mall_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Mall_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.mall.Mall_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const BUY_MALL_GOODS:String = "BUY_MALL_GOODS";
      
      public static const SHOW_GOODS_PANEL:String = "SHOW_GOODS_PANEL";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public static const SET_MAINCHAR_MALL:String = "SET_MAINCHAR_MALL";
      
      public static const BUY_MALL_SHENGWANG:String = "BUY_MALL_SHENGWANG";
      
      public static const SHOW_GOODS_BUY:String = "SHOW_GOODS_BUY";
      
      public function Mall_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MALL,PipeConstants.REQUEST_MALL_GOODS_INFO,PipeConstants.SHOW_GOODS_PANEL,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.SET_MAINCHAR_MALL,PipeConstants.BUY_MALL_SHENGWANG,PipeConstants.SHOW_GOODS_BUY],this.handlePipeMessage,Mall_ApplicationFacade);
      }
      
      public static function getInstance() : Mall_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Mall_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Mall_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Mall_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MALL:
               this.startup();
               break;
            case PipeConstants.REQUEST_MALL_GOODS_INFO:
               sendNotification(BUY_MALL_GOODS,_loc2_);
               break;
            case PipeConstants.SHOW_GOODS_PANEL:
               sendNotification(SHOW_GOODS_PANEL,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.MALL_JI_FEN)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MALL_JI_FEN_PLANE);
               }
               else
               {
                  sendNotification(NPC_REQ_FUNCTION,_loc2_);
               }
               break;
            case PipeConstants.SET_MAINCHAR_MALL:
               sendNotification(SET_MAINCHAR_MALL,_loc2_);
               break;
            case PipeConstants.BUY_MALL_SHENGWANG:
               sendNotification(BUY_MALL_SHENGWANG,_loc2_);
               break;
            case PipeConstants.SHOW_GOODS_BUY:
               sendNotification(SHOW_GOODS_BUY,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

