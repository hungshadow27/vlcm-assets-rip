package com.tgame.moudels.bangpairongyutarget
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.bangpairongyutarget.controller.BangPaiRongYuTarget_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BangPaiRongYuTarget_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.bangpairongyutarget.BangPaiRongYuTarget_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function BangPaiRongYuTarget_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_BANGPAIRONGYUTARGET,PipeConstants.SHOW_BANGHUI_RONGYU_LIST_PANEL],this.handlePipeMessage,BangPaiRongYuTarget_ApplicationFacade);
      }
      
      public static function getInstance() : BangPaiRongYuTarget_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BangPaiRongYuTarget_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BangPaiRongYuTarget_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BangPaiRongYuTarget_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_BANGPAIRONGYUTARGET:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

