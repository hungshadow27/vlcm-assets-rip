package com.tgame.moudels.dongxiao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.dongxiao.controller.Dongxiao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Dongxiao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.dongxiao.Dongxiao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const DONGXIAO_DINGJI_JIHUO_SHUXING:String = "DONGXIAO_DINGJI_JIHUO_SHUXING";
      
      public static const UI_JIANGHUN_HUANZHUANG_CLICK:String = "UI_JIANGHUN_HUANZHUANG_CLICK";
      
      public function Dongxiao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_DONGXIAO,PipeConstants.DINGJI_JIHUO_SHUXING,PipeConstants.UI_JIANGHUN_HUANZHUANG_CLICK],this.handlePipeMessage,Dongxiao_ApplicationFacade);
      }
      
      public static function getInstance() : Dongxiao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Dongxiao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Dongxiao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Dongxiao_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_DONGXIAO:
               this.startup();
               break;
            case PipeConstants.DINGJI_JIHUO_SHUXING:
               sendNotification(DONGXIAO_DINGJI_JIHUO_SHUXING,_loc2_);
               break;
            case PipeConstants.UI_JIANGHUN_HUANZHUANG_CLICK:
               sendNotification(UI_JIANGHUN_HUANZHUANG_CLICK,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

