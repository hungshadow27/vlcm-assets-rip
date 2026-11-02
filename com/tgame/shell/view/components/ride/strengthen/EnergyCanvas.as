package com.tgame.shell.view.components.ride.strengthen
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class EnergyCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var nameAndLevel:FTextArea;
      
      private var startBtn:SecondButton;
      
      private var ft:FTextArea;
      
      public function EnergyCanvas()
      {
         var tip:FTextArea;
         var title:FLabel;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.ridefeed.ridestrengthen.ui";
         this._mask = new Shape();
         with(this._mask)
         {
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,174,110);
            graphics.endFill();
         }
         this._mask.x = 4;
         this._mask.y = 195;
         this._avatar = new Bitmap();
         tip = new FTextArea();
         with(tip)
         {
            x = 14;
            y = 44;
            width = 300;
            height = 130;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
            multiline = true;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"属性性强化功能",[StaticValue.ORANGE_HTML],false) + "</textformat>";
         }
         addChild(tip);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 14;
            y = tip.y + 130;
            width = 300;
            height = 40;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
            multiline = true;
            htmlText = LanResManager.getLanCommonTextWords("选中一项要提升的属性，点击【开始提升】可以进行属性提升，提升属性需要消耗【资质丹】");
         }
         addChild(this.ft);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始提升");
         this.startBtn.x = (328 - this.startBtn.width) / 2;
         this.startBtn.y = 314 - 95;
         this.startBtn.enabled = false;
         title = new FLabel();
         title.filters = StaticValue.filter;
         title.textColor = StaticValue.ORANGE;
         title.text = LanResManager.getLanCommonTextWords("您将要提升的坐骑是：");
         title.x = 10;
         title.y = 175;
         this.nameAndLevel = new FTextArea();
         with(this.nameAndLevel)
         {
            width = 134;
            height = 40;
            x = 186;
            y = 196;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
            htmlText = "";
         }
         tip = new FTextArea();
         with(tip)
         {
            x = 186;
            y = 239;
            width = 134;
            height = 66;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
            multiline = true;
         }
         tip.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"坐骑强化说明") + "</textformat>";
      }
      
      public function setEnergyRideNameLevel(param1:String, param2:int) : void
      {
         this.nameAndLevel.htmlText = "<textformat>" + LanResManager.getLanCommonTextWords("名称：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("等级：") + param2 + "</textformat>";
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         if(this._avatar.width >= 512 && this._avatar.height >= 209)
         {
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            if(_loc2_.width > 200)
            {
               this._avatar.scaleX = this._avatar.scaleY = 200 / _loc2_.width;
            }
            this._avatar.x = 96 - this._avatar.width / 2 - 10;
         }
         else
         {
            _loc3_ = 1;
            if(this._avatar.height != 110)
            {
               _loc3_ = 110 / this._avatar.height;
            }
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            this._avatar.bitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            this._avatar.bitmapData.copyPixels(param1,_loc2_,new Point(0,0));
            _loc4_ = 1;
            if(_loc2_.width > 174)
            {
               _loc4_ = 174 / _loc2_.width;
            }
            this._avatar.scaleX = this._avatar.scaleY = _loc3_ > _loc4_ ? _loc4_ : _loc3_;
            this._avatar.x = 91 - this._avatar.width / 2;
         }
         this._avatar.y = 250 - this._avatar.height / 2;
      }
   }
}

