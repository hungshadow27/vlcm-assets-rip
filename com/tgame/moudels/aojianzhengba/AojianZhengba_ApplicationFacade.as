package com.tgame.moudels.aojianzhengba
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.aojianzhengba.controller.AojianZhengba_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class AojianZhengba_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.aojianzhengba.AojianZhengba_ApplicationFacade";
      
      public static const AOJIAN_ZHENGBA:String = "AOJIAN_ZHENGBA";
      
      public static const STARTUP:String = "STARTUP";
      
      public function AojianZhengba_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_AOJIANZHENGBA,PipeConstants.SHOW_AOJIAN_ZHENGBA],this.handlePipeMessage,AojianZhengba_ApplicationFacade);
      }
      
      public static function getInstance() : AojianZhengba_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new AojianZhengba_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as AojianZhengba_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,AojianZhengba_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_AOJIANZHENGBA:
               this.startup();
               break;
            case PipeConstants.SHOW_AOJIAN_ZHENGBA:
               sendNotification(AOJIAN_ZHENGBA);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

