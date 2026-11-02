package com.tgame.moudels.jianghun
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jianghun.controller.JiangHun_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JiangHun_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jianghun.JiangHun_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GET_JIANGHUN_PANEL:String = "GET_JIANGHUN_PANEL";
      
      public static const GET_JIANGHUN_CN_PANEL:String = "GET_JIANGHUN_CN_PANEL";
      
      public static const GET_CHUNJINGZHUANSHUJIFEN_PANEL:String = "GET_CHUNJINGZHUANSHUJIFEN_PANEL";
      
      public function JiangHun_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JIANGHUN,PipeConstants.GET_JIANGHUN_PANEL,PipeConstants.GET_JIANGHUN_CN_PANEL,PipeConstants.GET_CHUNJINGZHUANSHUJIFEN_PANEL],this.handlePipeMessage,JiangHun_ApplicationFacade);
      }
      
      public static function getInstance() : JiangHun_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JiangHun_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JiangHun_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JiangHun_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JIANGHUN:
               this.startup();
               break;
            case PipeConstants.GET_JIANGHUN_PANEL:
               sendNotification(GET_JIANGHUN_PANEL);
               break;
            case PipeConstants.GET_JIANGHUN_CN_PANEL:
               sendNotification(GET_JIANGHUN_CN_PANEL);
               break;
            case PipeConstants.GET_CHUNJINGZHUANSHUJIFEN_PANEL:
               sendNotification(GET_CHUNJINGZHUANSHUJIFEN_PANEL);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

