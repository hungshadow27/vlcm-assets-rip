package com.tgame.moudels.shengxiaotiaozhan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shengxiaotiaozhan.controller.Shengxiao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Shengxiao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shengxiaotiaozhan.Shengxiao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SEND_SHENGXIAOFUBENTIAOZHAN_CLICK:String = "SEND_SHENGXIAOFUBENTIAOZHAN_CLICK";
      
      public static const SEND_SHENGXIAOTIAOZHAN_LEAVE:String = "SEND_SHENGXIAOTIAOZHAN_LEAVE";
      
      public static const SEND_SHENGXIAOTIAOZHAN_RELIVE:String = "SEND_SHENGXIAOTIAOZHAN_RELIVE";
      
      public static const SHENGXIAOWUQIDUANZAO_CLICK:String = "SHENGXIAOWUQIDUANZAO_CLICK";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public function Shengxiao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHENGXIAOTIAOZHAN,PipeConstants.SEND_SHENGXIAOFUBENTIAOZHAN_CLICK,PipeConstants.SEND_SHENGXIAOTIAOZHAN_LEAVE,PipeConstants.SHENGXIAOWUQIDUANZAO_CLICK,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,Shengxiao_ApplicationFacade);
      }
      
      public static function getInstance() : Shengxiao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Shengxiao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Shengxiao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Shengxiao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SHENGXIAOTIAOZHAN:
               this.startup();
               break;
            case PipeConstants.SEND_SHENGXIAOFUBENTIAOZHAN_CLICK:
               sendNotification(SEND_SHENGXIAOFUBENTIAOZHAN_CLICK);
               break;
            case PipeConstants.SEND_SHENGXIAOTIAOZHAN_LEAVE:
               sendNotification(SEND_SHENGXIAOTIAOZHAN_LEAVE);
               break;
            case PipeConstants.SHENGXIAOWUQIDUANZAO_CLICK:
               sendNotification(SHENGXIAOWUQIDUANZAO_CLICK);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

