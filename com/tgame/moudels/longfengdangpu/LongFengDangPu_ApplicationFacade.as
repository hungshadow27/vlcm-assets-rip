package com.tgame.moudels.longfengdangpu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.longfengdangpu.cotroller.LongFengDangPu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class LongFengDangPu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.longfengdangpu.LongFengDangPu_ApplicationFacade";
      
      public static const GET_LONGFENGDANGPU_PANEL:String = "GET_LONGFENGDANGPU_PANEL";
      
      public static const LONGFENGDANGPU_BUY:String = "LONGFENGDANGPU_BUY";
      
      public static const STARTUP:String = "STARTUP";
      
      public function LongFengDangPu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.SHOW_LONGFENGDANGPU_PANEL,PipeConstants.STARTUP_LONGFENGDANGPU,PipeConstants.LONGFENGDANGPU_BUY],this.handlePipeMessage,LongFengDangPu_ApplicationFacade);
      }
      
      public static function getInstance() : LongFengDangPu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new LongFengDangPu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as LongFengDangPu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,LongFengDangPu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_LONGFENGDANGPU:
               this.startup();
               break;
            case PipeConstants.SHOW_LONGFENGDANGPU_PANEL:
               sendNotification(GET_LONGFENGDANGPU_PANEL);
               break;
            case PipeConstants.LONGFENGDANGPU_BUY:
               sendNotification(LONGFENGDANGPU_BUY,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

