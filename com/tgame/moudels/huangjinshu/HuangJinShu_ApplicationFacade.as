package com.tgame.moudels.huangjinshu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.huangjinshu.controller.HuangJinShu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class HuangJinShu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.huangjinshu.HuangJinShu_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const HUANGJINSHU_WATER:String = "HUANGJINSHU_WATER";
      
      public function HuangJinShu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_HUANGJINSHU,PipeConstants.HUANGJINSHU_WATER],this.handlePipeMessage,HuangJinShu_ApplicationFacade);
      }
      
      public static function getInstance() : HuangJinShu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new HuangJinShu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as HuangJinShu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,HuangJinShu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_HUANGJINSHU:
               this.startup();
               break;
            case PipeConstants.HUANGJINSHU_WATER:
               sendNotification(HUANGJINSHU_WATER,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

