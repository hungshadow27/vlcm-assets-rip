package com.zcp.engine.vo.map
{
   import com.zcp.engine.vo.BaseElement;
   
   public class MapTile extends BaseElement
   {
      
      public var isSolid:Boolean;
      
      public var isIsland:Boolean;
      
      public var isMask:Boolean;
      
      public var isTransport:Boolean;
      
      public var isYouyong:Boolean;
      
      public function MapTile(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
      {
         super();
         tile_x = param1;
         tile_y = param2;
         this.isSolid = param3;
         this.isIsland = param4;
         this.isMask = param5;
         this.isTransport = param6;
         this.isYouyong = param7;
      }
      
      public function clone() : MapTile
      {
         return new MapTile(tile_x,tile_y,this.isSolid,this.isIsland,this.isMask,this.isTransport,this.isYouyong);
      }
   }
}

