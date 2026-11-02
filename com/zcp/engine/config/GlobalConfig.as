package com.zcp.engine.config
{
   public class GlobalConfig
   {
      
      public static var decode:Function;
      
      public static var map_config_tem:String = "";
      
      public static var map_small_tem:String = "";
      
      public static var map_zone_tem:String = "";
      
      public static var map_slipcover_tem:String = "";
      
      public static var frameRate:int = 24;
      
      public static var setpTime:Number = 1000 / frameRate;
      
      public function GlobalConfig()
      {
         super();
      }
      
      public static function getMapConfigPath(param1:* = "", param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         return map_config_tem.replace(_loc4_,param1);
      }
      
      public static function getSmallMapPath(param1:* = "", param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         return map_small_tem.replace(_loc4_,param1);
      }
      
      public static function getZoneMapFolder(param1:* = "", param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         return map_zone_tem.replace(_loc4_,param1);
      }
      
      public static function getAvatarMapSlipcoverPath(param1:* = "", param2:String = "$") : String
      {
         var _loc3_:String = null;
         var _loc4_:RegExp = new RegExp("\\" + param2,"g");
         return map_slipcover_tem.replace(_loc4_,param1);
      }
   }
}

