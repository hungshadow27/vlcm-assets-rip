package com.tgame.common.ui.componets
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.KeyboardManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class POPWindowManager extends Sprite
   {
      
      public static var popWindow:POPWindowManager;
      
      private var modal:Boolean;
      
      public function POPWindowManager()
      {
         super();
      }
      
      public static function showWindow(param1:DisplayObject, param2:Boolean = true) : POPWindowManager
      {
         if(popWindow == null)
         {
            popWindow = new POPWindowManager();
         }
         while(popWindow.numChildren > 0)
         {
            popWindow.removeChildAt(0);
         }
         popWindow.addChild(param1);
         param1.x = (GameConfig.sceneWidth - param1.width) / 2;
         param1.y = (GameConfig.sceneHeight - param1.height) / 2;
         popWindow.modal = param2;
         if(param2)
         {
            KeyboardManager.enable = false;
            popWindow.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         else
         {
            popWindow.graphics.clear();
         }
         GameInstance.uiInstance.alertContainer.addChild(popWindow);
         return popWindow;
      }
      
      public static function closeWindow() : void
      {
         if(popWindow == null)
         {
            return;
         }
         while(popWindow.numChildren > 0)
         {
            popWindow.removeChildAt(0);
         }
         if(popWindow.parent)
         {
            popWindow.parent.removeChild(popWindow);
         }
         KeyboardManager.enable = true;
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         var _loc3_:DisplayObject = null;
         if(this.modal)
         {
            graphics.clear();
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,param1,param2);
            graphics.endFill();
         }
         if(numChildren > 0)
         {
            _loc3_ = getChildAt(0);
            _loc3_.x = (param1 - _loc3_.width) / 2;
            _loc3_.y = (param2 - _loc3_.height) / 2;
         }
      }
   }
}

