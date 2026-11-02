package com.tgame.moudels.XiangLong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.XiangLong.controller.XiangLong_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XiangLong_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.XiangLong.XiangLong_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function XiangLong_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XIANGLONG],this.handlePipeMessage,XiangLong_ApplicationFacade);
      }
      
      public static function getInstance() : XiangLong_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XiangLong_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XiangLong_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XiangLong_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XIANGLONG:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

