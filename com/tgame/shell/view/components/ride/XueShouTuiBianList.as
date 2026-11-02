package com.tgame.shell.view.components.ride
{
   import com.fireice.list.FListCellRenderer;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   
   public class XueShouTuiBianList extends FListCellRenderer
   {
      
      public function XueShouTuiBianList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc2_:Bitmap = null;
         _height = 39;
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         _loc1_.x = 10 - 3;
         _loc1_.y = 1;
         addChild(_loc1_);
         _loc2_ = ResPathManager.getSmallICO(data.res.id_ico);
         addChild(_loc2_);
         _loc2_.x = 10;
         _loc2_.y = 5;
      }
   }
}

