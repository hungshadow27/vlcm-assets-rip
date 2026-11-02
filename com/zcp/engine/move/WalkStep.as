package com.zcp.engine.move
{
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.config.GlobalConfig;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_walk;
   import com.zcp.engine.staticdata.CharAngleType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveData;
   import flash.geom.Point;
   
   public class WalkStep
   {
      
      private static const floor:Function = Math.floor;
      
      private static const sin:Function = Math.sin;
      
      private static const cos:Function = Math.cos;
      
      private static const sqrt:Function = Math.sqrt;
      
      private static const abs:Function = Math.abs;
      
      private static const WALK:String = CharStatusType.WALK;
      
      private static const STAND:String = CharStatusType.STAND;
      
      private static const DEATH:String = CharStatusType.DEATH;
      
      private static const TILE_WIDTH:Number = SceneConfig.TILE_WIDTH;
      
      private static const TILE_HEIGHT:Number = SceneConfig.TILE_HEIGHT;
      
      private static const MAX_DIS:Number = sqrt(TILE_WIDTH * TILE_WIDTH + TILE_HEIGHT + TILE_HEIGHT);
      
      private static const TO_RAD:Number = Math.PI / 180;
      
      public function WalkStep()
      {
         super();
      }
      
      public static function step(param1:SceneCharacter) : void
      {
         var _loc3_:SceneEvent = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:MapTile = null;
         if(param1.getStatus() == DEATH)
         {
            if(param1 == param1.scene.mainChar)
            {
               param1.scene.hideMouseChar();
            }
            param1.moveData.clear();
            return;
         }
         var _loc2_:MoveData = param1.moveData;
         if(_loc2_.walk_pathArr == null || _loc2_.walk_pathArr.length == 0)
         {
            if(param1.getStatus() == WALK && param1.type != SceneCharacterType.MOUNT && param1.type != SceneCharacterType.NPC_FRIEND)
            {
               param1.playTo(STAND);
            }
            return;
         }
         var _loc4_:Number = _loc2_.walk_speed / GlobalConfig.frameRate;
         var _loc5_:int = SceneRender.nowTime;
         if(_loc2_.walk_lastTime != _loc5_)
         {
            _loc12_ = _loc2_.walk_lastTime;
            _loc2_.walk_lastTime = _loc5_;
            if(_loc12_ != 0)
            {
               _loc13_ = (_loc5_ - _loc12_) / GlobalConfig.setpTime;
               _loc4_ *= _loc13_;
            }
         }
         var _loc6_:Object = stepDistance(param1,_loc4_);
         var _loc7_:Point = _loc6_.standPiexl;
         var _loc8_:Array = _loc6_.throughTileArr;
         var _loc9_:Number = ZMath.getTowPointsAngle(new Point(param1.piexl_x,param1.piexl_y),_loc7_);
         var _loc10_:Number = ZMath.getNearAngel(_loc9_ - 90);
         param1.playTo(WALK,CharAngleType["ANGEL_" + _loc10_]);
         param1.setXY(_loc7_.x,_loc7_.y);
         for each(_loc11_ in _loc8_)
         {
            if(param1 == param1.scene.mainChar)
            {
               _loc2_.walk_pathCutter.walkNext(_loc11_[0],_loc11_[1]);
               _loc3_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.THROUGH,[param1,SceneUtil.getMapTile(_loc11_[0],_loc11_[1])]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
            }
            if(_loc2_.walk_MoveCallBack != null && _loc2_.walk_MoveCallBack.onMoveThrough != null)
            {
               _loc2_.walk_MoveCallBack.onMoveThrough(param1,SceneUtil.getMapTile(_loc11_[0],_loc11_[1]));
            }
         }
         if(_loc2_.walk_pathArr == null)
         {
            return;
         }
         if(_loc2_.walk_pathArr.length == 0)
         {
            param1.playTo(STAND);
            param1.faceToTile(_loc2_.walk_targetP.x,_loc2_.walk_targetP.y);
            if(param1 == param1.scene.mainChar)
            {
               _loc14_ = SceneUtil.getMapTile(param1.tile_x,param1.tile_y);
               param1.scene.hideMouseChar();
               _loc3_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.ARRIVED,[param1,_loc14_]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
               if(_loc14_.isTransport)
               {
                  _loc3_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.ON_TRANSPORT,[param1,_loc14_]);
                  EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
               }
            }
            if(_loc2_.walk_MoveCallBack != null && _loc2_.walk_MoveCallBack.onMoveArrived != null)
            {
               _loc2_.walk_MoveCallBack.onMoveArrived(param1,SceneUtil.getMapTile(param1.tile_x,param1.tile_y));
            }
            _loc2_.clear();
         }
      }
      
      private static function stepDistance(param1:SceneCharacter, param2:Number) : Object
      {
         var _loc7_:Number = NaN;
         var _loc9_:Array = null;
         var _loc10_:Point = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Array = null;
         var _loc3_:Object = {
            "standPiexl":new Point(param1.piexl_x,param1.piexl_y),
            "throughTileArr":[]
         };
         var _loc4_:MoveData = param1.moveData;
         var _loc5_:Point = _loc3_.standPiexl;
         var _loc6_:Number = param2;
         var _loc8_:Array = _loc3_.throughTileArr;
         while(true)
         {
            _loc9_ = _loc4_.walk_pathArr[0];
            _loc10_ = new Point(_loc9_[0] * 25,_loc9_[1] * 25);
            _loc11_ = Point.distance(_loc5_,_loc10_);
            if(_loc11_ > _loc6_)
            {
               break;
            }
            if(_loc11_ == _loc6_)
            {
               _loc7_ = _loc6_;
               _loc13_ = _loc4_.walk_pathArr.shift();
               _loc8_.push(_loc13_);
               _loc6_ -= _loc7_;
               _loc5_.x = _loc13_[0] * 25;
               _loc5_.y = _loc13_[1] * 25;
               return _loc3_;
            }
            _loc7_ = _loc11_;
            _loc13_ = _loc4_.walk_pathArr.shift();
            _loc8_.push(_loc13_);
            _loc6_ -= _loc7_;
            _loc5_.x = _loc13_[0] * 25;
            _loc5_.y = _loc13_[1] * 25;
            if(_loc4_.walk_pathArr.length == 0)
            {
               return _loc3_;
            }
         }
         _loc7_ = _loc6_;
         _loc6_ -= _loc7_;
         _loc12_ = ZMath.getTowPointsAngle(_loc5_,_loc10_) * TO_RAD;
         _loc5_.x += _loc7_ * cos(_loc12_);
         _loc5_.y += _loc7_ * sin(_loc12_);
         return _loc3_;
      }
   }
}

