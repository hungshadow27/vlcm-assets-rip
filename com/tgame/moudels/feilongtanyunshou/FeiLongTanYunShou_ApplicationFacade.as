package com.tgame.moudels.feilongtanyunshou
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.feilongtanyunshou.controller.FeiLongTanYunShou_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class FeiLongTanYunShou_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.feilongtanyunshou.FeiLongTanYunShou_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const FEILONG_DINGJI_JIHUO_SHUXING:String = "FEILONG_DINGJI_JIHUO_SHUXING";
      
      public static const STARTUP:String = "STARTUP";
      
      public function FeiLongTanYunShou_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_FEILONGTANYUESHOU,PipeConstants.GOODS_CHANGED,PipeConstants.DINGJI_JIHUO_SHUXING],this.handlePipeMessage,FeiLongTanYunShou_ApplicationFacade);
      }
      
      public static function getInstance() : FeiLongTanYunShou_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new FeiLongTanYunShou_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as FeiLongTanYunShou_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,FeiLongTanYunShou_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_FEILONGTANYUESHOU:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.DINGJI_JIHUO_SHUXING:
               sendNotification(FEILONG_DINGJI_JIHUO_SHUXING,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

