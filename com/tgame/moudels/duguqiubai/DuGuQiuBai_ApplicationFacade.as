package com.tgame.moudels.duguqiubai
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.duguqiubai.controller.DuGuQiuBai_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DuGuQiuBai_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.duguqiubai.DuGuQiuBai_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const UI_MeiRenPanel_GOUXUAN_CLICK:String = "UI_MeiRenPanel_GOUXUAN_CLICK";
      
      public static const STARTUP:String = "STARTUP";
      
      public function DuGuQiuBai_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_DUGUQIUBAI,PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,DuGuQiuBai_ApplicationFacade);
      }
      
      public static function getInstance() : DuGuQiuBai_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DuGuQiuBai_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DuGuQiuBai_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DuGuQiuBai_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_DUGUQIUBAI:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK:
               sendNotification(UI_MeiRenPanel_GOUXUAN_CLICK,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

