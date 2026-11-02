package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class ZhengbaLineListRender extends FListCellRenderer
   {
      
      public function ZhengbaLineListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:F9GridBitmap = null;
         var _loc2_:FTextArea = null;
         _height = 30;
         _loc1_ = Tools.get9GridBitmpByName("selectCharListBg");
         _loc1_.width = 190;
         _loc1_.height = 26;
         _loc1_.x = _loc1_.y = 2;
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         addChild(_loc2_);
         _loc2_.filters = StaticValue.filter;
         _loc2_.textColor = data.color;
         _loc2_.selectable = false;
         _loc2_.width = 194;
         _loc2_.height = 20;
         _loc2_.defaultTextFormat = new TextFormat(null,13,null,true,null,null,null,null,"center");
         _loc2_.text = data.label;
         _loc2_.y = 8;
      }
   }
}

