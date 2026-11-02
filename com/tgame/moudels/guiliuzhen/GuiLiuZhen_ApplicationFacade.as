package com.tgame.moudels.guiliuzhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.guiliuzhen.controller.GuiLiuZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class GuiLiuZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.guiliuzhen.GuiLiuZhen_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function GuiLiuZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_GUILIUZHEN,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,GuiLiuZhen_ApplicationFacade);
      }
      
      public static function getInstance() : GuiLiuZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new GuiLiuZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as GuiLiuZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,GuiLiuZhen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_GUILIUZHEN:
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

