package com.tgame.moudels.huashanlunjian
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.huashanlunjian.controller.Huashanlunjian_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Huashanlunjian_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.huashanlunjian.Huashanlunjian_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function Huashanlunjian_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_HUASHANLUNJIAN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,Huashanlunjian_ApplicationFacade);
      }
      
      public static function getInstance() : Huashanlunjian_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Huashanlunjian_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Huashanlunjian_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Huashanlunjian_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_HUASHANLUNJIAN:
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

