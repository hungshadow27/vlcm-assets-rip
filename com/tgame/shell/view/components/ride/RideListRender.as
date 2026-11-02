package com.tgame.shell.view.components.ride
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class RideListRender extends FListCellRenderer
   {
      
      public function RideListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:TextFormat = null;
         var _loc5_:Bitmap = null;
         _height = 20;
         _loc1_ = new TextFormat();
         var _loc2_:int = int(StaticValue.rideColors[int(data.quality)]);
         switch(data.showlabel)
         {
            case LanResManager.getLanCommonTextWords("增加槽位"):
               _loc1_.color = StaticValue.ORANGE_RED;
               break;
            case LanResManager.getLanCommonTextWords("空闲槽位"):
               _loc1_.color = StaticValue.WHITE;
               break;
            default:
               _loc1_.color = _loc2_;
         }
         var _loc3_:FLabel = new FLabel();
         addChild(_loc3_);
         _loc3_.filters = StaticValue.filter;
         _loc3_.defaultTextFormat = _loc1_;
         _loc3_.selectable = false;
         if(data.level == undefined)
         {
            _loc3_.text = "";
         }
         else
         {
            _loc3_.text = data.level;
         }
         _loc3_.x = 122;
         _loc3_.height = 20;
         var _loc4_:FLabel = new FLabel();
         addChild(_loc4_);
         _loc4_.filters = StaticValue.filter;
         _loc4_.defaultTextFormat = _loc1_;
         _loc4_.selectable = false;
         _loc4_.text = data.showlabel;
         _loc4_.x = 20;
         _loc4_.height = 20;
         if(data.state == "1")
         {
            _loc5_ = StaticValue.getBitmapByClassName("ui.ride.state.qi");
            addChild(_loc5_);
         }
         else if(data.state == "2")
         {
            _loc5_ = StaticValue.getBitmapByClassName("ui.ride.state.zhan");
            addChild(_loc5_);
         }
      }
   }
}

