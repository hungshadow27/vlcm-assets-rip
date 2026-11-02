package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class BiaocheZhongdianListRender extends FListCellRenderer
   {
      
      public function BiaocheZhongdianListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:FLabel = null;
         _height = 18;
         _loc1_ = new FLabel();
         addChild(_loc1_);
         _loc1_.filters = StaticValue.filter;
         _loc1_.textColor = StaticValue.WHITE;
         _loc1_.selectable = false;
         _loc1_.text = data.label;
         _loc1_.x = 5;
         _loc1_.y = 1;
         if(data.grade > GameInstance.mainCharData.attributeInfo.lv)
         {
            this.mouseEnabled = false;
            _loc1_.textColor = 6052956;
         }
      }
   }
}

