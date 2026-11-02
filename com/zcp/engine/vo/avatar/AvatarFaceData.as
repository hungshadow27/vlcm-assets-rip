package com.zcp.engine.vo.avatar
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarFaceData
   {
      
      public var id:String;
      
      public var type:String;
      
      public var cutRect:Rectangle;
      
      public var sourcePoint:Point;
      
      public var sourceBitmapData:BitmapData;
      
      public function AvatarFaceData(param1:Rectangle = null, param2:Point = null, param3:BitmapData = null)
      {
         super();
         this.cutRect = param1;
         this.sourcePoint = param2;
         this.sourceBitmapData = param3;
      }
      
      public function isGood() : Boolean
      {
         return this.cutRect != null && this.sourcePoint != null && this.sourceBitmapData != null;
      }
   }
}

