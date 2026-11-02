package com.tgame.moudels.jiuyinzhenjing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jiuyinzhenjing.controller.JiuYinZhenJing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JiuYinZhenJing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jiuyinzhenjing.JiuYinZhenJing_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REFRESH_JIUYANGSHENGONG_INFO:String = "refresh_jiuyangshengong_info";
      
      public function JiuYinZhenJing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JIUYINZHENJING],this.handlePipeMessage,JiuYinZhenJing_ApplicationFacade);
      }
      
      public static function getInstance() : JiuYinZhenJing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JiuYinZhenJing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JiuYinZhenJing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JiuYinZhenJing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JIUYINZHENJING:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

