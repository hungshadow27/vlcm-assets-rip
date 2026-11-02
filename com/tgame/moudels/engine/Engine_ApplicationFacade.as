package com.tgame.moudels.engine
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.engine.controller.Engine_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Engine_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.engine.Engine_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const CREAT_SCENE:String = "CREAT_SCENE";
      
      public static const SCENE_INTERACTIVE:String = "SCENE_INTERACTIVE";
      
      public static const SCENE_WALK:String = "SCENE_WALK";
      
      public static const SCENE_PROCESS:String = "SCENE_PROCESS";
      
      public static const SCENE_STATUS:String = "SCENE_STATUS";
      
      public function Engine_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsg(PipeConstants.STARTUP_ENGINE,this.handlePipeMessage,Engine_ApplicationFacade);
      }
      
      public static function getInstance() : Engine_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Engine_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Engine_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Engine_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ENGINE:
               this.startup();
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

