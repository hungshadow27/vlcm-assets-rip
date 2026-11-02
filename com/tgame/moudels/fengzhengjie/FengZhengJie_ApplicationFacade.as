package com.tgame.moudels.fengzhengjie
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.fengzhengjie.controller.FengZhengJie_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class FengZhengJie_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.fengzhengjie.FengZhengJie_ApplicationFacade";
      
      public static const GET_FENGZHENGJIE_PANEL:String = "GET_FENGZHENGJIE_PANEL";
      
      public static const FENGZHENGJIE_ZENGSONG:String = "FENGZHENGJIE_ZENGSONG";
      
      public static const FENGZHENGJIE_XUNZHANGDUIHUAN:String = "FENGZHENGJIE_XUNZHANGDUIHUAN";
      
      public static const STARTUP:String = "STARTUP";
      
      public function FengZhengJie_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.GET_FENGZHENGJIE_PANEL,PipeConstants.STARTUP_FENGZHENGJIE,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,FengZhengJie_ApplicationFacade);
      }
      
      public static function getInstance() : FengZhengJie_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new FengZhengJie_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as FengZhengJie_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,FengZhengJie_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_FENGZHENGJIE:
               this.startup();
               break;
            case PipeConstants.GET_FENGZHENGJIE_PANEL:
               sendNotification(GET_FENGZHENGJIE_PANEL,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.FENGZHENGJIE_ZENGSONG)
               {
                  sendNotification(FENGZHENGJIE_ZENGSONG,1);
               }
               else if(_loc3_ == NpcFunctionType.FENGZHENGJIE_XUNZHANGDUIHUAN)
               {
                  sendNotification(FENGZHENGJIE_XUNZHANGDUIHUAN);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_ZENGSONGFENGDENG)
               {
                  sendNotification(FENGZHENGJIE_ZENGSONG,2);
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

