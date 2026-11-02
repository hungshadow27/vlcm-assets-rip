package com.tgame.moudels.tianshangzhihun
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tianshangzhihun.controller.TianShangZhiHun_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class TianShangZhiHun_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.tianshangzhihun.TianShangZhiHun_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_TIANSHANGZHIHUN_SHENGJIE:String = "SHOW_TIANSHANGZHIHUN_SHENGJIE";
      
      public function TianShangZhiHun_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TIANSHANGZHIHUN,PipeConstants.SHOW_TIANSHANGZHIHUN_SHENGJIE],this.handlePipeMessage,TianShangZhiHun_ApplicationFacade);
      }
      
      public static function getInstance() : TianShangZhiHun_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new TianShangZhiHun_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as TianShangZhiHun_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,TianShangZhiHun_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_TIANSHANGZHIHUN:
               this.startup();
               break;
            case PipeConstants.SHOW_TIANSHANGZHIHUN_SHENGJIE:
               sendNotification(SHOW_TIANSHANGZHIHUN_SHENGJIE,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

