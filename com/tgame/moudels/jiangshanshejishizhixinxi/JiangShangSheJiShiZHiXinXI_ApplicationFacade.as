package com.tgame.moudels.jiangshanshejishizhixinxi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jiangshanshejishizhixinxi.controller.JiangShangSheJiShiZHiXinXI_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JiangShangSheJiShiZHiXinXI_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jiangshanshejishizhixinxi.JiangShangSheJiShiZHiXinXI_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function JiangShangSheJiShiZHiXinXI_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JIANGSHANSHEJISHIZHIXINXI,PipeConstants.SHOW_JIANGSHANSHEJI_CHAKAN_PLANE],this.handlePipeMessage,JiangShangSheJiShiZHiXinXI_ApplicationFacade);
      }
      
      public static function getInstance() : JiangShangSheJiShiZHiXinXI_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JiangShangSheJiShiZHiXinXI_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JiangShangSheJiShiZHiXinXI_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JiangShangSheJiShiZHiXinXI_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JIANGSHANSHEJISHIZHIXINXI:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

