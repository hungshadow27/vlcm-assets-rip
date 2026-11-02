package com.zcp.engine.utils
{
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.staticdata.CharAngleType;
   import flash.geom.Point;
   
   public class Transformer
   {
      
      public function Transformer()
      {
         super();
      }
      
      public static function transTilePoint2ZonePoint(param1:Point) : Point
      {
         return new Point(int(param1.x / SceneConfig.ZONE_SCALE),int(param1.y / SceneConfig.ZONE_SCALE));
      }
      
      public static function transTilePoint2PixelPoint(param1:Point) : Point
      {
         return new Point(param1.x * SceneConfig.TILE_WIDTH,param1.y * SceneConfig.TILE_HEIGHT);
      }
      
      public static function transPixelPoint2TilePoint(param1:Point) : Point
      {
         return new Point(int(param1.x / SceneConfig.TILE_WIDTH),int(param1.y / SceneConfig.TILE_HEIGHT));
      }
      
      public static function transZoneTilePoint2ZonePixelPoint(param1:Point) : Point
      {
         return new Point(param1.x * SceneConfig.ZONE_WIDTH,param1.y * SceneConfig.ZONE_HEIGHT);
      }
      
      public static function transAngle2LogicAngle(param1:Number, param2:int = 8) : int
      {
         var _loc3_:Number = ZMath.getNearAngel(param1 - 90,param2);
         return CharAngleType["ANGEL_" + _loc3_];
      }
      
      public static function transLogicAngle2Angle(param1:int, param2:int = 8) : Number
      {
         var _loc3_:Number = 360 / param2;
         return param1 * _loc3_ % 360;
      }
   }
}

