package com.zcp.engine.graphics.layers
{
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.utils.Fun;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.Scene;
   import com.zcp.engine.config.MapConfig;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.map.MapZone;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   
   public class SceneMapLayer extends Sprite
   {
      
      private static const MAX_ZONE_CACHE_X:int = 3;
      
      private static const MAX_ZONE_CACHE_Y:int = 2;
      
      private var _scene:Scene;
      
      private var _currentCameraPos:Point = new Point(int.MAX_VALUE,int.MAX_VALUE);
      
      private var _currentMapZone:MapZone;
      
      public var strongLoadMap:Boolean = false;
      
      private var loadMapHT:HandlerThread = new HandlerThread();
      
      private var _waitingLoadDatas:Object = {};
      
      public function SceneMapLayer(param1:Scene)
      {
         super();
         this._scene = param1;
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function dispose() : void
      {
         Fun.clearChildren(this,false,false);
         this._currentCameraPos = new Point(int.MAX_VALUE,int.MAX_VALUE);
         this._currentMapZone = null;
         this._waitingLoadDatas = {};
         this.strongLoadMap = false;
         this.loadMapHT.removeAllHandlers();
      }
      
      public function initMapZones() : void
      {
         var _loc1_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:MapZone = null;
         var _loc7_:Point = null;
         _loc1_ = {};
         var _loc4_:int = this._scene.mapConfig.mapGridX / SceneConfig.ZONE_SCALE;
         var _loc5_:int = this._scene.mapConfig.mapGridY / SceneConfig.ZONE_SCALE;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               _loc6_ = new MapZone(this);
               _loc6_.tile_width = SceneConfig.ZONE_WIDTH;
               _loc6_.tile_height = SceneConfig.ZONE_HEIGHT;
               _loc6_.tile_x = _loc2_;
               _loc6_.tile_y = _loc3_;
               _loc6_.showContainer.x = _loc6_.piexl_x;
               _loc6_.showContainer.y = _loc6_.piexl_y;
               _loc1_[_loc2_ + "_" + _loc3_] = _loc6_;
               _loc3_++;
            }
            _loc2_++;
         }
         SceneCache.mapZones = _loc1_;
      }
      
      public function run() : void
      {
         if(this._currentCameraPos.x == this._scene.sceneCamera.piexl_x && this._currentCameraPos.y == this._scene.sceneCamera.piexl_y)
         {
            return;
         }
         this._currentCameraPos.x = this._scene.sceneCamera.piexl_x;
         this._currentCameraPos.y = this._scene.sceneCamera.piexl_y;
         this.loadMap();
      }
      
      private function loadMap() : void
      {
         var _loc1_:MapZone = null;
         var _loc6_:Array = null;
         var _loc7_:LoadData = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Point = null;
         var _loc13_:String = null;
         var _loc14_:MapConfig = null;
         var _loc15_:Loader = null;
         var _loc2_:Object = {};
         var _loc3_:Point = Transformer.transPixelPoint2TilePoint(new Point(this._scene.sceneCamera.piexl_x,this._scene.sceneCamera.piexl_y));
         var _loc4_:Point = Transformer.transTilePoint2ZonePoint(_loc3_);
         var _loc5_:MapZone = SceneUtil.getMapZone(_loc4_.x,_loc4_.y);
         if(!_loc5_)
         {
            return;
         }
         if(this.strongLoadMap || this._currentMapZone != _loc5_)
         {
            this.strongLoadMap = false;
            _loc6_ = [];
            _loc9_ = SceneUtil.findViewZonePoints(new Point(_loc5_.tile_x,_loc5_.tile_y),this._scene.sceneCamera.zoneRangeXY.x,this._scene.sceneCamera.zoneRangeXY.y);
            _loc10_ = this._scene.mapConfig.mapGridX / SceneConfig.ZONE_SCALE;
            _loc11_ = this._scene.mapConfig.mapGridY / SceneConfig.ZONE_SCALE;
            for each(_loc12_ in _loc9_)
            {
               if(this._scene.mapConfig.unbounded)
               {
                  _loc14_ = this._scene.mapConfig;
                  if(!((_loc14_.unbounded_left || _loc12_.x >= 0) && (_loc14_.unbounded_right || _loc12_.x < _loc10_) && (_loc14_.unbounded_top || _loc12_.y >= 0) && (_loc14_.unbounded_bottom || _loc12_.y < _loc11_)))
                  {
                     continue;
                  }
               }
               else if(_loc12_.x < 0 || _loc12_.x >= _loc10_ || _loc12_.y < 0 || _loc12_.y >= _loc11_)
               {
                  continue;
               }
               _loc13_ = _loc12_.x + "_" + _loc12_.y;
               _loc1_ = SceneCache.currentMapZones[_loc13_];
               if(_loc1_ == null)
               {
                  _loc1_ = SceneUtil.getMapZone(_loc12_.x,_loc12_.y);
                  _loc2_[_loc13_] = _loc1_;
               }
               else
               {
                  _loc2_[_loc13_] = _loc1_;
                  SceneCache.currentMapZones[_loc13_] = null;
                  delete SceneCache.currentMapZones[_loc13_];
               }
               if(this._waitingLoadDatas[_loc13_] == null)
               {
                  _loc8_ = -Math.round(ZMath.getDistanceSquare(_loc1_.piexl_x,_loc1_.piexl_y,_loc5_.piexl_x,_loc5_.piexl_y));
                  _loc7_ = this.addMapZone(_loc1_,_loc8_);
                  if(_loc7_)
                  {
                     _loc6_.push(_loc7_);
                     this._waitingLoadDatas[_loc13_] = _loc7_;
                  }
               }
            }
            if(_loc6_.length > 0)
            {
               _loc6_.sortOn(["priority"],[Array.NUMERIC | Array.DESCENDING]);
               for each(_loc7_ in _loc6_)
               {
                  _loc15_ = _loc7_.userData.loadInfo.loader;
                  _loc15_.contentLoaderInfo.addEventListener(Event.COMPLETE,_loc7_.onComplete);
                  _loc15_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,_loc7_.onError);
                  _loc15_.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,_loc7_.onError);
                  this.loadMapHT.push(_loc15_.load,[new URLRequest(_loc7_.url)],10);
               }
            }
            for(_loc13_ in SceneCache.currentMapZones)
            {
               _loc1_ = SceneCache.currentMapZones[_loc13_];
               if(this.contains(_loc1_.showContainer))
               {
                  this.removeChild(_loc1_.showContainer);
               }
               if(Math.abs(_loc1_.tile_x - _loc5_.tile_x) > this._scene.sceneCamera.zoneRangeXY.x + MAX_ZONE_CACHE_X || Math.abs(_loc1_.tile_y - _loc5_.tile_y) > this._scene.sceneCamera.zoneRangeXY.y + MAX_ZONE_CACHE_Y)
               {
                  SceneCache.mapImgCache.remove(_loc13_);
               }
               else
               {
                  _loc2_[_loc13_] = _loc1_;
               }
            }
            SceneCache.currentMapZones = _loc2_;
            this._currentMapZone = _loc5_;
         }
      }
      
      private function addMapZone(param1:MapZone, param2:int) : LoadData
      {
         var itemLoadComplete:Function;
         var itemLoadError:Function;
         var loadData:LoadData = null;
         var key:String = null;
         var bmpKey:String = null;
         var mcf:MapConfig = null;
         var filePath:String = null;
         var xS:int = 0;
         var yS:int = 0;
         var tx:int = 0;
         var ty:int = 0;
         var $mapZone:MapZone = param1;
         var $priority:int = param2;
         if($mapZone.showContainer.numChildren == 0)
         {
            key = $mapZone.tile_x + "_" + $mapZone.tile_y;
            if(SceneCache.mapImgCache.has(key))
            {
               $mapZone.showContainer.addChild(SceneCache.mapImgCache.get(key) as Bitmap);
            }
            else
            {
               itemLoadComplete = function(param1:Event):void
               {
                  SceneCache.mapImgCache.push(param1.target.content,key);
                  $mapZone.showContainer.addChild(param1.target.content);
                  _waitingLoadDatas[key] = null;
                  delete _waitingLoadDatas[key];
               };
               itemLoadError = function(param1:*):void
               {
                  ++loadData.userData.loadInfo.retry;
                  if(loadData.userData.loadInfo.retry > 3)
                  {
                     ZLog.add("######尝试加载地图" + filePath + "3次均失败，已经放弃加载");
                     _waitingLoadDatas[key] = null;
                     delete _waitingLoadDatas[key];
                  }
                  else
                  {
                     loadData.userData.loadInfo.loader.load(new URLRequest(filePath));
                  }
               };
               bmpKey = key;
               mcf = Scene.scene.mapConfig;
               if(mcf.unbounded)
               {
                  xS = mcf.mapGridX / SceneConfig.ZONE_SCALE;
                  yS = mcf.mapGridY / SceneConfig.ZONE_SCALE;
                  tx = ($mapZone.tile_x % xS + xS) % xS;
                  ty = ($mapZone.tile_y % yS + yS) % yS;
                  bmpKey = tx + "_" + ty;
               }
               filePath = this._scene.mapConfig.zoneMapDir + bmpKey + ".jpg";
               loadData = new LoadData(filePath,itemLoadComplete,null,itemLoadError,"",filePath,$priority);
               loadData.userData.loadInfo = {
                  "loader":new Loader(),
                  "retry":0
               };
            }
         }
         if($mapZone.showContainer.parent != this)
         {
            this.addChild($mapZone.showContainer);
         }
         return loadData;
      }
   }
}

