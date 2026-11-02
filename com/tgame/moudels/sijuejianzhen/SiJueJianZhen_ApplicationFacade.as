package com.tgame.moudels.sijuejianzhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.sijuejianzhen.controller.SiJueJianZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class SiJueJianZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.sijuejianzhen.SiJueJianZhen_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function SiJueJianZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SIJUEJIANZHEN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,SiJueJianZhen_ApplicationFacade);
      }
      
      public static function getInstance() : SiJueJianZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new SiJueJianZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as SiJueJianZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,SiJueJianZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_SIJUEJIANZHEN:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

