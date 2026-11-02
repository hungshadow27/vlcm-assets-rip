package com.tgame.moudels.newyear
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.newyear.controller.NewYear_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class NewYear_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.newyear.NewYear_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_NEWYEARNEIRONG_PANEL:String = "SHOW_NEWYEARNEIRONG_PANEL";
      
      public static const NEWYEAR_YASUIQIAN_CLICK:String = "NEWYEAR_YASUIQIAN_CLICK";
      
      public function NewYear_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_NEWYEAR,PipeConstants.SHOW_NEWYEARNEIRONG_PANEL,PipeConstants.NEWYEAR_YASUIQIAN_CLICK],this.handlePipeMessage,NewYear_ApplicationFacade);
      }
      
      public static function getInstance() : NewYear_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new NewYear_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as NewYear_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,NewYear_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_NEWYEAR:
               this.startup();
               break;
            case PipeConstants.SHOW_NEWYEARNEIRONG_PANEL:
               sendNotification(SHOW_NEWYEARNEIRONG_PANEL);
               break;
            case PipeConstants.NEWYEAR_YASUIQIAN_CLICK:
               sendNotification(NEWYEAR_YASUIQIAN_CLICK);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

