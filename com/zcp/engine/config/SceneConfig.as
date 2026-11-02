package com.zcp.engine.config
{
   public class SceneConfig
   {
      
      public static const TILE_WIDTH:Number = 25;
      
      public static const TILE_HEIGHT:Number = 25;
      
      public static const ZONE_WIDTH:Number = 200;
      
      public static const ZONE_HEIGHT:Number = 200;
      
      public static const ZONE_SCALE:Number = ZONE_WIDTH / TILE_WIDTH;
      
      public var width:Number = 1000;
      
      public var height:Number = 580;
      
      public function SceneConfig(param1:Number, param2:Number)
      {
         super();
         this.width = param1;
         this.height = param2;
      }
   }
}

