package com.tgame.moudels.biwuzhaoqin
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.biwuzhaoqin.controller.BiWuZhaoQin_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BiWuZhaoQin_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.biwuzhaoqin.BiWuZhaoQin_ApplicationFacade";
      
      public static const BI_WU_ZHAO_QIN:String = "BI_WU_ZHAO_QIN";
      
      public static const QIANG_XIUQIU:String = "QIANG_XIUQIU";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public function BiWuZhaoQin_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BIWUZHAOQIN,PipeConstants.SHOW_BIWUZHAOQIN_PANEL,PipeConstants.QIANG_XIUQIU,PipeConstants.ENTER_SCENE],this.handlePipeMessage,BiWuZhaoQin_ApplicationFacade);
      }
      
      public static function getInstance() : BiWuZhaoQin_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BiWuZhaoQin_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BiWuZhaoQin_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BiWuZhaoQin_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_BIWUZHAOQIN:
               this.startup();
               break;
            case PipeConstants.SHOW_BIWUZHAOQIN_PANEL:
               sendNotification(BI_WU_ZHAO_QIN);
               break;
            case PipeConstants.QIANG_XIUQIU:
               sendNotification(QIANG_XIUQIU,_loc3_);
               break;
            case PipeConstants.ENTER_SCENE:
               sendNotification(ENTER_SCENE,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

