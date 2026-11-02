package com.tgame.moudels.huangtubaye
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.huangtubaye.controller.HuangTuBaYe_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class HuangTuBaYe_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.huangtubaye.HuangTuBaYe_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const HUANGTU_BAYE:String = "HUANGTU_BAYE";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const QINGQIUJINRU_HANGTUPAYE_ZHANCHANG:String = "QINGQIUJINRU_HANGTUPAYE_ZHANCHANG";
      
      public static const SEND_XIANJING:String = "SEND_XIANJING";
      
      public static const QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE:String = "QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE";
      
      public function HuangTuBaYe_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_HUANGTUBAYE,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_HUANGTUBAYE_PANEL,PipeConstants.QINGQIUJINRU_HANGTUPAYE_ZHANCHANG,PipeConstants.QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE,PipeConstants.QINGQIUJINRU_HANGTUPAYE_ZHANCHANG,PipeConstants.SEND_XIANJING],this.handlePipeMessage,HuangTuBaYe_ApplicationFacade);
      }
      
      public static function getInstance() : HuangTuBaYe_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new HuangTuBaYe_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as HuangTuBaYe_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,HuangTuBaYe_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_HUANGTUBAYE:
               this.startup();
               break;
            case PipeConstants.SHOW_HUANGTUBAYE_PANEL:
               sendNotification(HUANGTU_BAYE);
               break;
            case PipeConstants.QINGQIUJINRU_HANGTUPAYE_ZHANCHANG:
               sendNotification(QINGQIUJINRU_HANGTUPAYE_ZHANCHANG,_loc3_);
               break;
            case PipeConstants.QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE:
               sendNotification(QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE,_loc3_);
               break;
            case PipeConstants.SEND_XIANJING:
               sendNotification(SEND_XIANJING,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

