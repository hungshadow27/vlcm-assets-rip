package com.tgame.moudels.biguan
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.biguan.controller.Biguan_StartUpCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Biguan_ApplicationFacade extends Facade
   {
      
      public var STARTUP:String = "STARUP";
      
      public function Biguan_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_STUDYBTN],this.handlePipeMessage,Biguan_ApplicationFacade);
      }
      
      public static function getInstance() : Biguan_ApplicationFacade
      {
         if(instanceMap[PipeConstants.STARTUP_STUDYBTN] == null)
         {
            instanceMap[PipeConstants.STARTUP_STUDYBTN] = new Biguan_ApplicationFacade(PipeConstants.STARTUP_STUDYBTN);
         }
         return instanceMap[PipeConstants.STARTUP_STUDYBTN] as Biguan_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(this.STARTUP,Biguan_StartUpCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         switch(param1.name)
         {
            case PipeConstants.STARTUP_STUDYBTN:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(this.STARTUP);
      }
   }
}

