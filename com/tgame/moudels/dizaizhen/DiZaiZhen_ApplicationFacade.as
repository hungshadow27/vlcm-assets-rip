package com.tgame.moudels.dizaizhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.dizaizhen.controller.DiZaiZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DiZaiZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.dizaizhen.DiZaiZhen_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function DiZaiZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_DIZAIZHEN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,DiZaiZhen_ApplicationFacade);
      }
      
      public static function getInstance() : DiZaiZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DiZaiZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DiZaiZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DiZaiZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_DIZAIZHEN:
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

