package com.tgame.shell.view.components.ridejiaohuanshengshou
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class jiaoHuanShengShouRideListRender extends FListCellRenderer
   {
      
      public function jiaoHuanShengShouRideListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:TextFormat = null;
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
         _loc3_.x = 84;
         _loc3_.height = 20;
         var _loc4_:FLabel = new FLabel();
         addChild(_loc4_);
         _loc4_.filters = StaticValue.filter;
         _loc4_.defaultTextFormat = _loc1_;
         _loc4_.selectable = false;
         _loc4_.text = data.showlabel;
         _loc4_.x = 0;
         _loc4_.height = 20;
      }
   }
}

