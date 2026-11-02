package com.tgame.moudels.yn888shop
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yn888shop.controller.YN888Shop_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YN888Shop_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yn888shop.YN888Shop_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const REFRESH_YUENAN888SHOP:String = "REFRESH_YUENAN888SHOP";
      
      public function YN888Shop_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUENAN888SHOP,PipeConstants.REFRESH_YUENAN888SHOP],this.handlePipeMessage,YN888Shop_ApplicationFacade);
      }
      
      public static function getInstance() : YN888Shop_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YN888Shop_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YN888Shop_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YN888Shop_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YUENAN888SHOP:
               this.startup();
               break;
            case PipeConstants.REFRESH_YUENAN888SHOP:
               sendNotification(REFRESH_YUENAN888SHOP,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

