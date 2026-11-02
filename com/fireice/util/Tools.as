package com.fireice.util
{
   import flash.display.Stage;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   
   public class Tools
   {
      
      private static var _currentStage:Stage;
      
      public static var blackWhiteFilter:Array = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0])];
      
      public static var darkFilter:Array = [new ColorMatrixFilter([0.5,0,0,0,0,0,0.5,0,0,0,0,0,0.5,0,0,0,0,0,1,0])];
      
      public static var invertFilter:Array = [new ColorMatrixFilter([-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,1])];
      
      public static var borderFilter:Array = [new GlowFilter(3591,1,3,3,15,BitmapFilterQuality.LOW)];
      
      public static var font:* = null;
      
      public static var getBD:Function = null;
      
      public function Tools()
      {
         super();
         throw new Error("Tools类不能实例化!");
      }
      
      public static function get currentStage() : Stage
      {
         return _currentStage;
      }
      
      public static function set currentStage(param1:Stage) : void
      {
         _currentStage = param1;
         _currentStage.stageFocusRect = false;
      }
      
      public static function get9GridBitmpByName(param1:*) : F9GridBitmap
      {
         return new F9GridBitmap(param1);
      }
      
      public static function getSBCSLength(param1:String) : int
      {
         return param1.replace(/[^\x00-\xFF]/g,"aa").length;
      }
   }
}

