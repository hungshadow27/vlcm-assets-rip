package com.tgame.moudels.shibatongren
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.shibatongren.controller.ShiBatongren_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ShiBatongren_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.shibatongren.ShiBatongren_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ShiBatongren_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHIBATONGREN],this.handlePipeMessage,ShiBatongren_ApplicationFacade);
      }
      
      public static function getInstance() : ShiBatongren_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ShiBatongren_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ShiBatongren_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ShiBatongren_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_SHIBATONGREN:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

