package com.tgame.moudels.baguazhang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.baguazhang.controller.BaGuaZhang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BaGuaZhang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.baguazhang.BaGuaZhang_ApplicationFacade";
      
      public static const BAGUAZHANG_DINGJI_JIHUO_SHUXING:String = "BAGUAZHANG_DINGJI_JIHUO_SHUXING";
      
      public static const STARTUP:String = "STARTUP";
      
      public function BaGuaZhang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BAGUAZHANG,PipeConstants.DINGJI_JIHUO_SHUXING],this.handlePipeMessage,BaGuaZhang_ApplicationFacade);
      }
      
      public static function getInstance() : BaGuaZhang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BaGuaZhang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BaGuaZhang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BaGuaZhang_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_BAGUAZHANG:
               this.startup();
               break;
            case PipeConstants.DINGJI_JIHUO_SHUXING:
               sendNotification(BAGUAZHANG_DINGJI_JIHUO_SHUXING,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

