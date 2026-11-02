package com.tgame.moudels.fight
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.fight.controller.Fight_StartUpCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Fight_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.fight.Fight_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SEND_SHENGXIAOTIAOZHAN_RELIVE:String = "SEND_SHENGXIAOTIAOZHAN_RELIVE";
      
      public static const HIT_CHAR:String = "HIT_CHAR";
      
      public static const USE_SKILL:String = "USE_SKILL";
      
      public static const ADD_BUFF:String = "ADD_BUFF";
      
      public static const REMOVE_BUFF:String = "REMOVE_BUFF";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const MAIN_CHAR_ATTR_TIP:String = "MAIN_CHAR_ATTR_TIP";
      
      public static const MAIN_CHAR_SINGLE_ATTR_TIP:String = "MAIN_CHAR_SINGLE_ATTR_TIP";
      
      public static const FLOOR_ATTACK:String = "FLOOR_ATTACK";
      
      public static const USE_SKILL_BIYISHUANGFEI:String = "USE_SKILL_BIYISHUANGFEI";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public function Fight_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsg(PipeConstants.STARTUP_FIGHT,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.HIT_CHAR,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.USE_SKILL,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.ADD_BUFF,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.REMOVE_BUFF,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.MAIN_CHAR_ATTR_TIP,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.MAIN_CHAR_SINGLE_ATTR_TIP,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.FLOOR_ATTACK,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.USE_SKILL_BIYISHUANGFEI,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.NPC_REQ_FUNCTION,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.GOODS_CHANGED,this.handlePipeMessage,Fight_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.SEND_SHENGXIAOTIAOZHAN_RELIVE,this.handlePipeMessage,Fight_ApplicationFacade);
      }
      
      public static function getInstance() : Fight_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Fight_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Fight_ApplicationFacade;
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_FIGHT:
               this.startup();
               break;
            case PipeConstants.HIT_CHAR:
               sendNotification(HIT_CHAR,_loc2_);
               break;
            case PipeConstants.USE_SKILL:
               sendNotification(USE_SKILL,_loc2_);
               break;
            case PipeConstants.ADD_BUFF:
               sendNotification(ADD_BUFF,_loc2_);
               break;
            case PipeConstants.REMOVE_BUFF:
               sendNotification(REMOVE_BUFF,_loc2_);
               break;
            case PipeConstants.MAIN_CHAR_ATTR_TIP:
               sendNotification(MAIN_CHAR_ATTR_TIP,_loc2_);
               break;
            case PipeConstants.MAIN_CHAR_SINGLE_ATTR_TIP:
               sendNotification(MAIN_CHAR_SINGLE_ATTR_TIP,_loc2_);
               break;
            case PipeConstants.FLOOR_ATTACK:
               sendNotification(FLOOR_ATTACK,_loc2_);
               break;
            case PipeConstants.USE_SKILL_BIYISHUANGFEI:
               sendNotification(USE_SKILL_BIYISHUANGFEI,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED,_loc2_);
               break;
            case PipeConstants.SEND_SHENGXIAOTIAOZHAN_RELIVE:
               sendNotification(SEND_SHENGXIAOTIAOZHAN_RELIVE,_loc2_);
         }
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Fight_StartUpCommand);
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

