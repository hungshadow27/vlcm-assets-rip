package com.tgame.moudels.banghui
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.banghui.controller.Banghui_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Banghui_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.banghui.Banghui_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ADD_BANGHUI_CHAT:String = "ADD_BANGHUI_CHAT";
      
      public static const SEND_BANGYAO:String = "SEND_BANGYAO";
      
      public static const BA_JIAN:String = "BA_JIAN";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public static const BANGQI_CHANGED:String = "BANGQI_CHANGED";
      
      public function Banghui_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BANGHUI,PipeConstants.ADD_BANGHUI_CHAT,PipeConstants.SEND_BANGYAO,PipeConstants.BA_JIAN,PipeConstants.ENTER_SCENE,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,Banghui_ApplicationFacade);
      }
      
      public static function getInstance() : Banghui_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Banghui_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Banghui_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Banghui_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_BANGHUI:
               this.startup();
               break;
            case PipeConstants.ADD_BANGHUI_CHAT:
               sendNotification(ADD_BANGHUI_CHAT,_loc2_);
               break;
            case PipeConstants.SEND_BANGYAO:
               sendNotification(SEND_BANGYAO,_loc2_);
               break;
            case PipeConstants.BA_JIAN:
               sendNotification(BA_JIAN,_loc2_);
               break;
            case PipeConstants.ENTER_SCENE:
               sendNotification(ENTER_SCENE,_loc2_);
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

