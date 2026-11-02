package com.tgame.moudels.kuafu3v3
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.kuafu3v3.controller.Kuafu3v3_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Kuafu3v3_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.kuafu3v3.Kuafu3v3_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const BA_QI:String = "BA_QI";
      
      public static const CHI_SHENFU:String = "CHI_SHENFU";
      
      public static const YINCHANG_JING:String = "YINCHANG_JING";
      
      public function Kuafu3v3_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_KUAUF3V3,PipeConstants.ENTER_SCENE,PipeConstants.BA_QI,PipeConstants.CHI_SHENFU,PipeConstants.KUAFU_STATUS],this.handlePipeMessage,Kuafu3v3_ApplicationFacade);
      }
      
      public static function getInstance() : Kuafu3v3_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Kuafu3v3_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Kuafu3v3_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Kuafu3v3_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_KUAUF3V3:
               this.startup();
               break;
            case PipeConstants.ENTER_SCENE:
               sendNotification(ENTER_SCENE,_loc2_);
               break;
            case PipeConstants.BA_QI:
               sendNotification(BA_QI,_loc2_);
               break;
            case PipeConstants.CHI_SHENFU:
               sendNotification(CHI_SHENFU,_loc2_);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(YINCHANG_JING,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

