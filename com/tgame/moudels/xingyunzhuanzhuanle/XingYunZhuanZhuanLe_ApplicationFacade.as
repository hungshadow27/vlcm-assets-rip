package com.tgame.moudels.xingyunzhuanzhuanle
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xingyunzhuanzhuanle.controller.XingYunZhuanZhuanLe_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XingYunZhuanZhuanLe_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xingyunzhuanzhuanle.XingYunZhuanZhuanLe_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_XINGYUNZHUANZHUANLE_PANEL:String = "SHOW_XINGYUNZHUANZHUANLE_PANEL";
      
      public function XingYunZhuanZhuanLe_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XINGYUNZHUANZHUANLE,PipeConstants.SHOW_XINGYUNZHUANZHUANLE_PANEL],this.handlePipeMessage,XingYunZhuanZhuanLe_ApplicationFacade);
      }
      
      public static function getInstance() : XingYunZhuanZhuanLe_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XingYunZhuanZhuanLe_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XingYunZhuanZhuanLe_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XingYunZhuanZhuanLe_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XINGYUNZHUANZHUANLE:
               this.startup();
               break;
            case PipeConstants.SHOW_XINGYUNZHUANZHUANLE_PANEL:
               sendNotification(SHOW_XINGYUNZHUANZHUANLE_PANEL,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

