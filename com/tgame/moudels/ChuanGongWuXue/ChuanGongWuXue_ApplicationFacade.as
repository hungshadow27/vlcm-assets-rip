package com.tgame.moudels.ChuanGongWuXue
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ChuanGongWuXue.controller.ChuanGongWuXue_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ChuanGongWuXue_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ChuanGongWuXue.ChuanGongWuXue_ApplicationFacade";
      
      public static const QINGQIU_CHUANGONGWUXUE_MIANBAN:String = "QINGQIU_CHUANGONGWUXUE_MIANBAN";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ChuanGongWuXue_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CHUANGONGWUXUE,PipeConstants.GOODS_CHANGED,PipeConstants.QINGQIU_CHUANGONGWUXUE_MIANBAN],this.handlePipeMessage,ChuanGongWuXue_ApplicationFacade);
      }
      
      public static function getInstance() : ChuanGongWuXue_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ChuanGongWuXue_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ChuanGongWuXue_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ChuanGongWuXue_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_CHUANGONGWUXUE:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.QINGQIU_CHUANGONGWUXUE_MIANBAN:
               sendNotification(QINGQIU_CHUANGONGWUXUE_MIANBAN,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

