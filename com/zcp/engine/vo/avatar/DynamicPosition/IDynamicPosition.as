package com.zcp.engine.vo.avatar.DynamicPosition
{
   import flash.geom.Point;
   
   public interface IDynamicPosition
   {
      
      function updateDynamicTargetPosition(param1:Point, param2:Point, param3:int = 0) : Point;
      
      function clone() : IDynamicPosition;
      
      function equals(param1:IDynamicPosition) : Boolean;
   }
}

