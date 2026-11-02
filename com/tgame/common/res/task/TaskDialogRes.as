package com.tgame.common.res.task
{
   public class TaskDialogRes
   {
      
      public var taskId:int;
      
      public var dialogType:int;
      
      public var npcId:int;
      
      public var talks:Array;
      
      public function TaskDialogRes()
      {
         super();
         this.taskId = 0;
         this.dialogType = 3;
         this.npcId = 0;
         this.talks = [];
      }
   }
}

