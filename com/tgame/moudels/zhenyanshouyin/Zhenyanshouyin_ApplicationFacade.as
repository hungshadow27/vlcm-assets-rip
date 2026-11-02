package com.tgame.moudels.zhenyanshouyin
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhenyanshouyin.controller.Zhenyanshouyin_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Zhenyanshouyin_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhenyanshouyin.Zhenyanshouyin_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function Zhenyanshouyin_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZHENYANSHOUYIN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,Zhenyanshouyin_ApplicationFacade);
      }
      
      public static function getInstance() : Zhenyanshouyin_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Zhenyanshouyin_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Zhenyanshouyin_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Zhenyanshouyin_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_ZHENYANSHOUYIN:
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

