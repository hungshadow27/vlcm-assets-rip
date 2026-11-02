package com.tgame.moudels.ynLiulongzhuangbei
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynLiulongzhuangbei.controller.YNliulongzhuangbei_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNliulongzhuangbei_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynLiulongzhuangbei.YNliulongzhuangbei_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function YNliulongzhuangbei_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNLIULONGZHUANGBEI,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,YNliulongzhuangbei_ApplicationFacade);
      }
      
      public static function getInstance() : YNliulongzhuangbei_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNliulongzhuangbei_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNliulongzhuangbei_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNliulongzhuangbei_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNLIULONGZHUANGBEI:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(PipeConstants.GOODS_CHANGED);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

