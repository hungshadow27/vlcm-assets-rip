package com.tgame.moudels.xueyinjuexing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xueyinjuexing.controller.XueYinJueXing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XueYinJueXing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xueyinjuexing.XueYinJueXing_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function XueYinJueXing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XUEYINJUEXING,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,XueYinJueXing_ApplicationFacade);
      }
      
      public static function getInstance() : XueYinJueXing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XueYinJueXing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XueYinJueXing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XueYinJueXing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XUEYINJUEXING:
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

