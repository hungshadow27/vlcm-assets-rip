package com.tgame.moudels.xinnianyasuiqian
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xinnianyasuiqian.controller.Xinnianyasuiqian_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Xinnianyasuiqian_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.xinnianyasuiqian.Xinnianyasuiqian_ApplicationFacade";
      
      public static const YN_SHOW_XINNIANYASUIQIAN2017:String = "YN_SHOW_XINNIANYASUIQIAN2017";
      
      public static const SHOW_XINIANYASUIQIANCHAKAN_PLANE:String = "SHOW_XINIANYASUIQIANCHAKAN_PLANE";
      
      public function Xinnianyasuiqian_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XINNIANYASUIQIAN,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.YN_SHOW_XINNIANYASUIQIAN,PipeConstants.SHOW_XINIANYASUIQIANCHAKAN_PLANE],this.handlePipeMessage,Xinnianyasuiqian_ApplicationFacade);
      }
      
      public static function getInstance() : Xinnianyasuiqian_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Xinnianyasuiqian_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Xinnianyasuiqian_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Xinnianyasuiqian_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_XINNIANYASUIQIAN:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               break;
            case PipeConstants.YN_SHOW_XINNIANYASUIQIAN:
               sendNotification(YN_SHOW_XINNIANYASUIQIAN2017,_loc2_);
               break;
            case PipeConstants.SHOW_XINIANYASUIQIANCHAKAN_PLANE:
               sendNotification(SHOW_XINIANYASUIQIANCHAKAN_PLANE);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

