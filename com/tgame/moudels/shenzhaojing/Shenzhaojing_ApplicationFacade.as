package com.tgame.moudels.shenzhaojing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shenzhaojing.controller.Shenzhaojing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Shenzhaojing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shenzhaojing.Shenzhaojing_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Shenzhaojing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHENJIGNZHAO,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,Shenzhaojing_ApplicationFacade);
      }
      
      public static function getInstance() : Shenzhaojing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Shenzhaojing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Shenzhaojing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Shenzhaojing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_SHENJIGNZHAO:
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

