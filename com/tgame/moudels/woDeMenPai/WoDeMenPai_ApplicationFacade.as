package com.tgame.moudels.woDeMenPai
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.woDeMenPai.controller.WoDeMenPai_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class WoDeMenPai_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.woDeMenPai.WoDeMenPai_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const CLICK_RIGHT:String = "CLICK_RIGHT";
      
      public function WoDeMenPai_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WODEMENPAI,PipeConstants.GOODS_CHANGED,PipeConstants.CLICK_RIGHT],this.handlePipeMessage,WoDeMenPai_ApplicationFacade);
      }
      
      public static function getInstance() : WoDeMenPai_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new WoDeMenPai_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as WoDeMenPai_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,WoDeMenPai_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_WODEMENPAI:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.CLICK_RIGHT:
               sendNotification(CLICK_RIGHT);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

