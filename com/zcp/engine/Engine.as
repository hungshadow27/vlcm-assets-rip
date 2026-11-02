package com.zcp.engine
{
   import com.zcp.engine.config.GlobalConfig;
   import com.zcp.engine.tools.SceneCache;
   
   public class Engine
   {
      
      public static var engineReady:Boolean = false;
      
      public static var enable2Jump:Boolean = true;
      
      public static var enable3Jump:Boolean = true;
      
      public static var enableJumpStop:Boolean = false;
      
      public static var font_HeadFace:String = "宋体";
      
      public static var font_AttackFace:String = "楷体";
      
      public function Engine()
      {
         super();
      }
      
      public static function initEngine(param1:String = "", param2:String = "", param3:String = "", param4:String = "", param5:int = 24, param6:Function = null) : void
      {
         GlobalConfig.map_config_tem = param1;
         GlobalConfig.map_small_tem = param2;
         GlobalConfig.map_zone_tem = param3;
         GlobalConfig.map_slipcover_tem = param4;
         GlobalConfig.frameRate = param5;
         GlobalConfig.setpTime = 1000 / param5;
         GlobalConfig.decode = param6;
         engineReady = true;
      }
      
      public static function initTransport(param1:Array) : void
      {
         var _loc3_:Array = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Object = {};
         for each(_loc3_ in param1)
         {
            _loc2_[_loc3_[0] + "_" + _loc3_[1] + "_" + _loc3_[2]] = 1;
         }
         SceneCache.transports = _loc2_;
      }
   }
}

