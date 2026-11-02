package com.tgame.moudels.BeiMingShenGong
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.BeiMingShenGong.controller.BeiMingShenGong_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BeiMingShenGong_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.BeiMingShenGong.BeiMingShenGong_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function BeiMingShenGong_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BEIMINGSHENGONG,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,BeiMingShenGong_ApplicationFacade);
      }
      
      public static function getInstance() : BeiMingShenGong_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BeiMingShenGong_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BeiMingShenGong_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BeiMingShenGong_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_BEIMINGSHENGONG:
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

