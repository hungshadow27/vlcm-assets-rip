package com.zcp.engine.loader
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.zcp.common.codemix.ZZip;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.Scene;
   import com.zcp.engine.config.GlobalConfig;
   import com.zcp.engine.config.MapConfig;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_process;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.tools.SceneLoader;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.events.Event;
   
   public class MapLoader
   {
      
      public function MapLoader()
      {
         super();
      }
      
      public static function loadMapConfig(param1:int, param2:String, param3:Scene, param4:Function = null, param5:Function = null) : void
      {
         var loadData:LoadData;
         var newOnComplete:Function = null;
         var $mapID:int = param1;
         var $mapConfigUrl:String = param2;
         var $scene:Scene = param3;
         var $onComplete:Function = param4;
         var $onUpdate:Function = param5;
         newOnComplete = function(param1:Event):void
         {
            var _loc2_:* = undefined;
            var _loc4_:XML = null;
            var _loc9_:String = null;
            var _loc10_:Object = null;
            var _loc11_:int = 0;
            var _loc12_:int = 0;
            if(param1.target is LoadingItem)
            {
               _loc2_ = param1.target.content;
            }
            else
            {
               _loc2_ = param1.target.data;
            }
            if(GlobalConfig.decode != null)
            {
               _loc2_ = ZZip.extractFristTextFileContent(_loc2_,GlobalConfig.decode);
               if(_loc2_ == "")
               {
                  return;
               }
            }
            var _loc3_:XML = XML(_loc2_);
            var _loc5_:MapConfig = new MapConfig();
            _loc5_.mapID = $mapID;
            _loc5_.unbounded_top = String(_loc3_.head.@unbounded_top) == "1";
            _loc5_.unbounded_bottom = String(_loc3_.head.@unbounded_bottom) == "1";
            _loc5_.unbounded_left = String(_loc3_.head.@unbounded_left) == "1";
            _loc5_.unbounded_right = String(_loc3_.head.@unbounded_right) == "1";
            _loc5_.unbounded = _loc5_.unbounded_top || _loc5_.unbounded_bottom || _loc5_.unbounded_left || _loc5_.unbounded_right;
            _loc5_.mapGridX = _loc3_.head.grids.@grid_h;
            _loc5_.mapGridY = _loc3_.head.grids.@grid_v;
            _loc5_.width = _loc5_.mapGridX * SceneConfig.TILE_WIDTH;
            _loc5_.height = _loc5_.mapGridY * SceneConfig.TILE_HEIGHT;
            _loc5_.zoneMapDir = GlobalConfig.getZoneMapFolder($mapConfigUrl);
            _loc5_.smallMapUrl = GlobalConfig.getSmallMapPath($mapConfigUrl);
            if(_loc3_.movies != undefined && _loc3_.movies.movie != undefined)
            {
               for each(_loc4_ in _loc3_.movies.movie)
               {
                  _loc9_ = GlobalConfig.getAvatarMapSlipcoverPath(int(_loc4_.@id));
                  _loc10_ = {
                     "piexl_x":Number(_loc4_.@x),
                     "piexl_y":Number(_loc4_.@y),
                     "sourcePath":_loc9_
                  };
                  if(_loc5_.slipcovers == null)
                  {
                     _loc5_.slipcovers = [_loc10_];
                  }
                  else
                  {
                     _loc5_.slipcovers.push(_loc10_);
                  }
               }
            }
            var _loc6_:Object = SceneCache.transports;
            var _loc7_:int = _loc5_.mapID;
            var _loc8_:Object = {};
            for each(_loc4_ in _loc3_.tiles.tile)
            {
               _loc11_ = int(_loc4_.@x);
               _loc12_ = int(_loc4_.@y);
               _loc8_[_loc11_ + "_" + _loc12_] = new MapTile(_loc11_,_loc12_,_loc4_.@s == "1",_loc4_.@s == "2",_loc4_.@m == "1",_loc6_[_loc7_ + "_" + _loc11_ + "_" + _loc12_] != undefined,_loc4_.@w == "1");
            }
            if($onComplete != null)
            {
               $onComplete(_loc5_,_loc8_);
            }
         };
         SceneLoader.smallMapImgLoader.pauseAll();
         SceneLoader.smallMapImgLoader.removeAll();
         loadData = new LoadData(GlobalConfig.getMapConfigPath($mapConfigUrl),newOnComplete,$onUpdate);
         LoaderManager.load([loadData],SceneLoader.smallMapImgLoader);
      }
      
      public static function loadSmallMap(param1:Scene) : void
      {
         var loadSmallMapComplete:Function = null;
         var $scene:Scene = param1;
         loadSmallMapComplete = function(param1:Event):void
         {
            var _loc5_:SceneEvent = null;
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            var _loc3_:* = _loc2_.content;
            var _loc4_:Bitmap = _loc3_ as Bitmap;
            if(_loc4_)
            {
               _loc4_.width = $scene.mapConfig.width;
               _loc4_.height = $scene.mapConfig.height;
               $scene.sceneSmallMapLayer.addChild(_loc4_);
               _loc5_ = new SceneEvent(SceneEvent.PROCESS,SceneEventAction_process.LOAD_SMALL_MAP_COMPLETE,_loc4_.bitmapData);
               EventDispatchCenter.getInstance().dispatchEvent(_loc5_);
            }
         };
         Fun.clearChildren($scene.sceneSmallMapLayer,true);
         SceneLoader.smallMapImgLoader.pauseAll();
         SceneLoader.smallMapImgLoader.removeAll();
         LoaderManager.lazyLoad(loadSmallMapComplete,SceneLoader.smallMapImgLoader,false,$scene.mapConfig.smallMapUrl);
      }
   }
}

