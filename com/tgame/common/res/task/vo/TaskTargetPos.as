package com.tgame.common.res.task.vo
{
   import flash.utils.getDefinitionByName;
   
   public class TaskTargetPos
   {
      
      public var scene:int;
      
      public var x:int;
      
      public var y:int;
      
      public var dis:int;
      
      public function TaskTargetPos(param1:int, param2:int, param3:int, param4:int = 0)
      {
         super();
         this.scene = param1;
         this.x = param2;
         this.y = param3;
         this.dis = param4;
      }
      
      public static function fromSplitString(param1:String = "0,0,0,0", param2:String = ",") : TaskTargetPos
      {
         var $str:String = param1;
         var $splitChar:String = param2;
         var intArr:Array = $str.split($splitChar).map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         return new TaskTargetPos(intArr[0],intArr[1],intArr[2],intArr[3]);
      }
      
      public function toSplitString(param1:String = ",") : String
      {
         return this.scene + param1 + this.x + param1 + this.y + param1 + this.dis;
      }
      
      public function isNull() : Boolean
      {
         return this.scene == 0 && this.x == 0 && this.y == 0 && this.dis == 0;
      }
   }
}

