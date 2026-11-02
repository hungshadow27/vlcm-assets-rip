package com.tgame.moudels.jueZhanGuangMingDing
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jueZhanGuangMingDing.controller.JueZhanGuangMingDing_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JueZhanGuangMingDing_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jueZhanGuangMingDing.JueZhanGuangMingDing_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function JueZhanGuangMingDing_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JUEZHANGUANGMINGDING],this.handlePipeMessage,JueZhanGuangMingDing_ApplicationFacade);
      }
      
      public static function getInstance() : JueZhanGuangMingDing_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JueZhanGuangMingDing_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JueZhanGuangMingDing_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JueZhanGuangMingDing_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JUEZHANGUANGMINGDING:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

