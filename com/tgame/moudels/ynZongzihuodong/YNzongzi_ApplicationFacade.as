package com.tgame.moudels.ynZongzihuodong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynZongzihuodong.controller.YNzongzi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNzongzi_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.ynZongzihuodong.YNzongzi_ApplicationFacade";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const YN_SHOW_CHUNJIEHUODONGPANEL:String = "YN_SHOW_CHUNJIEHUODONGPANEL";
      
      public function YNzongzi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNZHIZUOZONGZI,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.GOODS_CHANGED,PipeConstants.YN_SHOW_CHUNJIEHUODONGPANEL],this.handlePipeMessage,YNzongzi_ApplicationFacade);
      }
      
      public static function getInstance() : YNzongzi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNzongzi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNzongzi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNzongzi_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNZHIZUOZONGZI:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.YN_SHOW_CHUNJIEHUODONGPANEL:
               sendNotification(YN_SHOW_CHUNJIEHUODONGPANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

