package com.zcp.engine.utils
{
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.Scene;
   import com.zcp.engine.config.MapConfig;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.graphics.layers.SceneAvatarLayer;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.vo.BaseElement;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.map.MapZone;
   import flash.geom.Point;
   
   public class SceneUtil
   {
      
      public function SceneUtil()
      {
         super();
      }
      
      public static function getViewTileRangeXY(param1:Scene) : Point
      {
         var _loc2_:Point = new Point();
         _loc2_.x = Math.ceil((param1.sceneConfig.width / SceneConfig.TILE_WIDTH - 1) / 2) + 1;
         _loc2_.y = Math.ceil((param1.sceneConfig.height / SceneConfig.TILE_HEIGHT - 1) / 2) + 1;
         return _loc2_;
      }
      
      public static function getViewZoneRangeXY(param1:Scene) : Point
      {
         var _loc2_:Point = new Point();
         _loc2_.x = Math.ceil((param1.sceneConfig.width / SceneConfig.ZONE_WIDTH - 1) / 2) + 1;
         _loc2_.y = Math.ceil((param1.sceneConfig.height / SceneConfig.ZONE_HEIGHT - 1) / 2) + 1;
         return _loc2_;
      }
      
      public static function getViewAvatarRangeXY(param1:Scene) : Point
      {
         var _loc2_:Point = new Point();
         _loc2_.x = Math.ceil((param1.sceneConfig.width / SceneAvatarLayer.MAX_AVATARBD_WIDTH - 1) / 2) + 1;
         _loc2_.y = Math.ceil((param1.sceneConfig.height / SceneAvatarLayer.MAX_AVATARBD_HEIGHT - 1) / 2) + 1;
         return _loc2_;
      }
      
      public static function findViewZonePoints(param1:Point, param2:int, param3:int) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:Array = [];
         if(param2 < 0 || param3 < 0)
         {
            return [param1];
         }
         var _loc7_:int = param1.x - param2;
         var _loc8_:int = param1.x + param2;
         var _loc9_:int = param1.y - param3;
         var _loc10_:int = param1.y + param3;
         _loc5_ = _loc7_;
         while(_loc5_ <= _loc8_)
         {
            _loc6_ = _loc9_;
            while(_loc6_ <= _loc10_)
            {
               _loc4_.push(new Point(_loc5_,_loc6_));
               _loc6_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function getMapTile(param1:int, param2:int) : MapTile
      {
         var _loc4_:MapConfig = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:MapTile = null;
         var _loc3_:MapTile = SceneCache.mapTiles[param1 + "_" + param2] as MapTile;
         if(_loc3_ == null)
         {
            _loc4_ = Scene.scene.mapConfig;
            if((Boolean(_loc4_)) && _loc4_.unbounded)
            {
               if((_loc4_.unbounded_left || param1 >= 0) && (_loc4_.unbounded_right || param1 < _loc4_.mapGridX) && (_loc4_.unbounded_top || param2 >= 0) && (_loc4_.unbounded_bottom || param2 < _loc4_.mapGridY))
               {
                  _loc5_ = (param1 % _loc4_.mapGridX + _loc4_.mapGridX) % _loc4_.mapGridX;
                  _loc6_ = (param2 % _loc4_.mapGridY + _loc4_.mapGridY) % _loc4_.mapGridY;
                  _loc7_ = SceneCache.mapTiles[_loc5_ + "_" + _loc6_] as MapTile;
                  if(_loc7_ != null)
                  {
                     _loc3_ = _loc7_.clone();
                     _loc3_.tile_x = param1;
                     _loc3_.tile_y = param2;
                     SceneCache.mapTiles[param1 + "_" + param2] = _loc3_;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public static function getMapZone(param1:int, param2:int) : MapZone
      {
         var _loc4_:MapConfig = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:MapZone = null;
         var _loc3_:MapZone = SceneCache.mapZones[param1 + "_" + param2] as MapZone;
         if(_loc3_ == null)
         {
            _loc4_ = Scene.scene.mapConfig;
            if((Boolean(_loc4_)) && _loc4_.unbounded)
            {
               _loc5_ = _loc4_.mapGridX / SceneConfig.ZONE_SCALE;
               _loc6_ = _loc4_.mapGridY / SceneConfig.ZONE_SCALE;
               if((_loc4_.unbounded_left || param1 >= 0) && (_loc4_.unbounded_right || param1 < _loc5_) && (_loc4_.unbounded_top || param2 >= 0) && (_loc4_.unbounded_bottom || param2 < _loc6_))
               {
                  _loc7_ = (param1 % _loc5_ + _loc5_) % _loc5_;
                  _loc8_ = (param2 % _loc6_ + _loc6_) % _loc6_;
                  _loc9_ = SceneCache.mapZones[_loc7_ + "_" + _loc8_] as MapZone;
                  if(_loc9_ != null)
                  {
                     _loc3_ = new MapZone(Scene.scene.sceneMapLayer);
                     _loc3_.tile_width = SceneConfig.ZONE_WIDTH;
                     _loc3_.tile_height = SceneConfig.ZONE_HEIGHT;
                     _loc3_.tile_x = param1;
                     _loc3_.tile_y = param2;
                     _loc3_.showContainer.x = _loc3_.piexl_x;
                     _loc3_.showContainer.y = _loc3_.piexl_y;
                     SceneCache.mapZones[param1 + "_" + param2] = _loc3_;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public static function isSolid(param1:int, param2:int) : Boolean
      {
         var _loc3_:MapTile = getMapTile(param1,param2);
         if(_loc3_ == null || _loc3_.isSolid)
         {
            return true;
         }
         return false;
      }
      
      public static function isIsland(param1:int, param2:int) : Boolean
      {
         var _loc3_:MapTile = getMapTile(param1,param2);
         if(_loc3_ != null && _loc3_.isIsland)
         {
            return true;
         }
         return false;
      }
      
      public static function isMask(param1:int, param2:int) : Boolean
      {
         var _loc3_:MapTile = getMapTile(param1,param2);
         if(_loc3_ != null && _loc3_.isMask)
         {
            return true;
         }
         return false;
      }
      
      public static function hasSolidBetween2MapTile(param1:MapTile, param2:MapTile) : Boolean
      {
         var _loc12_:MapTile = null;
         var _loc3_:Point = new Point(param1.piexl_x,param1.piexl_y);
         var _loc4_:Point = new Point(param2.piexl_x,param2.piexl_y);
         var _loc5_:Number = ZMath.getTowPointsAngle(_loc3_,_loc4_);
         var _loc6_:Number = _loc5_ * Math.PI / 180;
         var _loc7_:Number = Math.cos(_loc6_);
         var _loc8_:Number = Math.sin(_loc6_);
         var _loc9_:Number = Point.distance(_loc3_,_loc4_);
         var _loc10_:Point = new Point();
         _loc10_.x = _loc4_.x;
         _loc10_.y = _loc4_.y;
         var _loc11_:BaseElement = new BaseElement();
         _loc11_.piexl_x = _loc10_.x;
         _loc11_.piexl_y = _loc10_.y;
         while(!(Math.abs(param1.tile_x - _loc11_.tile_x) <= 1 && Math.abs(param1.tile_y - _loc11_.tile_y) <= 1))
         {
            _loc12_ = SceneUtil.getMapTile(_loc11_.tile_x,_loc11_.tile_y);
            if(_loc12_.isSolid)
            {
               return true;
            }
            _loc11_.piexl_x -= SceneConfig.TILE_WIDTH * _loc7_;
            _loc11_.piexl_y -= SceneConfig.TILE_HEIGHT * _loc8_;
         }
         return false;
      }
      
      public static function getLineMapTile(param1:MapTile, param2:MapTile, param3:Number = 0) : MapTile
      {
         var _loc13_:MapTile = null;
         var _loc4_:Point = new Point(param1.piexl_x,param1.piexl_y);
         var _loc5_:Point = new Point(param2.piexl_x,param2.piexl_y);
         var _loc6_:Number = ZMath.getTowPointsAngle(_loc4_,_loc5_);
         var _loc7_:Number = _loc6_ * Math.PI / 180;
         var _loc8_:Number = Math.cos(_loc7_);
         var _loc9_:Number = Math.sin(_loc7_);
         var _loc10_:Number = Point.distance(_loc4_,_loc5_);
         var _loc11_:Point = new Point();
         if(param3 > 0 && param3 < _loc10_)
         {
            _loc11_.x = param1.piexl_x + param3 * _loc8_;
            _loc11_.y = param1.piexl_y + param3 * _loc9_;
         }
         else
         {
            _loc11_.x = _loc5_.x;
            _loc11_.y = _loc5_.y;
         }
         var _loc12_:BaseElement = new BaseElement();
         _loc12_.piexl_x = _loc11_.x;
         _loc12_.piexl_y = _loc11_.y;
         while((param1.tile_x - _loc12_.tile_x) * (param1.tile_x - _loc12_.tile_x) + (param1.tile_y - _loc12_.tile_y) * (param1.tile_y - _loc12_.tile_y) >= 2)
         {
            _loc13_ = SceneUtil.getMapTile(_loc12_.tile_x,_loc12_.tile_y);
            if(!_loc13_.isSolid)
            {
               return _loc13_;
            }
            _loc12_.piexl_x -= SceneConfig.TILE_WIDTH * _loc8_;
            _loc12_.piexl_y -= SceneConfig.TILE_HEIGHT * _loc9_;
         }
         return param1;
      }
      
      public static function getRoundMapTile(param1:MapTile, param2:MapTile) : MapTile
      {
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:MapTile = null;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         if(!param2.isSolid)
         {
            return param2;
         }
         var _loc3_:Point = new Point(param2.piexl_x,param2.piexl_y);
         var _loc4_:Point = new Point(param2.tile_x,param2.tile_y);
         var _loc5_:Point = new Point(_loc4_.x,_loc4_.x);
         var _loc6_:Point = new Point(_loc4_.y,_loc4_.y);
         loop0:
         while(true)
         {
            --_loc5_.x;
            _loc5_.y += 1;
            --_loc6_.x;
            _loc6_.y += 1;
            _loc11_ = [];
            _loc10_ = _loc5_.x;
            while(_loc10_ <= _loc5_.y)
            {
               _loc11_.push(new Point(_loc10_,_loc6_.x),new Point(_loc10_,_loc6_.y));
               _loc10_++;
            }
            _loc10_ = _loc6_.x + 1;
            while(_loc10_ < _loc6_.y - 1)
            {
               _loc11_.push(new Point(_loc5_.x,_loc10_),new Point(_loc5_.y,_loc10_));
               _loc10_++;
            }
            _loc12_ = int(_loc11_.length);
            _loc10_ = 0;
            while(_loc10_ < _loc12_)
            {
               _loc7_ = _loc11_[_loc10_];
               _loc8_ = Transformer.transTilePoint2PixelPoint(_loc7_);
               if(param1 == null || param1.tile_x == _loc7_.x && param1.tile_y == _loc7_.y)
               {
                  break loop0;
               }
               _loc9_ = SceneUtil.getMapTile(_loc7_.x,_loc7_.y);
               if(_loc9_ != null)
               {
                  if(!_loc9_.isSolid)
                  {
                     return _loc9_;
                     break;
                  }
               }
               _loc10_++;
            }
         }
         return param1;
      }
      
      public static function getRoundMapTile2(param1:MapTile, param2:Number = 0) : MapTile
      {
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:MapTile = null;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         if(!param1.isSolid)
         {
            return param1;
         }
         var _loc3_:Point = new Point(param1.piexl_x,param1.piexl_y);
         var _loc4_:Point = new Point(param1.tile_x,param1.tile_y);
         var _loc5_:Point = new Point(_loc4_.x,_loc4_.x);
         var _loc6_:Point = new Point(_loc4_.y,_loc4_.y);
         loop0:
         while(true)
         {
            --_loc5_.x;
            _loc5_.y += 1;
            --_loc6_.x;
            _loc6_.y += 1;
            _loc11_ = [];
            _loc10_ = _loc5_.x;
            while(_loc10_ <= _loc5_.y)
            {
               _loc11_.push(new Point(_loc10_,_loc6_.x),new Point(_loc10_,_loc6_.y));
               _loc10_++;
            }
            _loc10_ = _loc6_.x + 1;
            while(_loc10_ < _loc6_.y - 1)
            {
               _loc11_.push(new Point(_loc5_.x,_loc10_),new Point(_loc5_.y,_loc10_));
               _loc10_++;
            }
            _loc12_ = int(_loc11_.length);
            _loc10_ = 0;
            while(_loc10_ < _loc12_)
            {
               _loc7_ = _loc11_[_loc10_];
               _loc8_ = Transformer.transTilePoint2PixelPoint(_loc7_);
               if(Point.distance(_loc3_,_loc8_) >= param2)
               {
                  break loop0;
               }
               _loc9_ = SceneUtil.getMapTile(_loc7_.x,_loc7_.y);
               if(_loc9_ != null)
               {
                  if(!_loc9_.isSolid)
                  {
                     return _loc9_;
                     break;
                  }
               }
               _loc10_++;
            }
         }
         return null;
      }
   }
}

