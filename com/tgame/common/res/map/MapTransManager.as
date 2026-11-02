package com.tgame.common.res.map
{
   import com.zcp.engine.Engine;
   
   public class MapTransManager
   {
      
      private static var mapResContainer:Object = new Object();
      
      public function MapTransManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc4_:XML = null;
         var _loc5_:MapRes = null;
         var _loc6_:int = 0;
         var _loc7_:XML = null;
         var _loc8_:TransOutRes = null;
         var _loc9_:String = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_.scene)
         {
            _loc5_ = new MapRes();
            _loc5_.id = _loc4_.@id;
            _loc5_.name = _loc4_.@name;
            _loc6_ = int(_loc4_.@scale);
            _loc5_.scaleX = _loc6_ * 0.01;
            _loc5_.scaleY = _loc6_ * 0.01;
            _loc5_.name = _loc4_.@name;
            _loc5_.exercise_desc = _loc4_.@exercise_desc;
            _loc5_.isFuben = _loc4_.@isFuben;
            _loc5_.pathName = _loc4_.@pathName;
            _loc5_.bgSoundID = _loc4_.@bg_sound;
            _loc5_.allowPvp = String(_loc4_.@permit_pvp) == "1";
            _loc5_.allowJump = String(_loc4_.@permit_jump) == "1";
            _loc5_.allowMountRide = String(_loc4_.@permit_ride) == "1";
            _loc5_.allowMountShow = String(_loc4_.@permit_show) == "1";
            _loc5_.isClearPkProtect = String(_loc4_.@clear_pk_protect) == "1";
            for each(_loc7_ in _loc4_.transOut)
            {
               _loc8_ = new TransOutRes();
               _loc8_.id = _loc7_.@id;
               _loc8_.x = _loc7_.@x;
               _loc8_.y = _loc7_.@y;
               _loc8_.mapID = _loc7_.@targetSceneID;
               _loc8_.enable = parseInt(_loc7_.@enable) == 1;
               _loc8_.opened = _loc8_.enable;
               _loc9_ = _loc7_.@transPoint || "";
               if(_loc9_.length > 0 && _loc9_.indexOf(",") > -1)
               {
                  _loc8_.openId = _loc9_.split(",")[0];
                  _loc8_.closeId = _loc9_.split(",")[1];
               }
               _loc5_.transOutResArr.push(_loc8_);
               _loc3_.push([_loc5_.id,_loc8_.x,_loc8_.y]);
            }
            mapResContainer[_loc5_.id] = _loc5_;
         }
         Engine.initTransport(_loc3_);
      }
      
      public static function getMapRes(param1:int) : MapRes
      {
         return mapResContainer[param1];
      }
      
      public static function getTransOutResByID(param1:int, param2:int) : TransOutRes
      {
         var _loc4_:Array = null;
         var _loc5_:TransOutRes = null;
         var _loc3_:MapRes = getMapRes(param1);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.transOutResArr;
            for each(_loc5_ in _loc4_)
            {
               if(_loc5_.id == param2)
               {
                  return _loc5_;
               }
            }
         }
         return null;
      }
      
      public static function getTransOutResByXY(param1:int, param2:int, param3:int) : TransOutRes
      {
         var _loc5_:Array = null;
         var _loc6_:TransOutRes = null;
         var _loc4_:MapRes = getMapRes(param1);
         if(_loc4_ != null)
         {
            _loc5_ = _loc4_.transOutResArr;
            for each(_loc6_ in _loc5_)
            {
               if(_loc6_.x == param2 && _loc6_.y == param3)
               {
                  return _loc6_;
               }
            }
         }
         return null;
      }
      
      public static function getSceneNameBySceneId(param1:int) : String
      {
         var _loc2_:MapRes = getMapRes(param1);
         return _loc2_ ? _loc2_.name : "";
      }
      
      public static function getSceneIdBySceneName(param1:String) : int
      {
         var _loc2_:MapRes = null;
         var _loc3_:* = undefined;
         for(_loc3_ in mapResContainer)
         {
            _loc2_ = mapResContainer[_loc3_] as MapRes;
            if(Boolean(_loc2_) && _loc2_.name == param1)
            {
               return _loc3_;
            }
         }
         return -1;
      }
   }
}

