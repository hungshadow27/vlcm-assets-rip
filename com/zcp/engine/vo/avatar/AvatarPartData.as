package com.zcp.engine.vo.avatar
{
   public class AvatarPartData
   {
      
      public var angle:int;
      
      public var frame:int;
      
      public var sx:int;
      
      public var sy:int;
      
      public var width:int;
      
      public var height:int;
      
      public var tx:int;
      
      public var ty:int;
      
      public function AvatarPartData(param1:XML)
      {
         super();
         this.angle = param1.@a;
         this.frame = param1.@f;
         this.sx = param1.@sx;
         this.sy = param1.@sy;
         this.width = param1.@w;
         this.height = param1.@h;
         this.tx = parseInt(param1.@tx) + parseInt(param1.@ox);
         this.ty = parseInt(param1.@ty) + parseInt(param1.@oy);
      }
   }
}

