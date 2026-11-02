package com.tgame.moudels.wangzhezhibang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wangzhezhibang.controller.Wangzhezhibang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Wangzhezhibang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wangzhezhibang.Wangzhezhibang_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL:String = "SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL";
      
      public static const SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL:String = "SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL";
      
      public static const WANGZHEZHIBANG_TIP_CLICK:String = "WANGZHEZHIBANG_TIP_CLICK";
      
      public function Wangzhezhibang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WANGZHEZHIBANG,PipeConstants.SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL,PipeConstants.SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL,PipeConstants.WANGZHEZHIBANG_TIP_CLICK],this.handlePipeMessage,Wangzhezhibang_ApplicationFacade);
      }
      
      public static function getInstance() : Wangzhezhibang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Wangzhezhibang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Wangzhezhibang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Wangzhezhibang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_WANGZHEZHIBANG:
               this.startup();
               break;
            case PipeConstants.SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL:
               sendNotification(SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL,_loc3_);
               break;
            case PipeConstants.SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL:
               sendNotification(SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL);
               break;
            case PipeConstants.WANGZHEZHIBANG_TIP_CLICK:
               sendNotification(WANGZHEZHIBANG_TIP_CLICK,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

