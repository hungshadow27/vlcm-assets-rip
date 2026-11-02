package com.tgame.moudels.shishizhankuang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shishizhankuang.controller.ShiShiZhanKuang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Shishizhankuang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shishizhankuang.Shishizhankuang_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Shishizhankuang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHISHIZHANKUANG],this.handlePipeMessage,Shishizhankuang_ApplicationFacade);
      }
      
      public static function getInstance() : Shishizhankuang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Shishizhankuang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Shishizhankuang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ShiShiZhanKuang_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SHISHIZHANKUANG:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

