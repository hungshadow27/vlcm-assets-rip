package com.tgame.moudels.JiuYangShenGong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.JiuYangShenGong.controller.JiuYangShenGong_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JiuYangShenGong_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.JiuYangShenGong.JiuYangShenGong_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REFRESH_JIUYANGSHENGONG_INFO:String = "refresh_jiuyangshengong_info";
      
      public static const SHOW_DAZUO_WAIGUAN:String = "SHOW_DAZUO_WAIGUAN";
      
      public function JiuYangShenGong_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JIUYANGSHENGONG,PipeConstants.SHOW_DAZUO_WAIGUAN],this.handlePipeMessage,JiuYangShenGong_ApplicationFacade);
      }
      
      public static function getInstance() : JiuYangShenGong_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JiuYangShenGong_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JiuYangShenGong_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JiuYangShenGong_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JIUYANGSHENGONG:
               this.startup();
               break;
            case PipeConstants.SHOW_DAZUO_WAIGUAN:
               sendNotification(SHOW_DAZUO_WAIGUAN,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

