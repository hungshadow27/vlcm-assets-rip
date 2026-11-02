package com.tgame.moudels.aojianfeisheng
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.aojianfeisheng.controller.AoJianFeiSheng_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class AoJianFeiSheng_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.aojianfeisheng.AoJianFeiSheng_ApplicationFacade";
      
      public static const GET_AOJIANFEISHENG_PANEL:String = "GET_AOJIANFEISHENG_PANEL";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function AoJianFeiSheng_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.GET_AOJIANFEISHENG_PANEL,PipeConstants.STARTUP_AOJIANFEISHENG],this.handlePipeMessage,AoJianFeiSheng_ApplicationFacade);
      }
      
      public static function getInstance() : AoJianFeiSheng_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new AoJianFeiSheng_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as AoJianFeiSheng_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,AoJianFeiSheng_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_AOJIANFEISHENG:
               this.startup();
               break;
            case PipeConstants.GET_AOJIANFEISHENG_PANEL:
               sendNotification(GET_AOJIANFEISHENG_PANEL);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

