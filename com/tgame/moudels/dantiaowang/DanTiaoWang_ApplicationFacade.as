package com.tgame.moudels.dantiaowang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.dantiaowang.controller.DanTiaoWang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class DanTiaoWang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.dantiaowang.DanTiaoWang_ApplicationFacade";
      
      public static const DAN_TIAO_WANG:String = "DAN_TIAO_WANG";
      
      public static const STARTUP:String = "STARTUP";
      
      public function DanTiaoWang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_DANTIAOWANG,PipeConstants.SHOW_DAN_TIAO_WANG_SHUOMING],this.handlePipeMessage,DanTiaoWang_ApplicationFacade);
      }
      
      public static function getInstance() : DanTiaoWang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new DanTiaoWang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as DanTiaoWang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,DanTiaoWang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_DANTIAOWANG:
               this.startup();
               break;
            case PipeConstants.SHOW_DAN_TIAO_WANG_SHUOMING:
               sendNotification(DAN_TIAO_WANG);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

