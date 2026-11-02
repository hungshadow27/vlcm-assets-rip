package com.tgame.moudels.yuxiaojianfa
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.yuxiaojianfa.controller.YuXiaoJianFa_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YuXiaoJianFa_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.yuxiaojianfa.YuXiaoJianFa_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function YuXiaoJianFa_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YUXIAOJIANFA,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,YuXiaoJianFa_ApplicationFacade);
      }
      
      public static function getInstance() : YuXiaoJianFa_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YuXiaoJianFa_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YuXiaoJianFa_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YuXiaoJianFa_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_YUXIAOJIANFA:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

