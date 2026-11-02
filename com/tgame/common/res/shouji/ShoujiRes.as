package com.tgame.common.res.shouji
{
   import com.tgame.common.res.task.vo.TaskTargetData;
   
   public class ShoujiRes
   {
      
      public var id:int;
      
      public var name:String;
      
      public var grade:int;
      
      public var targetGoods:Array;
      
      public var rewardDesc:String;
      
      public var pointCnt:int;
      
      public function ShoujiRes()
      {
         super();
         this.targetGoods = [];
      }
      
      public function getTargetGoods(param1:int) : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         for each(_loc2_ in this.targetGoods)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

