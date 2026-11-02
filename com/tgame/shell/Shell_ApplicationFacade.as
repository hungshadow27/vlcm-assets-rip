package com.tgame.shell
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.controller.Shell_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Shell_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.shell.Shell_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Shell_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SHELL],this.handlePipeMessage,Shell_ApplicationFacade);
      }
      
      public static function getInstance() : Shell_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Shell_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Shell_ApplicationFacade;
      }
      
      public function dispose() : void
      {
         PipeManager.removeMsgs([PipeConstants.STARTUP_SHELL],Shell_ApplicationFacade);
         Facade.removeCore(Shell_ApplicationFacade.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Shell_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SHELL:
               this.startup(_loc2_.parameters,_loc2_.decode);
         }
      }
      
      private function startup(param1:Object, param2:Function = null) : void
      {
         sendNotification(STARTUP,{
            "parameters":param1,
            "decode":param2
         });
      }
   }
}

