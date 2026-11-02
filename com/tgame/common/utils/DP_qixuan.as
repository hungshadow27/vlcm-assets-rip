package com.tgame.common.utils
{
   import com.zcp.engine.vo.avatar.DynamicPosition.IDynamicPosition;
   import flash.geom.Point;
   
   public class DP_qixuan implements IDynamicPosition
   {
      
      private static const GUANXING:Number = 0.08;
      
      private static var R:Number = 30;
      
      public static var isWanbaoge:Boolean = false;
      
      public var an:Number = 0;
      
      public function DP_qixuan(param1:Number = 0)
      {
         super();
         this.an = param1 * Math.PI / 180;
      }
      
      public function updateDynamicTargetPosition(param1:Point, param2:Point, param3:int = 0) : Point
      {
         var _loc4_:Number = param2.x;
         var _loc5_:Number = param2.y;
         if(isWanbaoge)
         {
            R = 60;
         }
         else
         {
            R = 30;
         }
         var _loc6_:int = 60;
         var _loc7_:int = -110;
         if(param3 <= 3)
         {
            _loc4_ += _loc6_;
         }
         else
         {
            _loc4_ -= _loc6_;
         }
         _loc5_ += _loc7_;
         _loc4_ += R * Math.cos(this.an);
         _loc5_ += R * Math.sin(this.an);
         if(!isWanbaoge)
         {
            this.an += 0.07;
         }
         return new Point(param1.x + (_loc4_ - param1.x) * GUANXING,param1.y + (_loc5_ - param1.y) * GUANXING);
      }
      
      public function clone() : IDynamicPosition
      {
         return new DP_qixuan(this.an * 180 / Math.PI);
      }
      
      public function equals(param1:IDynamicPosition) : Boolean
      {
         return param1 is DP_qixuan;
      }
   }
}

