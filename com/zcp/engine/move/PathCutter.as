package com.zcp.engine.move
{
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_walk;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class PathCutter
   {
      
      public var sceneCharacter:SceneCharacter;
      
      private var sourcePath:Array;
      
      private var movePaths:Array;
      
      private var currentMovetag:int = 0;
      
      public function PathCutter(param1:SceneCharacter)
      {
         super();
         this.sceneCharacter = param1;
      }
      
      public function clear() : void
      {
         this.sourcePath = null;
         this.movePaths = null;
         this.currentMovetag = 0;
      }
      
      public function walkNext(param1:int, param2:int) : void
      {
         if(this.movePaths == null || this.movePaths.length == 0)
         {
            return;
         }
         var _loc3_:Array = this.movePaths[this.currentMovetag];
         if(_loc3_[_loc3_.length - 1][0] == param1 && _loc3_[_loc3_.length - 1][1] == param2)
         {
            ++this.currentMovetag;
            _loc3_ = this.movePaths[this.currentMovetag];
            if(_loc3_ == null || _loc3_.length == 1)
            {
               return;
            }
            this.sendPathMsg(_loc3_);
         }
         else if(param1 == -1 && param2 == -1)
         {
            if(_loc3_.length == 1)
            {
               this.sendPathMsg(_loc3_);
            }
            else
            {
               this.sendPathMsg(_loc3_);
            }
         }
      }
      
      public function cutMovePath(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(param1.length < 1)
         {
            return;
         }
         this.movePaths = [];
         this.currentMovetag = 0;
         this.sourcePath = param1;
         var _loc3_:int = int(this.sourcePath.length);
         var _loc4_:int = 5;
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc5_[_loc5_.length] = [this.sourcePath[_loc2_][0],this.sourcePath[_loc2_][1]];
            if(_loc2_ != 0 && _loc2_ % 5 == 0 || _loc2_ == _loc3_ - 1)
            {
               if(this.movePaths.length != 0)
               {
                  _loc5_.splice(0,0,[_loc6_[0],_loc6_[1]]);
               }
               _loc6_ = [this.sourcePath[_loc2_][0],this.sourcePath[_loc2_][1]];
               this.movePaths[this.movePaths.length] = _loc5_;
               _loc5_ = [];
            }
            _loc2_++;
         }
      }
      
      public function sendPathMsg(param1:Array) : void
      {
         if(param1.length < 2)
         {
            return;
         }
         var _loc2_:ByteArray = PathConverter.convertToVector(param1);
         var _loc3_:SceneEvent = new SceneEvent(SceneEvent.WALK,SceneEventAction_walk.SEND_PATH,[this.sceneCharacter,_loc2_]);
         EventDispatchCenter.getInstance().dispatchEvent(_loc3_);
      }
      
      private function convertPath(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         _loc2_[_loc2_.length] = [param1[0][0],param1[0][1]];
         var _loc4_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_[_loc2_.length] = this.getVectorBy2Point(new Point(param1[_loc3_][0],param1[_loc3_][0]),new Point(param1[_loc3_ + 1][0],param1[_loc3_ + 1][0]));
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getVectorBy2Point(param1:Point, param2:Point) : int
      {
         var _loc3_:int = param2.x - param1.x;
         var _loc4_:int = param2.y - param1.y;
         if(_loc3_ == 0 && _loc4_ == 1)
         {
            return 0;
         }
         if(_loc3_ == -1 && _loc4_ == 1)
         {
            return 1;
         }
         if(_loc3_ == -1 && _loc4_ == 0)
         {
            return 2;
         }
         if(_loc3_ == -1 && _loc4_ == -1)
         {
            return 3;
         }
         if(_loc3_ == 0 && _loc4_ == -1)
         {
            return 4;
         }
         if(_loc3_ == 1 && _loc4_ == -1)
         {
            return 5;
         }
         if(_loc3_ == 1 && _loc4_ == 0)
         {
            return 6;
         }
         if(_loc3_ == 1 && _loc4_ == 1)
         {
            return 7;
         }
         return -1;
      }
   }
}

