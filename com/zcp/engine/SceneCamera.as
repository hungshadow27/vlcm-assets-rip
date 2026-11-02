package com.zcp.engine
{
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.BaseElement;
   import flash.geom.Point;
   
   public class SceneCamera extends BaseElement
   {
      
      private const LIMEN_RATIO:Number = 0.05;
      
      private var x_limen:int = 200;
      
      private var y_limen:int = 116;
      
      private const TWEEN_SPEED:Number = 0.4;
      
      private var _scene:Scene;
      
      private var _followCharacter:SceneCharacter;
      
      private var _isLocked:Boolean = false;
      
      public var tileRangeXY:Point;
      
      public var zoneRangeXY:Point;
      
      public var avatarRangeXY:Point;
      
      public function SceneCamera(param1:Scene)
      {
         super();
         this._scene = param1;
         this.updateRangeXY();
      }
      
      public function lock() : void
      {
         this._isLocked = true;
      }
      
      public function unlock() : void
      {
         this._isLocked = false;
      }
      
      public function updateRangeXY() : void
      {
         this.tileRangeXY = SceneUtil.getViewTileRangeXY(this._scene);
         this.zoneRangeXY = SceneUtil.getViewZoneRangeXY(this._scene);
         this.avatarRangeXY = SceneUtil.getViewAvatarRangeXY(this._scene);
         this.x_limen = this._scene.sceneConfig.width * this.LIMEN_RATIO;
         this.y_limen = this._scene.sceneConfig.height * this.LIMEN_RATIO;
      }
      
      public function canSee(param1:SceneCharacter) : Boolean
      {
         return param1.tile_x > tile_x - this.tileRangeXY.x && param1.tile_x < tile_x + this.tileRangeXY.x && param1.tile_y > tile_y - this.tileRangeXY.y && param1.tile_y < tile_y + this.tileRangeXY.y;
      }
      
      public function lookAt(param1:SceneCharacter, param2:Boolean = false) : void
      {
         this._followCharacter = param1;
         this.run(param2);
      }
      
      public function run(param1:Boolean = true) : void
      {
         if(this._isLocked)
         {
            return;
         }
         if(this._followCharacter == null)
         {
            return;
         }
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Point = new Point(this._followCharacter.piexl_x,this._followCharacter.piexl_y);
         _loc12_ = this._scene.parent.globalToLocal(this._scene.localToGlobal(_loc12_));
         if(this._scene.mapConfig.width > this._scene.sceneConfig.width || this._scene.mapConfig.unbounded_left || this._scene.mapConfig.unbounded_right)
         {
            _loc2_ = this._scene.sceneConfig.width * 0.5;
            _loc4_ = this._scene.sceneConfig.width - this._scene.mapConfig.width;
            _loc8_ = _loc2_ - _loc12_.x;
            if(_loc8_ > this.x_limen)
            {
               _loc10_ = _loc8_ - this.x_limen;
            }
            else if(_loc8_ < -this.x_limen)
            {
               _loc10_ = _loc8_ + this.x_limen;
            }
            _loc6_ = this._scene.x + _loc10_;
            if(!this._scene.mapConfig.unbounded_right)
            {
               if(_loc6_ < _loc4_)
               {
                  _loc6_ = _loc4_;
               }
            }
            if(!this._scene.mapConfig.unbounded_left)
            {
               if(_loc6_ > 0)
               {
                  _loc6_ = 0;
               }
            }
            _loc8_ = _loc6_ - this._scene.x;
            if(_loc8_ != 0)
            {
               if(!param1)
               {
                  this._scene.x += Math.ceil(_loc8_);
               }
               else
               {
                  this._scene.x += Math.ceil(_loc8_ * this.TWEEN_SPEED);
               }
            }
         }
         else
         {
            _loc2_ = this._scene.mapConfig.width * 0.5;
            _loc6_ = (this._scene.sceneConfig.width - this._scene.mapConfig.width) / 2;
            if(this._scene.x != _loc6_)
            {
               this._scene.x = Math.ceil(_loc6_);
            }
         }
         if(this._scene.mapConfig.height > this._scene.sceneConfig.height || this._scene.mapConfig.unbounded_top || this._scene.mapConfig.unbounded_bottom)
         {
            _loc3_ = this._scene.sceneConfig.height * 0.5;
            _loc5_ = this._scene.sceneConfig.height - this._scene.mapConfig.height;
            _loc9_ = _loc3_ - _loc12_.y;
            if(_loc9_ > this.y_limen)
            {
               _loc11_ = _loc9_ - this.y_limen;
            }
            else if(_loc9_ < -this.y_limen)
            {
               _loc11_ = _loc9_ + this.y_limen;
            }
            _loc7_ = this._scene.y + _loc11_;
            if(!this._scene.mapConfig.unbounded_bottom)
            {
               if(_loc7_ < _loc5_)
               {
                  _loc7_ = _loc5_;
               }
            }
            if(!this._scene.mapConfig.unbounded_top)
            {
               if(_loc7_ > 0)
               {
                  _loc7_ = 0;
               }
            }
            _loc9_ = _loc7_ - this._scene.y;
            if(_loc9_ != 0)
            {
               if(!param1)
               {
                  this._scene.y += Math.ceil(_loc9_);
               }
               else
               {
                  this._scene.y += Math.ceil(_loc9_ * this.TWEEN_SPEED);
               }
            }
         }
         else
         {
            _loc3_ = this._scene.mapConfig.height * 0.5;
            _loc7_ = (this._scene.sceneConfig.height - this._scene.mapConfig.height) / 2;
            if(this._scene.y != _loc7_)
            {
               this._scene.y = Math.ceil(_loc7_);
            }
         }
         var _loc13_:Point = new Point(_loc2_,_loc3_);
         _loc13_ = this._scene.globalToLocal(this._scene.parent.localToGlobal(_loc13_));
         piexl_x = _loc13_.x;
         piexl_y = _loc13_.y;
      }
   }
}

