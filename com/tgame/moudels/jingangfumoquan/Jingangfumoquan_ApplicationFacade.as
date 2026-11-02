package com.tgame.moudels.jingangfumoquan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jingangfumoquan.controller.Jingangfumoquan_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Jingangfumoquan_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jingangfumoquan.Jingangfumoquan_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function Jingangfumoquan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JINGANGFUMOQUAN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,Jingangfumoquan_ApplicationFacade);
      }
      
      public static function getInstance() : Jingangfumoquan_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Jingangfumoquan_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Jingangfumoquan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Jingangfumoquan_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JINGANGFUMOQUAN:
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

