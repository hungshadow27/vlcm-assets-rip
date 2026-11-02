package com.zcp.engine.vo.move
{
   import com.zcp.engine.move.PathCutter;
   import flash.geom.Point;
   
   public class MoveData
   {
      
      private static const J:Number = 450;
      
      private static const crossX:Number = 320;
      
      private static const crossY:Number = 350;
      
      private static const K:Number = (J * crossX * crossY - J * J * crossX) / crossY;
      
      public var walk_speed:Number = 160;
      
      public var walk_pathArr:Array;
      
      public var walk_targetP:Point;
      
      public var walk_standDis:Number = 0;
      
      public var walk_lastTime:int = 0;
      
      public var walk_pathCutter:PathCutter;
      
      public var walk_MoveCallBack:MoveCallBack = null;
      
      public var jump_maxDis:Number = 625;
      
      public var jump_targetP:Point;
      
      public var jump_MoveCallBack:MoveCallBack = null;
      
      public var isJumping:Boolean;
      
      public var on2Jumping:Boolean;
      
      public var on3Jumping:Boolean;
      
      public var onDigun:Boolean = false;
      
      public function MoveData()
      {
         super();
      }
      
      public function get jump_speed() : Number
      {
         return J + K / (this.walk_speed - K / J);
      }
      
      public function clear() : void
      {
         this.walk_pathArr = null;
         this.walk_targetP = null;
         this.walk_lastTime = 0;
         this.walk_standDis = 0;
         if(this.walk_pathCutter)
         {
            this.walk_pathCutter.clear();
         }
         this.walk_MoveCallBack = null;
         this.jump_targetP = null;
         this.jump_MoveCallBack = null;
         this.isJumping = false;
         this.on2Jumping = false;
         this.on3Jumping = false;
      }
   }
}

