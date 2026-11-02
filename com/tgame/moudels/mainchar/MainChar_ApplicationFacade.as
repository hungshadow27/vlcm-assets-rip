package com.tgame.moudels.mainchar
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.moudels.mainchar.controller.MainChar_StartupCommand;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MainChar_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.char.MainChar_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SINGLE_CLICK:String = "SINGLE_CLICK";
      
      public static const TAB_SELECT:String = "TAB_SELECT";
      
      public function MainChar_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MAINCHAR,PipeConstants.SINGLE_CLICK,PipeConstants.TAB_SELECT,PipeConstants.KEY_ESC],this.handlePipeMessage,MainChar_ApplicationFacade);
      }
      
      public static function getInstance() : MainChar_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MainChar_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MainChar_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MainChar_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MAINCHAR:
               this.startup();
               break;
            case PipeConstants.SINGLE_CLICK:
               sendNotification(SINGLE_CLICK,_loc2_);
               break;
            case PipeConstants.TAB_SELECT:
               sendNotification(TAB_SELECT,_loc2_);
               break;
            case PipeConstants.KEY_ESC:
               if(Fun.isVisible(GameInstance.uiInstance._stonePanel) || Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel) || Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel) || Fun.isVisible(GameInstance.uiInstance._coneyGirlPanel) || Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel) || Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
               {
                  return;
               }
               if(TCursorManager.getCurruntStatus() != TCursorManager.CURSOR_TIAOYUE)
               {
                  TCursorManager.resumFullMouse();
               }
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

