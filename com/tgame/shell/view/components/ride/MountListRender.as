package com.tgame.shell.view.components.ride
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   
   public class MountListRender extends FListCellRenderer
   {
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function MountListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:Bitmap = null;
         var _loc3_:Bitmap = null;
         _height = 40;
         if(data.showlabel == LanResManager.getLanCommonTextWords("增加槽位"))
         {
            _loc1_ = StaticValue.getBitmapByClassName("ui.tongyong.fugai.kuang");
            addChild(_loc1_);
            _loc1_.x = 20 - 2;
            _loc1_.y = 1;
         }
         else if(data.showlabel == LanResManager.getLanCommonTextWords("空闲槽位"))
         {
            _loc1_ = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
            addChild(_loc1_);
            _loc1_.x = 20 - 3;
            _loc1_.y = 1;
         }
         else
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
            _loc3_.x = 20 - 3;
            _loc3_.y = 1;
            addChild(_loc3_);
            _loc1_ = ResPathManager.getSmallICO(data.icoId);
            addChild(_loc1_);
            _loc1_.x = 20;
            _loc1_.y = 5;
         }
         if(data.state == "1")
         {
            _loc2_ = StaticValue.getBitmapByClassName("ui.ride.state.qi");
            _loc2_.y = 10;
            addChild(_loc2_);
         }
         else if(data.state == "2")
         {
            _loc2_ = StaticValue.getBitmapByClassName("ui.ride.state.zhan");
            _loc2_.y = 10;
            addChild(_loc2_);
         }
      }
   }
}

