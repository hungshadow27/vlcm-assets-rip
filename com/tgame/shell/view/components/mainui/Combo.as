package com.tgame.shell.view.components.mainui
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.TimerManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import gs.TweenLite;
   
   public class Combo extends Sprite
   {
      
      private var comboNO:Array = ["ui.combo.no.0","ui.combo.no.1","ui.combo.no.2","ui.combo.no.3","ui.combo.no.4","ui.combo.no.5","ui.combo.no.6","ui.combo.no.7","ui.combo.no.8","ui.combo.no.9"];
      
      private var blackBg:Bitmap;
      
      private var redBg:Bitmap;
      
      private var _mask:Sprite;
      
      private var noContainer:Sprite;
      
      private var NOimg:Bitmap;
      
      private var time:Timer;
      
      private var timeData:TimerData;
      
      public function Combo()
      {
         var _loc1_:Bitmap = null;
         super();
         visible = false;
         this.blackBg = StaticValue.getBitmapByClassName("ui.combo.bg.black");
         this.blackBg.y = 68;
         addChild(this.blackBg);
         this.redBg = StaticValue.getBitmapByClassName("ui.combo.bg.red");
         this.redBg.y = 68;
         addChild(this.redBg);
         this.redBg.cacheAsBitmap = true;
         this._mask = new Sprite();
         this._mask.y = 68;
         addChild(this._mask);
         this.redBg.mask = this._mask;
         _loc1_ = StaticValue.getBitmapByClassName("ui.combo.tip");
         addChild(_loc1_);
         _loc1_.x = 33;
         _loc1_.y = 12 + 68;
         this.noContainer = new Sprite();
         this.NOimg = new Bitmap(new BitmapData(100,43,true,0));
         addChild(this.NOimg);
         this.NOimg.x = -60;
         this.NOimg.y = -16 + 68;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouse);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         GameInstance.scene.sceneDispatchEvent(param1);
      }
      
      private function drawSector(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Number = param4;
         var _loc8_:Number = 0;
         if(param5 != 0)
         {
            _loc7_ = Math.cos(param5 * Math.PI / 180) * param4;
            _loc8_ = Math.sin(param5 * Math.PI / 180) * param4;
         }
         param1.moveTo(param2,param3);
         param1.lineTo(param2 + _loc7_,param3 + _loc8_);
         var _loc9_:Number = param6 * Math.PI / 180 / param6;
         var _loc10_:Number = Math.cos(_loc9_);
         var _loc11_:Number = Math.sin(_loc9_);
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         while(_loc13_ < param6)
         {
            _loc7_ = _loc10_ * _loc7_ - _loc11_ * _loc8_;
            _loc8_ = _loc10_ * _loc8_ + _loc11_ * _loc7_;
            param1.lineTo(_loc7_ + param2,_loc8_ + param3);
            _loc13_++;
         }
         param1.lineTo(param2,param3);
      }
      
      private function showNumber(param1:int) : void
      {
         var _loc5_:int = 0;
         while(this.noContainer.numChildren > 0)
         {
            this.noContainer.removeChildAt(0);
         }
         var _loc2_:int = int(param1 / 100);
         var _loc3_:int = int((param1 - 100 * _loc2_) / 10);
         var _loc4_:int = int(param1 - 100 * _loc2_ - 10 * _loc3_);
         if(_loc2_ == 0)
         {
            if(_loc3_ == 0)
            {
               this.noContainer.addChild(StaticValue.getBitmapByClassName(this.comboNO[_loc4_]));
            }
            else
            {
               this.noContainer.addChild(StaticValue.getBitmapByClassName(this.comboNO[_loc4_]));
               this.noContainer.addChild(StaticValue.getBitmapByClassName(this.comboNO[_loc3_]));
            }
         }
         else
         {
            this.noContainer.addChild(StaticValue.getBitmapByClassName(this.comboNO[_loc4_]));
            this.noContainer.addChild(StaticValue.getBitmapByClassName(this.comboNO[_loc3_]));
            this.noContainer.addChild(StaticValue.getBitmapByClassName(this.comboNO[_loc2_]));
         }
         var _loc6_:int = this.noContainer.numChildren;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            this.noContainer.getChildAt(_loc5_).x = 90 - (_loc5_ + 1) * 30;
            _loc5_++;
         }
         this.NOimg.bitmapData.fillRect(new Rectangle(0,0,100,43),0);
         this.NOimg.bitmapData.draw(this.noContainer);
         this.NOimg.width = 270;
         this.NOimg.height = 129;
         this.NOimg.x = -260;
         this.NOimg.y = 20;
         TweenLite.to(this.NOimg,0.5,{
            "width":90,
            "height":43,
            "x":-60,
            "y":-16 + 68
         });
      }
      
      public function play(param1:int, param2:int) : void
      {
         var times:int = param1;
         var combo:int = param2;
         visible = false;
         this.showNumber(combo);
         if(this.timeData != null)
         {
            TimerManager.deleteTimer(this.timeData);
         }
         this.timeData = TimerManager.createExactTimer(times / 1000,0,100,function(param1:Number):void
         {
            _mask.graphics.clear();
            _mask.graphics.beginFill(0);
            _mask.graphics.drawRect(0,0,128 * (1 - param1 / 100),53);
            _mask.graphics.endFill();
         },function():void
         {
            while(noContainer.numChildren > 0)
            {
               noContainer.removeChildAt(0);
            }
            visible = false;
         });
         visible = true;
      }
   }
}

