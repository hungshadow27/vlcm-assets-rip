package com.tgame.common.res.task.vo
{
   import flash.geom.Rectangle;
   
   public class TaskTargetData
   {
      
      public var id:int;
      
      public var count:int;
      
      public var name:String;
      
      public var area:Rectangle;
      
      public var pos:TaskTargetPos;
      
      public var userData:Object;
      
      public function TaskTargetData(param1:int = -1, param2:int = 0, param3:String = "", param4:Rectangle = null, param5:TaskTargetPos = null)
      {
         super();
         this.id = param1;
         this.count = param2;
         this.name = param3;
         this.area = param4;
         this.pos = param5;
      }
   }
}

