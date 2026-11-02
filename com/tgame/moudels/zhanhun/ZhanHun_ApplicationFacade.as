package com.tgame.moudels.zhanhun
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhanhun.controller.Zhanhun_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZhanHun_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhanhun.ZhanHun_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ZHANHUNDAI_SHUANGJI_CHUANDAI:String = "ZHANHUNDAI_SHUANGJI_CHUANDAI";
      
      public static const ZHANHUN_XIEXIA:String = "ZHANHUN_XIEXIA";
      
      public function ZhanHun_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZHANHUN,PipeConstants.ZHANHUNDAI_SHUANGJI_CHUANDAI,PipeConstants.ZHANHUN_XIEXIA],this.handlePipeMessage,ZhanHun_ApplicationFacade);
      }
      
      public static function getInstance() : ZhanHun_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZhanHun_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZhanHun_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Zhanhun_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_ZHANHUN:
               this.startup();
               break;
            case PipeConstants.ZHANHUNDAI_SHUANGJI_CHUANDAI:
               sendNotification(ZHANHUNDAI_SHUANGJI_CHUANDAI,_loc3_);
               break;
            case PipeConstants.ZHANHUN_XIEXIA:
               sendNotification(ZHANHUN_XIEXIA,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

