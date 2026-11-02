package com.tgame.moudels.xiaozhukuaipao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xiaozhukuaipao.controller.XiaoZhuKuaiPao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XiaoZhuKuaiPao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xiaozhukuaipao.XiaoZhuKuaiPao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GET_XIAOZHUKUAIPAO_PANEL:String = "GET_XIAOZHUKUAIPAO_PANEL";
      
      public function XiaoZhuKuaiPao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XIAOZHUKUAIPAO,PipeConstants.GET_XIAOZHUKUAIPAO_PANEL],this.handlePipeMessage,XiaoZhuKuaiPao_ApplicationFacade);
      }
      
      public static function getInstance() : XiaoZhuKuaiPao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XiaoZhuKuaiPao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XiaoZhuKuaiPao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XiaoZhuKuaiPao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_XIAOZHUKUAIPAO:
               this.startup();
               break;
            case PipeConstants.GET_XIAOZHUKUAIPAO_PANEL:
               sendNotification(GET_XIAOZHUKUAIPAO_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

