package com.tgame.moudels.tianMenZhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tianMenZhen.controller.TianMenZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TianMenZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.tianMenZhen.TianMenZhen_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_BUZHEN_PANEL:String = "SHOW_BUZHEN_PANEL";
      
      public static const ZHENFA_BAOFA_BTN:String = "ZHENFA_BAOFA_BTN";
      
      public static const STARTUP:String = "STARTUP";
      
      public function TianMenZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TIANMENZHEN,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_BUZHEN_PANEL,PipeConstants.ZHENFA_BAOFA_BTN],this.handlePipeMessage,TianMenZhen_ApplicationFacade);
      }
      
      public static function getInstance() : TianMenZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TianMenZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TianMenZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TianMenZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_TIANMENZHEN:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SHOW_BUZHEN_PANEL:
               sendNotification(SHOW_BUZHEN_PANEL,_loc3_);
               break;
            case PipeConstants.ZHENFA_BAOFA_BTN:
               sendNotification(ZHENFA_BAOFA_BTN,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

