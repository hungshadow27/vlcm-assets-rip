package com.tgame.moudels.wuhunxitong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wuhunxitong.controller.WuHunXiTong_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class WuHunXiTong_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wuhunxitong.WuHunXiTong_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GET_WUHUNXITONG_PANEL:String = "GET_WUHUNXITONG_PANEL";
      
      public function WuHunXiTong_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WUHUNXITONG,PipeConstants.GET_WUHUNXITONG_PANEL,PipeConstants.GET_CAIPIAO_PANEL,PipeConstants.GET_LETOU_PANEL],this.handlePipeMessage,WuHunXiTong_ApplicationFacade);
      }
      
      public static function getInstance() : WuHunXiTong_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new WuHunXiTong_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as WuHunXiTong_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,WuHunXiTong_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_WUHUNXITONG:
               this.startup();
               break;
            case PipeConstants.GET_WUHUNXITONG_PANEL:
               sendNotification(GET_WUHUNXITONG_PANEL,_loc2_);
               break;
            case PipeConstants.GET_CAIPIAO_PANEL:
               sendNotification(PipeConstants.GET_CAIPIAO_PANEL,_loc2_);
               break;
            case PipeConstants.GET_LETOU_PANEL:
               sendNotification(PipeConstants.GET_LETOU_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

