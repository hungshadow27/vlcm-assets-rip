package com.tgame.moudels.jileizhi
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jileizhi.controller.JiLeiZhi_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JiLeiZhi_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jileizhi.JiLeiZhi_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function JiLeiZhi_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JILEIZHI],this.handlePipeMessage,JiLeiZhi_ApplicationFacade);
      }
      
      public static function getInstance() : JiLeiZhi_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JiLeiZhi_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JiLeiZhi_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JiLeiZhi_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JILEIZHI:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

