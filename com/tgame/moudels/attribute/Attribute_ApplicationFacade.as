package com.tgame.moudels.attribute
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.attribute.controller.Attribute_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Attribute_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.char.Attribute_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const CHANGED_MAINCHAR_BASE_ATTR:String = "CHANGED_MAINCHAR_BASE_ATTR";
      
      public static const UPDATE_MAINCHAR_AVATAR_IN_PLANE:String = "UPDATE_MAINCHAR_AVATAR_IN_PLANE";
      
      public static const KUAFU_STATUS:String = "KUAFU_STATUS";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public function Attribute_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ATTRIBUTE,PipeConstants.CHANGED_MAINCHAR_BASE_ATTR,PipeConstants.UPDATE_MAINCHAR_AVATAR_IN_PLANE,PipeConstants.KUAFU_STATUS,PipeConstants.NPC_REQ_FUNCTION],this.handlePipeMessage,Attribute_ApplicationFacade);
      }
      
      public static function getInstance() : Attribute_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Attribute_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Attribute_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Attribute_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ATTRIBUTE:
               this.startup();
               break;
            case PipeConstants.CHANGED_MAINCHAR_BASE_ATTR:
               _loc3_ = param1.body;
               sendNotification(CHANGED_MAINCHAR_BASE_ATTR,_loc3_);
               break;
            case PipeConstants.UPDATE_MAINCHAR_AVATAR_IN_PLANE:
               sendNotification(UPDATE_MAINCHAR_AVATAR_IN_PLANE);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(KUAFU_STATUS,_loc2_);
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

