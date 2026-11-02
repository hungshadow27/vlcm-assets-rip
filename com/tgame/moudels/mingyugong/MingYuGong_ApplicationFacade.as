package com.tgame.moudels.mingyugong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.mingyugong.controller.MingYuGong_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MingYuGong_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.mingyugong.MingYuGong_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function MingYuGong_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MINGYUGONG,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,MingYuGong_ApplicationFacade);
      }
      
      public static function getInstance() : MingYuGong_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MingYuGong_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MingYuGong_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MingYuGong_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_MINGYUGONG:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

