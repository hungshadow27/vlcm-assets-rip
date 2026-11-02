package com.tgame.shell.view.components.map
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class NpcListRender extends FListCellRenderer
   {
      
      public function NpcListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc2_:FLabel = null;
         _height = 20;
         var _loc1_:FLabel = new FLabel();
         addChild(_loc1_);
         _loc1_.filters = StaticValue.filter;
         _loc1_.textColor = StaticValue.BLUE;
         _loc1_.selectable = false;
         _loc1_.text = data.label;
         _loc1_.height = 20;
         _loc2_ = new FLabel();
         addChild(_loc2_);
         _loc2_.filters = StaticValue.filter;
         _loc2_.textColor = StaticValue.WHITE;
         _loc2_.selectable = false;
         _loc2_.text = data.dsc;
         _loc2_.height = 20;
         _loc2_.x = 105;
      }
   }
}

