package com.zcp.engine.config
{
   public class MapConfig
   {
      
      public var mapID:int;
      
      public var unbounded:Boolean;
      
      public var unbounded_top:Boolean;
      
      public var unbounded_bottom:Boolean;
      
      public var unbounded_left:Boolean;
      
      public var unbounded_right:Boolean;
      
      public var mapGridX:int;
      
      public var mapGridY:int;
      
      public var width:int;
      
      public var height:int;
      
      public var widthScale:Number = 0.1;
      
      public var heightScale:Number = 0.1;
      
      public var zoneMapDir:String;
      
      public var smallMapUrl:String;
      
      public var slipcovers:Array;
      
      public function MapConfig()
      {
         super();
      }
   }
}

