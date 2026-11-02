package com.tgame.moudels.huyijuexing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.huyijuexing.controller.HuYiJueXing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class HuYiJueXing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.huyijuexing.HuYiJueXing_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL:String = "SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function HuYiJueXing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_HUYIJUEXING,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL],this.handlePipeMessage,HuYiJueXing_ApplicationFacade);
      }
      
      public static function getInstance() : HuYiJueXing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new HuYiJueXing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as HuYiJueXing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,HuYiJueXing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_HUYIJUEXING:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL:
               sendNotification(SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

