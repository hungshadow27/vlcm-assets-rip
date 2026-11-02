package com.tgame.moudels.tianFu
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tianFu.controller.TianFu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TianFu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.tianFu.TianFu_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_HECHENG_PLANE:String = "SHOW_HECHENG_PLANE";
      
      public static const SHOW_TIANFU_XIANGQIAN:String = "SHOW_TIANFU_XIANGQIAN";
      
      public function TianFu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TIANFU,PipeConstants.SHOW_TIANFU_HECHENG_PLANE,PipeConstants.SHOW_TIANFU_XIANGQIAN,PipeConstants.GOT_TIANFU_LAST_SUIPIAN,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,TianFu_ApplicationFacade);
      }
      
      public static function getInstance() : TianFu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TianFu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TianFu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TianFu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1.name;
         _loc3_ = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_TIANFU:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc4_ = _loc3_ as int;
               if(_loc4_ == NpcFunctionType.TIANFU_SUIPIAN_HECHENG)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TIANFU_HECHENG_PLANE);
               }
               break;
            case PipeConstants.SHOW_TIANFU_HECHENG_PLANE:
               sendNotification(SHOW_HECHENG_PLANE,_loc3_);
               break;
            case PipeConstants.SHOW_TIANFU_XIANGQIAN:
               sendNotification(SHOW_TIANFU_XIANGQIAN,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

