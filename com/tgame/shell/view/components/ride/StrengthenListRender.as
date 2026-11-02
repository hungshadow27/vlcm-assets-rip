package com.tgame.shell.view.components.ride
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class StrengthenListRender extends FListCellRenderer
   {
      
      public function StrengthenListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 20;
         var _loc1_:FLabel = new FLabel();
         addChild(_loc1_);
         _loc1_.filters = StaticValue.filter;
         _loc1_.textColor = StaticValue.WHITE;
         _loc1_.selectable = false;
         _loc1_.text = data.label;
         _loc1_.x = 5;
         _loc1_.y = 2;
      }
   }
}

