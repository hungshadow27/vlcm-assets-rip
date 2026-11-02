package com.tgame.moudels.zhizhanzhishang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhizhanzhishang.controller.Zhizhanzhishang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZhiZhanZhiShang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhizhanzhishang.ZhiZhanZhiShang_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_ZHIZHANZHISHANG:String = "SHOW_ZHIZHANZHISHANG";
      
      public function ZhiZhanZhiShang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZHIZHANZHISHANG,PipeConstants.SHOW_ZHIZHANZHISHANG],this.handlePipeMessage,ZhiZhanZhiShang_ApplicationFacade);
      }
      
      public static function getInstance() : ZhiZhanZhiShang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZhiZhanZhiShang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZhiZhanZhiShang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Zhizhanzhishang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_ZHIZHANZHISHANG:
               this.startup();
               break;
            case PipeConstants.SHOW_ZHIZHANZHISHANG:
               sendNotification(SHOW_ZHIZHANZHISHANG);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

