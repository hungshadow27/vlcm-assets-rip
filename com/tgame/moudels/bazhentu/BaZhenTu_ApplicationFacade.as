package com.tgame.moudels.bazhentu
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.bazhentu.controller.BaZhenTuStartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BaZhenTu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.bazhentu.BaZhenTu_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function BaZhenTu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BAZHENTU,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,BaZhenTu_ApplicationFacade);
      }
      
      public static function getInstance() : BaZhenTu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BaZhenTu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BaZhenTu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BaZhenTuStartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_BAZHENTU:
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

