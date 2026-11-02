package com.tgame.moudels.TianJiangXiangRui
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.TianJiangXiangRui.controller.TianJiangXiangRui_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TianJiangXiangRui_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.TianJiangXiangRui.TianJiangXiangRui_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_TIANJIANGXIANGRUI:String = "SHOW_TIANJIANGXIANGRUI";
      
      public function TianJiangXiangRui_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TIANJIANGXIANGRUI,PipeConstants.SHOW_TIANJIANGXIANGRUI],this.handlePipeMessage,TianJiangXiangRui_ApplicationFacade);
      }
      
      public static function getInstance() : TianJiangXiangRui_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TianJiangXiangRui_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TianJiangXiangRui_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TianJiangXiangRui_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_TIANJIANGXIANGRUI:
               this.startup();
               break;
            case PipeConstants.SHOW_TIANJIANGXIANGRUI:
               sendNotification(SHOW_TIANJIANGXIANGRUI);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

