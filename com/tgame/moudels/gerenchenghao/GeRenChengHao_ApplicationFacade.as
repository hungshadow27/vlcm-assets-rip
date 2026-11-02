package com.tgame.moudels.gerenchenghao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.gerenchenghao.controller.GeRenChengHao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class GeRenChengHao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.gerenchenghao.GeRenChengHao_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function GeRenChengHao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_GERENCHENGHAO,PipeConstants.GOODS_CHANGED,PipeConstants.KUAFU_STATUS],this.handlePipeMessage,GeRenChengHao_ApplicationFacade);
      }
      
      public static function getInstance() : GeRenChengHao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new GeRenChengHao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as GeRenChengHao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,GeRenChengHao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_GERENCHENGHAO:
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

