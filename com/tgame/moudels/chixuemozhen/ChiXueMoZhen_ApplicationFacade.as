package com.tgame.moudels.chixuemozhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.chixuemozhen.controller.ChiXueMoZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ChiXueMoZhen_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.chixuemozhen.ChiXueMoZhen_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function ChiXueMoZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CHIXUEMOZHEN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,ChiXueMoZhen_ApplicationFacade);
      }
      
      public static function getInstance() : ChiXueMoZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ChiXueMoZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ChiXueMoZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ChiXueMoZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_CHIXUEMOZHEN:
               sendNotification(STARTUP);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
   }
}

