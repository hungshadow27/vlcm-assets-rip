package com.zcp.common.vo
{
   public class StyleData
   {
      
      public static const DEFAULT:StyleData = new StyleData(0,0,1,0,1);
      
      public var lineThickness:Number;
      
      public var lineColor:uint;
      
      public var lineAlpha:Number;
      
      public var fillColor:uint;
      
      public var fillAlpha:Number;
      
      public function StyleData(param1:Number = 0, param2:uint = 0, param3:Number = 1, param4:uint = 0, param5:Number = 1)
      {
         super();
         this.lineThickness = param1;
         this.lineColor = param2;
         this.lineAlpha = param3;
         this.fillColor = param4;
         this.fillAlpha = param5;
      }
   }
}

