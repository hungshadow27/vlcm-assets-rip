package com.tgame.moudels.lingxiyizhi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.lingxiyizhi.controller.LingXiYiZhi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class LingXiYiZhi_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.lingxiyizhi.LingXiYiZhi_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function LingXiYiZhi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_LINGXIYIZHI,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,LingXiYiZhi_ApplicationFacade);
      }
      
      public static function getInstance() : LingXiYiZhi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new LingXiYiZhi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as LingXiYiZhi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,LingXiYiZhi_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_LINGXIYIZHI:
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

