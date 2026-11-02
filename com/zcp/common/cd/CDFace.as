package com.zcp.common.cd
{
   import com.zcp.common.draw.helper.DrawHelper;
   import com.zcp.common.pool.IPoolClass;
   import com.zcp.common.utils.ZMath;
   import com.zcp.common.vo.StyleData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   import gs.TweenLite;
   import gs.easing.Linear;
   
   public class CDFace extends Sprite implements IPoolClass
   {
      
      private var _bindings:Array = [];
      
      private var _now:Number = 0;
      
      private var _cd:Number = 0;
      
      public var parentCDFace:CDFace;
      
      public var userData:Object;
      
      private var _obj:Object = {"angle":0};
      
      private var _mask:Shape;
      
      private var _r:Number;
      
      private var _w:Number;
      
      private var _h:Number;
      
      private var _onComplete:Function;
      
      private var _this:CDFace;
      
      public function CDFace(param1:Number, param2:Number, param3:Function = null)
      {
         super();
         this._this = this;
         this.reSet([param1,param2,param3]);
      }
      
      public function dispose() : void
      {
         this._bindings = [];
         this._now = 0;
         this._cd = 0;
         this._obj = {"angle":0};
         this._onComplete = null;
         this.parentCDFace = null;
      }
      
      public function reSet(param1:Array) : void
      {
         this._w = param1[0] / 2;
         this._h = param1[1] / 2;
         this._onComplete = param1[2];
         if(!this._mask)
         {
            this._mask = new Shape();
            this.addChild(this._mask);
         }
         this._mask.x = this._w;
         this._mask.y = this._h;
         DrawHelper.drawRect(this,new Point(0,0),new Point(param1[0],param1[1]),new StyleData(0,0,0,0,0.5),true);
         this.mask = this._mask;
      }
      
      public function hasBindingChild(param1:CDFace) : Boolean
      {
         return Boolean(this._bindings) && this._bindings.indexOf(param1) != -1;
      }
      
      public function addBindingChild(param1:CDFace, param2:Boolean = false, param3:Boolean = true) : void
      {
         if(param2)
         {
            this.removeAllBindingChildren(param3);
         }
         else if(this.hasBindingChild(param1))
         {
            return;
         }
         if(param1.parentCDFace)
         {
            param1.parentCDFace.removeBindingChild(param1);
         }
         param1.stop(false);
         param1.parentCDFace = this;
         param1.now = this._now;
         param1.cd = this._cd;
         param1.update(this._cd != 0 ? this._now / this._cd * 360 : 360);
         this._bindings.push(param1);
      }
      
      public function removeBindingChild(param1:CDFace, param2:Boolean = true) : void
      {
         var _loc3_:Array = null;
         if(Boolean(param1) && this._bindings.indexOf(param1) != -1)
         {
            _loc3_ = this._bindings.splice(this._bindings.indexOf(param1),1);
            if(_loc3_[0].parentCDFace == this)
            {
               _loc3_[0].parentCDFace = null;
            }
            if(param2)
            {
               _loc3_[0].update(360);
            }
         }
      }
      
      public function removeAllBindingChildren(param1:Boolean = true) : void
      {
         var _loc2_:CDFace = null;
         while(this._bindings.length > 0)
         {
            _loc2_ = this._bindings.shift();
            if(_loc2_.parentCDFace == this)
            {
               _loc2_.parentCDFace = null;
            }
            if(param1)
            {
               _loc2_.update(360);
            }
         }
      }
      
      public function play(param1:Number, param2:Number = 0) : void
      {
         var $cd:Number = param1;
         var $start:Number = param2;
         this.stop(false);
         this._now = $start;
         this._cd = $cd;
         if(Boolean(this._bindings) && this._bindings.length > 0)
         {
            this._bindings.forEach(function(param1:*, param2:int, param3:Array):void
            {
               if(param1.parentCDFace == _this)
               {
                  param1.now = _now;
                  param1.cd = _cd;
               }
               else
               {
                  _bindings.splice(param2,1);
               }
            });
         }
         this._obj.angle = this._cd != 0 ? this._now / this._cd * 360 : 360;
         if(this.getLosttime() > 0)
         {
            this.onUpdate();
            TweenLite.to(this._obj,this.getLosttime(),{
               "angle":360,
               "onUpdate":this.onUpdate,
               "onComplete":this.onComplete,
               "ease":Linear.easeNone
            });
         }
         else
         {
            this.onComplete_guanbi();
         }
      }
      
      private function onUpdate() : void
      {
         this.update(this._obj.angle);
      }
      
      private function onComplete() : void
      {
         if(this._obj.angle > 350)
         {
            this.update(360);
            if(this._onComplete != null)
            {
               this._onComplete(this);
            }
         }
      }
      
      private function onComplete_guanbi() : void
      {
         this.update(360);
         if(this._onComplete != null)
         {
            this._onComplete(this);
         }
      }
      
      public function stop(param1:Boolean = true) : void
      {
         TweenLite.killTweensOf(this._obj,param1);
      }
      
      public function getLosttime() : Number
      {
         return this._cd - this._now;
      }
      
      public function get now() : Number
      {
         return this._now;
      }
      
      public function set now(param1:Number) : void
      {
         this._now = param1;
      }
      
      public function get cd() : Number
      {
         return this._cd;
      }
      
      public function set cd(param1:Number) : void
      {
         this._cd = param1;
      }
      
      public function get bindingNum() : int
      {
         return this._bindings.length;
      }
      
      private function update(param1:Number = 0) : void
      {
         var tanA:Number;
         var g:Graphics;
         var xx:Number = NaN;
         var yy:Number = NaN;
         var $angle:Number = param1;
         this._now = $angle / 360 * this._cd;
         if(Boolean(this._bindings) && this._bindings.length > 0)
         {
            this._bindings.forEach(function(param1:*, param2:int, param3:Array):void
            {
               if(param1.parentCDFace == _this)
               {
                  param1.update($angle);
               }
               else
               {
                  _bindings.splice(param2,1);
               }
            });
         }
         this._mask.graphics.clear();
         if($angle < 0 || $angle >= 360)
         {
            if($angle == 0)
            {
               DrawHelper.drawCircle(this._mask,new Point(0,0),new Point(this._w,this._h),new StyleData(0,0,0,0,0),true);
            }
            return;
         }
         tanA = Math.tan($angle * ZMath.toRad);
         g = this._mask.graphics;
         g.clear();
         g.lineStyle(0,0,0);
         g.beginFill(0,0);
         g.moveTo(0,0);
         if($angle >= 0 && $angle < 45)
         {
            xx = this._w * tanA;
            yy = -this._h;
            g.lineTo(xx,yy);
            g.lineTo(this._w,-this._h);
            g.lineTo(this._w,this._h);
            g.lineTo(-this._w,this._h);
            g.lineTo(-this._w,-this._h);
         }
         else if($angle >= 45 && $angle < 135)
         {
            xx = this._w;
            yy = -this._w / tanA;
            g.lineTo(xx,yy);
            g.lineTo(this._w,this._h);
            g.lineTo(-this._w,this._h);
            g.lineTo(-this._w,-this._h);
         }
         else if($angle > 135 && $angle < 225)
         {
            xx = -this._h * tanA;
            yy = this._h;
            g.lineTo(xx,yy);
            g.lineTo(-this._w,this._h);
            g.lineTo(-this._w,-this._h);
         }
         else if($angle >= 225 && $angle < 315)
         {
            xx = -this._w;
            yy = this._w / tanA;
            g.lineTo(xx,yy);
            g.lineTo(-this._w,-this._h);
         }
         else if($angle >= 315 && $angle < 360)
         {
            xx = this._w * tanA;
            yy = -this._h;
            g.lineTo(xx,yy);
         }
         g.lineTo(0,-this._h);
         g.lineTo(0,0);
         g.endFill();
      }
   }
}

