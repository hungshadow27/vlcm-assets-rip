package com.zcp.engine.helper
{
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_walk;
   import com.zcp.engine.move.Jump;
   import com.zcp.engine.move.PathConverter;
   import com.zcp.engine.move.PathCutter;
   import com.zcp.engine.move.Teleport;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.utils.Astar;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class MoveHelper
   {
      
      public function MoveHelper()
      {
         super();
      }
      
      public static function stopMove(param1:SceneCharacter, param2:Boolean = true, param3:Boolean = false) : void
      {
         param1.breakJump(false,param3);
         param1.moveData.clear();
         if(param1 == param1.scene.mainChar)
         {
            param1.scene.hideMouseChar();
         }
         if(param2 && (param1.getStatus() == CharStatusType.WALK || param1.getStatus() == CharStatusType.JUMP))
         {
            param1.setStatus(CharStatusType.STAND);
         }
      }
      
      public static function reviseMove(param1:SceneCharacter) : void
      {
         if(param1 == param1.scene.mainChar)
         {
            if(param1.avatar.status == CharStatusType.WALK)
            {
               if(param1.moveData.walk_targetP != null)
               {
                  walk(param1,param1.moveData.walk_targetP,-1,param1.moveData.walk_standDis,param1.moveData.walk_MoveCallBack);
               }
               else
               {
                  param1.moveData.clear();
               }
            }
            else if(param1.avatar.status == CharStatusType.JUMP)
            {
               param1.stopMove(true,true);
            }
         }
         else
         {
            param1.moveData.clear();
         }
      }
      
      public static function jump(param1:SceneCharacter, param2:Point, param3:Number = -1, param4:Number = -1, param5:MoveCallBack = null, param6:Boolean = false, param7:Boolean = false) : void
      {
         Jump.jump(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public static function breakJump(param1:SceneCharacter, param2:Boolean = false, param3:Boolean = false) : void
      {
         Jump.breakJump(param1,param2,param3);
      }
      
      public static function lineTo(param1:SceneCharacter, param2:Point, param3:Number, param4:Boolean = false, param5:MoveCallBack = null) : void
      {
         Teleport.lineTo(param1,param2,param3,param4,param5);
      }
      
      public static function lineToPiexl(param1:SceneCharacter, param2:Point, param3:Number, param4:Function = null) : void
      {
         Teleport.lineToPiexl(param1,param2,param3,param4);
      }
      
      public static function curveToPiexl(param1:SceneCharacter, param2:Point, param3:int, param4:int, param5:Function = null) : void
      {
         Teleport.curveToPiexl(param1,param2,param3,param4,param5);
      }
      
      public static function walk(param1:SceneCharacter, param2:Point, param3:Number = -1, param4:Number = 0, param5:MoveCallBack = null) : void
      {
         var _loc6_:SceneEvent = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc14_:Point = null;
         var _loc15_:Number = NaN;
         if(param1.isJumping())
         {
            return;
         }
         var _loc7_:MapTile = SceneUtil.getMapTile(param2.x,param2.y);
         if(_loc7_ == null)
         {
            if(param1.isMainChar())
            {
               param1.scene.hideMouseChar();
               _loc6_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.UNABLE,[param1,_loc7_]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc6_);
            }
            if(param5 != null && param5.onMoveUnable != null)
            {
               param5.onMoveUnable(param1,_loc7_);
            }
            return;
         }
         param1.moveData.clear();
         if(param1.tile_x == param2.x && param1.tile_y == param2.y)
         {
            if(param1 == param1.scene.mainChar)
            {
               param1.scene.hideMouseChar();
               _loc6_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.ARRIVED,[param1,_loc7_]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc6_);
            }
            if(param5 != null && param5.onMoveArrived != null)
            {
               param5.onMoveArrived(param1,_loc7_);
            }
            return;
         }
         var _loc8_:Point = new Point(_loc7_.piexl_x,_loc7_.piexl_y);
         if(param4 != 0)
         {
            _loc15_ = (param1.piexl_x - _loc7_.piexl_x) * (param1.piexl_x - _loc7_.piexl_x) + (param1.piexl_y - _loc7_.piexl_y) * (param1.piexl_y - _loc7_.piexl_y);
            if(_loc15_ <= param4 * param4)
            {
               param1.faceToTile(param2.x,param2.y);
               if(param1 == param1.scene.mainChar)
               {
                  param1.scene.hideMouseChar();
                  _loc7_ = SceneUtil.getMapTile(param1.tile_x,param1.tile_y);
                  _loc6_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.ARRIVED,[param1,_loc7_]);
                  EventDispatchCenter.getInstance().dispatchEvent(_loc6_);
               }
               if(param5 != null && param5.onMoveArrived != null)
               {
                  param5.onMoveArrived(param1,_loc7_);
               }
               return;
            }
         }
         var _loc9_:MapTile = SceneUtil.getMapTile(param1.tile_x,param1.tile_y);
         _loc7_ = SceneUtil.getRoundMapTile(_loc9_,_loc7_);
         if(_loc7_ == null)
         {
            param1.faceToTile(param2.x,param2.y);
            if(param1 == param1.scene.mainChar)
            {
               param1.scene.hideMouseChar();
               _loc6_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.UNABLE,[param1,_loc7_]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc6_);
            }
            if(param5 != null && param5.onMoveUnable != null)
            {
               param5.onMoveUnable(param1,_loc7_);
            }
            return;
         }
         var _loc10_:Boolean = _loc7_.isIsland;
         if(_loc10_)
         {
            _loc11_ = Astar.search(_loc7_.tile_x,_loc7_.tile_y,param1.tile_x,param1.tile_y);
         }
         else
         {
            _loc11_ = Astar.search(param1.tile_x,param1.tile_y,_loc7_.tile_x,_loc7_.tile_y);
         }
         if(_loc11_ == null || _loc11_.length < 2)
         {
            param1.faceToTile(param2.x,param2.y);
            if(param1 == param1.scene.mainChar)
            {
               param1.scene.hideMouseChar();
               _loc6_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.UNABLE,[param1,_loc7_]);
               EventDispatchCenter.getInstance().dispatchEvent(_loc6_);
            }
            if(param5 != null && param5.onMoveUnable != null)
            {
               param5.onMoveUnable(param1,_loc7_);
            }
            return;
         }
         if(!_loc10_)
         {
            _loc11_ = _loc11_.reverse();
         }
         var _loc13_:Array = _loc11_[_loc11_.length - 1];
         if(param4 != 0)
         {
            for each(_loc12_ in _loc11_)
            {
               _loc14_ = Transformer.transTilePoint2PixelPoint(new Point(_loc12_[0],_loc12_[1]));
               if((_loc14_.x - _loc8_.x) * (_loc14_.x - _loc8_.x) + (_loc14_.y - _loc8_.y) * (_loc14_.y - _loc8_.y) <= param4 * param4)
               {
                  _loc11_ = _loc11_.slice(0,_loc11_.indexOf(_loc12_) + 1);
                  break;
               }
            }
         }
         else
         {
            _loc12_ = _loc13_;
         }
         walk0(param1,_loc11_,param2,param3,param4,param5);
      }
      
      public static function walk0(param1:SceneCharacter, param2:Array, param3:Point = null, param4:Number = -1, param5:Number = 0, param6:MoveCallBack = null) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:SceneEvent = null;
         if(param2.length < 2)
         {
            return;
         }
         var _loc7_:Array = param2;
         param1.moveData.clear();
         if(param1 == param1.scene.mainChar)
         {
            if(param1.moveData.walk_pathCutter == null)
            {
               param1.moveData.walk_pathCutter = new PathCutter(param1);
            }
            param1.moveData.walk_pathCutter.cutMovePath(_loc7_);
            param1.moveData.walk_pathCutter.walkNext(-1,-1);
         }
         if(param4 >= 0)
         {
            param1.setSpeed(param4);
         }
         if(param3 != null)
         {
            param1.moveData.walk_targetP = param3;
         }
         else
         {
            _loc13_ = _loc7_[_loc7_.length - 1];
            param1.moveData.walk_targetP = new Point(_loc13_[0],_loc13_[1]);
         }
         param1.moveData.walk_standDis = param5;
         param1.moveData.walk_MoveCallBack = param6;
         var _loc10_:Array = _loc7_.shift();
         if(param1.tile_x != _loc10_[0])
         {
            param1.tile_x = _loc10_[0];
         }
         if(param1.tile_y != _loc10_[1])
         {
            param1.tile_y = _loc10_[1];
         }
         param1.moveData.walk_pathArr = _loc7_;
         var _loc11_:Array = _loc7_[_loc7_.length - 1];
         var _loc12_:MapTile = SceneUtil.getMapTile(_loc11_[0],_loc11_[1]);
         if(param1.isMainChar())
         {
            param1.scene.showMouseChar(_loc11_[0],_loc11_[1]);
            _loc14_ = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.READY,[param1,_loc12_,_loc7_]);
            EventDispatchCenter.getInstance().dispatchEvent(_loc14_);
         }
         if(param6 != null && param6.onMoveReady != null)
         {
            param6.onMoveReady(param1,_loc12_,SceneUtil.getMapTile(param1.moveData.walk_targetP.x,param1.moveData.walk_targetP.y));
         }
      }
      
      public static function walk1(param1:SceneCharacter, param2:ByteArray, param3:Point = null, param4:Number = -1, param5:Number = 0, param6:MoveCallBack = null) : void
      {
         var _loc7_:Array = PathConverter.convertToPoint(param2);
         walk0(param1,_loc7_,param3,param4,param5,param6);
      }
   }
}

