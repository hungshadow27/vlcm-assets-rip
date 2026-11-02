package com.tgame.moudels.dazuo
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.dazuo.controller.DaZuo_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DaZuo_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.dazuo.DaZuo_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SEND_DAZUO:String = "SEND_DAZUO";
      
      public static const SEND_SHUANGXIU:String = "SEND_SHUANGXIU";
      
      public static const SEND_LIAOSHANG:String = "SEND_LIAOSHANG";
      
      public static const CHAR_DAZUO_SHUANGXIU_STATUS:String = "CHAR_DAZUO_SHUANGXIU_STATUS";
      
      public static const CHAR_LIAOSHANG_STATUS:String = "CHAR_LIAOSHANG_STATUS";
      
      public function DaZuo_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_DA_ZUO,PipeConstants.SEND_DAZUO,PipeConstants.SEND_SHUANGXIU,PipeConstants.CHAR_DAZUO_SHUANGXIU_STATUS,PipeConstants.CHAR_LIAOSHANG_STATUS,PipeConstants.SEND_LIAOSHANG],this.handlePipeMessage,DaZuo_ApplicationFacade);
      }
      
      public static function getInstance() : DaZuo_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DaZuo_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DaZuo_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DaZuo_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_DA_ZUO:
               this.startup();
               break;
            case PipeConstants.SEND_DAZUO:
               sendNotification(SEND_DAZUO,_loc2_);
               break;
            case PipeConstants.SEND_SHUANGXIU:
               sendNotification(SEND_SHUANGXIU,_loc2_);
               break;
            case PipeConstants.CHAR_DAZUO_SHUANGXIU_STATUS:
               sendNotification(CHAR_DAZUO_SHUANGXIU_STATUS,_loc2_);
               break;
            case PipeConstants.CHAR_LIAOSHANG_STATUS:
               sendNotification(CHAR_LIAOSHANG_STATUS,_loc2_);
               break;
            case PipeConstants.SEND_LIAOSHANG:
               sendNotification(SEND_LIAOSHANG,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

