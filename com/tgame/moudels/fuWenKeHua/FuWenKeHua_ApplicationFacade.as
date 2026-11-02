package com.tgame.moudels.fuWenKeHua
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.fuWenKeHua.controller.FuWenKeHua_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class FuWenKeHua_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.fuWenKeHua.FuWenKeHua_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function FuWenKeHua_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_FUWENKEHUA],this.handlePipeMessage,FuWenKeHua_ApplicationFacade);
      }
      
      public static function getInstance() : FuWenKeHua_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new FuWenKeHua_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as FuWenKeHua_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,FuWenKeHua_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_FUWENKEHUA:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

