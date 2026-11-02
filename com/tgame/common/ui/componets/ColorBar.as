package com.tgame.common.ui.componets
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.*;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   import gs.TweenLite;
   
   public class ColorBar extends Sprite
   {
      
      private var str:String;
      
      private var bar:Bitmap;
      
      private var _w:int;
      
      private var _h:int;
      
      private var tipText:FLabel;
      
      private var _currentValue:Number;
      
      private var _maxValue:Number;
      
      private var _isPercent:Boolean;
      
      private var _currTip:String;
      
      private var _maxTip:String;
      
      private var _tip:String;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var _showNumber:Boolean;
      
      public function ColorBar(param1:int, param2:int = 100, param3:int = 7, param4:Boolean = true, param5:Boolean = false, param6:Boolean = false, param7:String = "", param8:String = "", param9:String = "")
      {
         var background:Class;
         var backimgData:BitmapData;
         var type:int = param1;
         var w:int = param2;
         var h:int = param3;
         var showNumber:Boolean = param4;
         var isPercent:Boolean = param5;
         var showTip:Boolean = param6;
         var currTip:String = param7;
         var maxTip:String = param8;
         var tips:String = param9;
         super();
         this._w = w;
         this._isPercent = isPercent;
         switch(type)
         {
            case 1:
               this.str = "ui.main.color.red";
               break;
            case 2:
               this.str = "ui.main.color.blue";
               break;
            case 3:
               this.str = "ui.main.color.purple";
               break;
            case 4:
               this.str = "ui.main.color.yellow";
               break;
            case 5:
               this.str = "ui.main.color.green";
               break;
            case 6:
               this.str = "ui.main.color.orange";
               break;
            case 7:
               this.str = "ui.main.color.blue2";
         }
         graphics.beginFill(0,0.2);
         graphics.drawRect(0,0,w,h);
         graphics.endFill();
         background = getDefinitionByName(this.str) as Class;
         backimgData = new background(1,7) as BitmapData;
         this.bar = new Bitmap(backimgData);
         addChild(this.bar);
         this.bar.scaleY = h / 7;
         this.tipText = new FLabel();
         with(this.tipText)
         {
            selectable = false;
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            filters = [new GlowFilter(3158064,1,3,3,16,BitmapFilterQuality.LOW)];
            text = "0/0";
         }
         this.tipText.x = (w - this.tipText.width) / 2;
         this.tipText.y = (h - this.tipText.height) / 2 - 1;
         addChild(this.tipText);
         this.tipText.visible = showNumber;
         this._showNumber = showNumber;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         if(showTip)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         }
         this._currTip = currTip;
         this._maxTip = maxTip;
         this._tip = tips;
      }
      
      public function set type(param1:int) : void
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 1:
               _loc2_ = "ui.main.color.red";
               break;
            case 2:
               _loc2_ = "ui.main.color.blue";
               break;
            case 3:
               _loc2_ = "ui.main.color.purple";
               break;
            case 4:
               _loc2_ = "ui.main.color.yellow";
               break;
            case 5:
               _loc2_ = "ui.main.color.green";
               break;
            case 6:
               _loc2_ = "ui.main.color.orange";
               break;
            default:
               _loc2_ = "ui.main.color.red";
         }
         var _loc3_:Class = getDefinitionByName(_loc2_) as Class;
         var _loc4_:BitmapData = new _loc3_(1,7) as BitmapData;
         this.bar.bitmapData = _loc4_;
         this.setValue(this._currentValue,this._maxValue);
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function showTip() : void
      {
         this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + this._currTip + ":" + this._currentValue + "    " + this._maxTip + ":" + this._maxValue + "</font><br>" + this._tip + "</textformat>";
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 6;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
         Tools.currentStage.addChild(this.tipCanvas);
         if(Tools.currentStage.mouseX + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 10;
         }
         if(Tools.currentStage.mouseY + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = Tools.currentStage.mouseY + 10;
         }
      }
      
      public function get currentValue() : Number
      {
         return this._currentValue;
      }
      
      public function get maxValue() : Number
      {
         return this._maxValue;
      }
      
      public function setValue(param1:Number = -1, param2:Number = -1, param3:Number = 0) : void
      {
         if(param1 != -1)
         {
            this._currentValue = param1;
         }
         if(param2 != -1)
         {
            this._maxValue = param2;
         }
         if(param1 == -100 && param2 == -100)
         {
            this.tipText.visible = false;
            this.bar.scaleX = 1;
            this.tipText.text = "?/?";
            this.tipText.x = (this._w - this.tipText.width) / 2;
         }
         else
         {
            this.tipText.visible = this._showNumber;
            if(this._isPercent)
            {
               this.tipText.text = int(this._currentValue / this._maxValue * 100) + "%";
            }
            else
            {
               this.tipText.text = this._currentValue + (param3 > 0 ? "+" + param3 : "") + "/" + this._maxValue + (param3 > 0 ? "+" + param3 : "");
            }
            this.tipText.x = (this._w - this.tipText.width) / 2;
         }
         if(param1 <= param2 && param2 != 0)
         {
            if(param1 == 0)
            {
               param1 = 1;
            }
            TweenLite.to(this.bar,0.5,{"scaleX":this._currentValue / this._maxValue * this._w});
         }
         else
         {
            this.bar.scaleX = this._w;
         }
      }
      
      public function showNumber(param1:Boolean = true) : void
      {
         this._showNumber = param1;
         this.tipText.visible = this._showNumber;
      }
   }
}

