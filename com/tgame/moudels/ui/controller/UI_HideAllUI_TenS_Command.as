package com.tgame.moudels.ui.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class UI_HideAllUI_TenS_Command extends SimpleCommand
   {
      
      public static var showArr:Array = [];
      
      public function UI_HideAllUI_TenS_Command()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Boolean = param1.getBody() as Boolean;
         if(_loc2_)
         {
            this.showUI();
         }
         else
         {
            this.hideUI(GameInstance.stage);
            this.hideUI(GameInstance.uiInstance.uiContainer);
         }
      }
      
      private function hideUI(param1:DisplayObject) : void
      {
         var _loc4_:DisplayObject = null;
         if(param1 == null)
         {
            return;
         }
         if(!(param1 is DisplayObjectContainer))
         {
            return;
         }
         if(param1 is Loader)
         {
            return;
         }
         var _loc2_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         var _loc3_:* = _loc2_.numChildren;
         while(_loc3_-- > 0)
         {
            _loc4_ = _loc2_.getChildAt(_loc3_);
            if(!Fun.isParentChild(_loc4_ as DisplayObjectContainer,GameInstance.app) && _loc4_ != GameInstance.app && _loc4_ != GameInstance.app.sceneContainer && _loc4_ != GameInstance.app.bloodContainer && _loc4_ != GameInstance.app.uiContainer && _loc4_ != GameInstance.app.alertContainer && _loc4_ != GameInstance.app.toolTipContainer && _loc4_ != GameInstance.app.letterContainer && _loc4_ != GameInstance.uiInstance._mainUI && _loc4_ != GameInstance.uiInstance.loadingBar && _loc4_ != GameInstance.uiInstance.loginUI && _loc4_ != GameInstance.uiInstance.buttonContainer && _loc4_ != TCursorManager.cursorBmp)
            {
               if(_loc4_.visible)
               {
                  _loc4_.visible = false;
                  showArr.push(_loc4_);
               }
            }
         }
      }
      
      private function showUI() : void
      {
         var _loc1_:DisplayObject = null;
         for each(_loc1_ in showArr)
         {
            _loc1_.visible = true;
         }
         showArr = [];
      }
   }
}

