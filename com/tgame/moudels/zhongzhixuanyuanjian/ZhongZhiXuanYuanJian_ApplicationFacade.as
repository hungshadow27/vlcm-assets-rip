package com.tgame.moudels.zhongzhixuanyuanjian
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhongzhixuanyuanjian.controller.ZhongZhiXuanYuanJian_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZhongZhiXuanYuanJian_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhongzhixuanyuanjian.ZhongZhiXuanYuanJian_ApplicationFacade";
      
      public static const GET_ZHONGZHIXUANYUANJIAN_PANEL:String = "GET_ZHONGZHIXUANYUANJIAN_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ZhongZhiXuanYuanJian_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ZHONGZHIXUANYUANJIAN],this.handlePipeMessage,ZhongZhiXuanYuanJian_ApplicationFacade);
      }
      
      public static function getInstance() : ZhongZhiXuanYuanJian_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZhongZhiXuanYuanJian_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZhongZhiXuanYuanJian_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ZhongZhiXuanYuanJian_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ZHONGZHIXUANYUANJIAN:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

