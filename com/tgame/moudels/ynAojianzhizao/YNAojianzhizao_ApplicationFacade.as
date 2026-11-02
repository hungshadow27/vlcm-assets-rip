package com.tgame.moudels.ynAojianzhizao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynAojianzhizao.controller.YNAojianZhizao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNAojianzhizao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynAojianzhizao.YNAojianzhizao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YUENANAOJIANZHIZAOPANEL1:String = "SHOW_YUENANAOJIANZHIZAOPANEL1";
      
      public static const SHOW_YUENANAOJIANZHIZAOPANEL2:String = "SHOW_YUENANAOJIANZHIZAOPANEL2";
      
      public function YNAojianzhizao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUENANAOJIANZHIZAO,PipeConstants.SHOW_YUENANAOJIANZHIZAOPANEL1,PipeConstants.SHOW_YUENANAOJIANZHIZAOPANEL2],this.handlePipeMessage,YNAojianzhizao_ApplicationFacade);
      }
      
      public static function getInstance() : YNAojianzhizao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNAojianzhizao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNAojianzhizao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNAojianZhizao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENANAOJIANZHIZAO:
               this.startup();
               break;
            case PipeConstants.SHOW_YUENANAOJIANZHIZAOPANEL1:
               sendNotification(SHOW_YUENANAOJIANZHIZAOPANEL1,_loc2_);
               break;
            case PipeConstants.SHOW_YUENANAOJIANZHIZAOPANEL2:
               sendNotification(SHOW_YUENANAOJIANZHIZAOPANEL2,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

