package com.tgame.moudels.ganjiangmoye
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ganjiangmoye.controller.GanJiangMoYe_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class GanJiangMoYe_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ganjiangmoye.GanJiangMoYe_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function GanJiangMoYe_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_GANJIANGMOYE,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,GanJiangMoYe_ApplicationFacade);
      }
      
      public static function getInstance() : GanJiangMoYe_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new GanJiangMoYe_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as GanJiangMoYe_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,GanJiangMoYe_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_GANJIANGMOYE:
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

