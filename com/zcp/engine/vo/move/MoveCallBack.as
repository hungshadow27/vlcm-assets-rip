package com.zcp.engine.vo.move
{
   public class MoveCallBack
   {
      
      public var onMoveReady:Function;
      
      public var onMoveThrough:Function;
      
      public var onMoveArrived:Function;
      
      public var onMoveUnable:Function;
      
      public function MoveCallBack()
      {
         super();
      }
      
      public function clone() : MoveCallBack
      {
         var _loc1_:MoveCallBack = new MoveCallBack();
         _loc1_.onMoveReady = this.onMoveReady;
         _loc1_.onMoveThrough = this.onMoveThrough;
         _loc1_.onMoveArrived = this.onMoveArrived;
         _loc1_.onMoveUnable = this.onMoveUnable;
         return _loc1_;
      }
   }
}

