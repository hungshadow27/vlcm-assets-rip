package com.tgame.moudels.qinggongyan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.qinggongyan.controller.QingGongYan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class QingGongYan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.qinggongyan.QingGongYan_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const QINGGONGYAN_CHI:String = "QINGGONGYAN_CHI";
      
      public static const SHOW_QINGGONGYAN_OVER:String = "SHOW_QINGGONGYAN_OVER";
      
      public function QingGongYan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_QINGGONGYAN,PipeConstants.SHOW_QINGGONGYAN_OVER,PipeConstants.QINGGONGYAN_CHI],this.handlePipeMessage,QingGongYan_ApplicationFacade);
      }
      
      public static function getInstance() : QingGongYan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new QingGongYan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as QingGongYan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,QingGongYan_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_QINGGONGYAN:
               this.startup();
               break;
            case PipeConstants.QINGGONGYAN_CHI:
               sendNotification(QINGGONGYAN_CHI,_loc2_);
               break;
            case PipeConstants.SHOW_QINGGONGYAN_OVER:
               sendNotification(SHOW_QINGGONGYAN_OVER);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

