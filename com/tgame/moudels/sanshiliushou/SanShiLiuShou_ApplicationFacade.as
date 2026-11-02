package com.tgame.moudels.sanshiliushou
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.sanshiliushou.controller.SanShiLiuShou_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class SanShiLiuShou_ApplicationFacade extends Facade
   {
      
      public static const STARTUP:String = "STARTUP";
      
      public static const NAME:String = "com.tgame.moudels.sanshiliushou.SanShiLiuShou_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function SanShiLiuShou_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SANSHILIUSHOU],this.handlePipeMessage,SanShiLiuShou_ApplicationFacade);
      }
      
      public static function getInstance() : SanShiLiuShou_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new SanShiLiuShou_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as SanShiLiuShou_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,SanShiLiuShou_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SANSHILIUSHOU:
               sendNotification(STARTUP);
         }
      }
   }
}

