package com.zcp.engine.vo.avatar
{
   import flash.utils.Dictionary;
   
   public class AvatarPartStatus
   {
      
      public var type:String;
      
      public var frame:int;
      
      public var time:int;
      
      public var classNamePrefix:String;
      
      public var isOldWay:Boolean;
      
      public var width:int;
      
      public var height:int;
      
      public var tx:int;
      
      public var ty:int;
      
      private var _apd_dict:Dictionary;
      
      public function AvatarPartStatus(param1:String, param2:XML)
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:XML = null;
         var _loc9_:AvatarPartData = null;
         var _loc10_:int = 0;
         var _loc11_:AvatarPartData = null;
         super();
         this.classNamePrefix = param1 + ".";
         if(param2.name() == "status")
         {
            this.isOldWay = true;
            this.type = param2.@type;
            this.frame = param2.@frame;
            this.time = param2.@time;
            this.width = param2.@width;
            this.height = param2.@height;
            this.tx = param2.@tx;
            this.ty = param2.@ty;
            this._apd_dict = new Dictionary();
            _loc3_ = 0;
            while(_loc3_ <= 7)
            {
               _loc4_ = 0;
               while(_loc4_ < this.frame)
               {
                  if(_loc3_ == 0 || _loc3_ >= 4)
                  {
                     _loc5_ = _loc4_;
                     if(_loc3_ == 0 || _loc3_ == 4)
                     {
                        _loc6_ = _loc3_;
                     }
                     else if(_loc3_ == 7)
                     {
                        _loc6_ = 1;
                     }
                     else if(_loc3_ == 6)
                     {
                        _loc6_ = 2;
                     }
                     else if(_loc3_ == 5)
                     {
                        _loc6_ = 3;
                     }
                     _loc7_ = this.tx;
                  }
                  else
                  {
                     _loc5_ = this.frame - _loc4_ - 1;
                     _loc6_ = _loc3_ - 1;
                     _loc7_ = this.width - this.tx;
                  }
                  _loc8_ = <p a={_loc3_} f={_loc4_} sx={_loc5_ * this.width} sy={_loc6_ * this.height} w={this.width} h={this.height} tx={_loc7_} ty={this.ty} ox="0" oy="0"/>;
                  _loc9_ = new AvatarPartData(_loc8_);
                  this._apd_dict[_loc9_.angle + "_" + _loc9_.frame] = _loc9_;
                  _loc4_++;
               }
               _loc3_++;
            }
         }
         else
         {
            this.isOldWay = false;
            this.type = param2.@k;
            this.frame = param2.@f;
            this.time = param2.@t;
            this._apd_dict = new Dictionary();
            for each(_loc8_ in param2.children())
            {
               _loc9_ = new AvatarPartData(_loc8_);
               this._apd_dict[_loc9_.angle + "_" + _loc9_.frame] = _loc9_;
            }
            _loc3_ = 1;
            while(_loc3_ <= 3)
            {
               _loc10_ = _loc3_;
               if(_loc3_ == 1)
               {
                  _loc10_ = 7;
               }
               else if(_loc3_ == 2)
               {
                  _loc10_ = 6;
               }
               else if(_loc3_ == 3)
               {
                  _loc10_ = 5;
               }
               _loc4_ = 0;
               while(_loc4_ < this.frame)
               {
                  _loc11_ = this.getAvatarPartData(_loc10_,_loc4_);
                  if(_loc11_ != null)
                  {
                     _loc8_ = <p a={_loc3_} f={_loc4_} sx="0" sy="0" w={_loc11_.width} h={_loc11_.height} tx={_loc11_.width - _loc11_.tx} ty={_loc11_.ty} ox="0" oy="0"/>;
                     _loc9_ = new AvatarPartData(_loc8_);
                     this._apd_dict[_loc9_.angle + "_" + _loc9_.frame] = _loc9_;
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
         }
      }
      
      public function getAvatarPartData(param1:int, param2:int) : AvatarPartData
      {
         var _loc3_:String = param1 + "_" + param2;
         if(this._apd_dict != null && this._apd_dict.hasOwnProperty(_loc3_))
         {
            return this._apd_dict[_loc3_] as AvatarPartData;
         }
         return null;
      }
   }
}

