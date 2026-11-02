package com.zcp.common.draw.helper
{
   import com.zcp.common.vo.StyleData;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class DrawHelper
   {
      
      public function DrawHelper()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function drawLine(param1:*, param2:Point, param3:Point, param4:StyleData = null, param5:Boolean = false) : void
      {
         if(!param1)
         {
            return;
         }
         param4 ||= StyleData.DEFAULT;
         var _loc6_:Graphics = param1.graphics;
         if(param5)
         {
            _loc6_.clear();
         }
         _loc6_.lineStyle(param4.lineThickness,param4.lineColor,param4.lineAlpha);
         _loc6_.moveTo(param2.x,param2.y);
         _loc6_.lineTo(param3.x,param3.y);
      }
      
      public static function drawRect(param1:*, param2:Point, param3:Point, param4:StyleData = null, param5:Boolean = false) : void
      {
         if(!param1)
         {
            return;
         }
         param4 ||= StyleData.DEFAULT;
         var _loc6_:Graphics = param1.graphics;
         if(param5)
         {
            _loc6_.clear();
         }
         _loc6_.lineStyle(param4.lineThickness,param4.lineColor,param4.lineAlpha);
         _loc6_.beginFill(param4.fillColor,param4.fillAlpha);
         _loc6_.moveTo(param2.x,param2.y);
         _loc6_.lineTo(param3.x,param2.y);
         _loc6_.lineTo(param3.x,param3.y);
         _loc6_.lineTo(param2.x,param3.y);
         _loc6_.lineTo(param2.x,param2.y);
         _loc6_.endFill();
      }
      
      public static function drawCircle(param1:*, param2:Point, param3:Point, param4:StyleData = null, param5:Boolean = false) : void
      {
         if(!param1)
         {
            return;
         }
         param4 ||= StyleData.DEFAULT;
         var _loc6_:Graphics = param1.graphics;
         if(param5)
         {
            _loc6_.clear();
         }
         _loc6_.lineStyle(param4.lineThickness,param4.lineColor,param4.lineAlpha);
         _loc6_.beginFill(param4.fillColor,param4.fillAlpha);
         _loc6_.drawCircle(param2.x,param2.y,Math.sqrt((param3.x - param2.x) * (param3.x - param2.x) + (param3.y - param2.y) * (param3.y - param2.y)));
         _loc6_.endFill();
      }
   }
}

