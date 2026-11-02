package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import flash.display.Sprite;
   
   public class longWenKeHuaListRender extends FListCellRenderer
   {
      
      public function longWenKeHuaListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 30;
         var _loc1_:Sprite = new Sprite();
         _loc1_ = data.label;
         addChild(_loc1_);
         _loc1_.x = 2;
         _loc1_.y = 2;
      }
   }
}

