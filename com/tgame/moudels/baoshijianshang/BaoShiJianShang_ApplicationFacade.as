package com.tgame.moudels.baoshijianshang
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.baoshijianshang.controller.BaoShiJianShang_StartUpCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BaoShiJianShang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.baoshijianshang.BaoShiJianShang_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SEND_TO_WANBAOGE:String = "SEND_TO_WANBAOGE";
      
      public static const SET_BAOSHI_TIME:String = "SET_BAOSHI_TIME";
      
      public function BaoShiJianShang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.NPC_REQ_FUNCTION,PipeConstants.STARTUP_BAOSHIJIANSHANG,PipeConstants.GOODS_CHANGED,PipeConstants.SEND_TO_WANBAOGE,PipeConstants.SET_BAOSHI_TIME],this.handlePipeMessage,BaoShiJianShang_ApplicationFacade);
      }
      
      public static function getInstance() : BaoShiJianShang_ApplicationFacade
      {
         if(instanceMap[PipeConstants.STARTUP_BAOSHIJIANSHANG] == null)
         {
            instanceMap[PipeConstants.STARTUP_BAOSHIJIANSHANG] = new BaoShiJianShang_ApplicationFacade(PipeConstants.STARTUP_BAOSHIJIANSHANG);
         }
         return instanceMap[PipeConstants.STARTUP_BAOSHIJIANSHANG] as BaoShiJianShang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BaoShiJianShang_StartUpCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_BAOSHIJIANSHANG:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.TO_WANBAOGE)
               {
                  sendNotification(SEND_TO_WANBAOGE,_loc2_);
               }
               if(_loc3_ == NpcFunctionType.BAOSHI_JIANSHANG_YAZHU)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BAOSHIJIANSHANG_PANEL);
               }
               if(_loc3_ == NpcFunctionType.BAOSHI_JIANSHANG_GUIZE)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BAOSHIJIANSHANG_GUIZE_PANEL);
               }
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
            case PipeConstants.SET_BAOSHI_TIME:
               sendNotification(SET_BAOSHI_TIME,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

