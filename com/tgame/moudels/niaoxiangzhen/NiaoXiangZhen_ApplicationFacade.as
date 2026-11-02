package com.tgame.moudels.niaoxiangzhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.niaoxiangzhen.controller.NiaoXiangZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class NiaoXiangZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.niaoxiangzhen.NiaoXiangZhen_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function NiaoXiangZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_NIAOXIANGZHEN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,NiaoXiangZhen_ApplicationFacade);
      }
      
      public static function getInstance() : NiaoXiangZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new NiaoXiangZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as NiaoXiangZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,NiaoXiangZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_NIAOXIANGZHEN:
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

