package com.zcp.engine.utils
{
   public class Astar
   {
      
      private static var ro:Object = {
         "r1":[-1,-1],
         "r2":[0,-1],
         "r3":[1,-1],
         "r4":[1,0],
         "r5":[1,1],
         "r6":[0,1],
         "r7":[-1,1],
         "r8":[-1,0]
      };
      
      public function Astar()
      {
         super();
      }
      
      public static function search(param1:int, param2:int, param3:int, param4:int, param5:int = -1) : Array
      {
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Object = null;
         var _loc21_:int = 0;
         if(param1 == param3 && param2 == param4)
         {
            return null;
         }
         if(SceneUtil.isSolid(param1,param2))
         {
            return null;
         }
         if(SceneUtil.isSolid(param3,param4))
         {
            return null;
         }
         var _loc6_:Array = new Array();
         var _loc7_:Array = new Array();
         var _loc8_:Array = new Array();
         var _loc9_:Object = new Object();
         _loc9_.x = param1;
         _loc9_.y = param2;
         _loc9_.g = 0;
         var _loc10_:int = param1 - param3 < 0 ? int((param1 - param3) * -1) : int(param1 - param3);
         var _loc11_:int = param2 - param4 < 0 ? int((param2 - param4) * -1) : int(param2 - param4);
         _loc9_.h = (_loc10_ + _loc11_) * 10;
         _loc9_.f = _loc9_.g + _loc9_.h;
         _loc9_.parentPoint = 0;
         var _loc12_:* = 0;
         updatePoint(_loc7_,_loc9_,_loc12_++);
         _loc7_[_loc9_.x + "_" + _loc9_.y] = _loc9_;
         var _loc13_:int = 0;
         while(true)
         {
            _loc13_++;
            if(param5 > 0)
            {
               if(_loc13_ > param5)
               {
                  break;
               }
            }
            if(_loc7_.length == 0)
            {
               return null;
            }
            _loc14_ = delPoint(_loc7_,_loc12_--);
            _loc8_.push(_loc14_);
            _loc8_[_loc14_.x + "_" + _loc14_.y] = _loc14_;
            if(_loc14_.x == param3 && _loc14_.y == param4)
            {
               _loc15_ = _loc14_;
               _loc6_.push([_loc15_.x,_loc15_.y]);
               while(_loc15_.parentPoint != 0)
               {
                  _loc15_ = _loc15_.parentPoint;
                  _loc6_.push([_loc15_.x,_loc15_.y]);
               }
               return _loc6_;
            }
            _loc16_ = 1;
            while(_loc16_ <= 8)
            {
               _loc17_ = _loc14_.x + ro["r" + _loc16_][0];
               _loc18_ = _loc14_.y + ro["r" + _loc16_][1];
               if(!(SceneUtil.isSolid(_loc17_,_loc18_) || _loc8_[_loc17_ + "_" + _loc18_] != undefined))
               {
                  _loc19_ = _loc16_ % 2;
                  if(!(_loc19_ == 1 && (SceneUtil.isSolid(_loc14_.x,_loc18_) || SceneUtil.isSolid(_loc17_,_loc14_.y))))
                  {
                     _loc20_ = _loc7_[_loc17_ + "_" + _loc18_];
                     _loc21_ = _loc14_.g + (_loc19_ == 0 ? 10 : 14);
                     if(_loc20_ != null)
                     {
                        if(_loc21_ < _loc20_.g)
                        {
                           _loc20_.g = _loc21_;
                           _loc20_.f = _loc20_.g + _loc20_.h;
                           _loc20_.parentPoint = _loc14_;
                           updatePoint(_loc7_,_loc20_,_loc7_.indexOf(_loc20_));
                        }
                     }
                     else
                     {
                        _loc20_ = new Object();
                        _loc20_.x = _loc17_;
                        _loc20_.y = _loc18_;
                        _loc20_.g = _loc21_;
                        _loc10_ = _loc17_ - param3 < 0 ? int((_loc17_ - param3) * -1) : int(_loc17_ - param3);
                        _loc11_ = _loc18_ - param4 < 0 ? int((_loc18_ - param4) * -1) : int(_loc18_ - param4);
                        _loc20_.h = (_loc10_ + _loc11_) * 10;
                        _loc20_.f = _loc20_.g + _loc20_.h;
                        _loc20_.parentPoint = _loc14_;
                        updatePoint(_loc7_,_loc20_,_loc12_++);
                        _loc7_[_loc20_.x + "_" + _loc20_.y] = _loc20_;
                     }
                  }
               }
               _loc16_++;
            }
         }
         return null;
      }
      
      public static function search_noSolid(param1:int, param2:int, param3:int, param4:int, param5:int = -1) : Array
      {
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Object = null;
         var _loc21_:int = 0;
         if(param1 == param3 && param2 == param4)
         {
            return null;
         }
         if(SceneUtil.getMapTile(param1,param2) == null)
         {
            return null;
         }
         if(SceneUtil.getMapTile(param3,param4) == null)
         {
            return null;
         }
         var _loc6_:Array = new Array();
         var _loc7_:Array = new Array();
         var _loc8_:Array = new Array();
         var _loc9_:Object = new Object();
         _loc9_.x = param1;
         _loc9_.y = param2;
         _loc9_.g = 0;
         var _loc10_:int = param1 - param3 < 0 ? int((param1 - param3) * -1) : int(param1 - param3);
         var _loc11_:int = param2 - param4 < 0 ? int((param2 - param4) * -1) : int(param2 - param4);
         _loc9_.h = (_loc10_ + _loc11_) * 10;
         _loc9_.f = _loc9_.g + _loc9_.h;
         _loc9_.parentPoint = 0;
         var _loc12_:* = 0;
         updatePoint(_loc7_,_loc9_,_loc12_++);
         _loc7_[_loc9_.x + "_" + _loc9_.y] = _loc9_;
         var _loc13_:int = 0;
         while(true)
         {
            _loc13_++;
            if(param5 > 0)
            {
               if(_loc13_ > param5)
               {
                  break;
               }
            }
            if(_loc7_.length == 0)
            {
               return null;
            }
            _loc14_ = delPoint(_loc7_,_loc12_--);
            _loc8_.push(_loc14_);
            _loc8_[_loc14_.x + "_" + _loc14_.y] = _loc14_;
            if(_loc14_.x == param3 && _loc14_.y == param4)
            {
               _loc15_ = _loc14_;
               _loc6_.push([_loc15_.x,_loc15_.y]);
               while(_loc15_.parentPoint != 0)
               {
                  _loc15_ = _loc15_.parentPoint;
                  _loc6_.push([_loc15_.x,_loc15_.y]);
               }
               return _loc6_;
            }
            _loc16_ = 1;
            while(_loc16_ <= 8)
            {
               _loc17_ = _loc14_.x + ro["r" + _loc16_][0];
               _loc18_ = _loc14_.y + ro["r" + _loc16_][1];
               if(!(SceneUtil.getMapTile(_loc17_,_loc18_) == null || _loc8_[_loc17_ + "_" + _loc18_] != undefined))
               {
                  _loc19_ = _loc16_ % 2;
                  if(!(_loc19_ == 1 && (SceneUtil.getMapTile(_loc14_.x,_loc18_) == undefined || SceneUtil.getMapTile(_loc17_,_loc14_.y) == undefined)))
                  {
                     _loc20_ = _loc7_[_loc17_ + "_" + _loc18_];
                     _loc21_ = _loc14_.g + (_loc19_ == 0 ? 10 : 14);
                     if(_loc20_ != null)
                     {
                        if(_loc21_ < _loc20_.g)
                        {
                           _loc20_.g = _loc21_;
                           _loc20_.f = _loc20_.g + _loc20_.h;
                           _loc20_.parentPoint = _loc14_;
                           updatePoint(_loc7_,_loc20_,_loc7_.indexOf(_loc20_));
                        }
                     }
                     else
                     {
                        _loc20_ = new Object();
                        _loc20_.x = _loc17_;
                        _loc20_.y = _loc18_;
                        _loc20_.g = _loc21_;
                        _loc10_ = _loc17_ - param3 < 0 ? int((_loc17_ - param3) * -1) : int(_loc17_ - param3);
                        _loc11_ = _loc18_ - param4 < 0 ? int((_loc18_ - param4) * -1) : int(_loc18_ - param4);
                        _loc20_.h = (_loc10_ + _loc11_) * 10;
                        _loc20_.f = _loc20_.g + _loc20_.h;
                        _loc20_.parentPoint = _loc14_;
                        updatePoint(_loc7_,_loc20_,_loc12_++);
                        _loc7_[_loc20_.x + "_" + _loc20_.y] = _loc20_;
                     }
                  }
               }
               _loc16_++;
            }
         }
         return null;
      }
      
      private static function updatePoint(param1:Array, param2:Object, param3:int) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         param1[param3] = param2;
         var _loc4_:int = param3 + 1;
         var _loc5_:int = _loc4_ / 2;
         while(_loc5_ > 0)
         {
            _loc6_ = param1[_loc4_ - 1];
            _loc7_ = param1[_loc5_ - 1];
            if(_loc6_.f >= _loc7_.f)
            {
               break;
            }
            param1[_loc4_ - 1] = _loc7_;
            param1[_loc5_ - 1] = _loc6_;
            _loc4_ = _loc5_;
            _loc5_ = _loc4_ / 2;
         }
      }
      
      private static function delPoint(param1:Array, param2:int) : Object
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc3_:Object = param1[0];
         var _loc4_:int = param2 - 1;
         param1[0] = param1[_loc4_];
         param1.pop();
         var _loc5_:int = 0;
         while((_loc5_ + 1) * 2 < _loc4_)
         {
            _loc8_ = param1[_loc5_];
            _loc6_ = (_loc5_ + 1) * 2;
            _loc7_ = _loc6_ + 1;
            _loc9_ = param1[_loc6_ - 1];
            _loc10_ = _loc7_ != _loc4_ ? param1[_loc7_ - 1] : null;
            if(_loc10_ != null)
            {
               if(_loc8_.f < _loc9_.f && _loc8_.f < _loc10_.f)
               {
                  break;
               }
               if(_loc9_.f <= _loc10_.f)
               {
                  if(_loc8_.f > _loc9_.f)
                  {
                     param1[_loc5_] = _loc9_;
                     param1[_loc6_ - 1] = _loc8_;
                     _loc5_ = _loc6_ - 1;
                  }
                  else
                  {
                     param1[_loc5_] = _loc10_;
                     param1[_loc7_ - 1] = _loc8_;
                     _loc5_ = _loc7_ - 1;
                  }
               }
               else if(_loc8_.f > _loc10_.f)
               {
                  param1[_loc5_] = _loc10_;
                  param1[_loc7_ - 1] = _loc8_;
                  _loc5_ = _loc7_ - 1;
               }
               else
               {
                  param1[_loc5_] = _loc9_;
                  param1[_loc6_ - 1] = _loc8_;
                  _loc5_ = _loc6_ - 1;
               }
            }
            else
            {
               if(_loc8_.f <= _loc9_.f)
               {
                  break;
               }
               param1[_loc5_] = _loc9_;
               param1[_loc6_ - 1] = _loc8_;
               _loc5_ = _loc6_ - 1;
            }
         }
         return _loc3_;
      }
   }
}

