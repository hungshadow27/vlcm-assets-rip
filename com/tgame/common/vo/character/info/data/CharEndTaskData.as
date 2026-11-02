package com.tgame.common.vo.character.info.data
{
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   
   public class CharEndTaskData
   {
      
      public var taskID:int;
      
      public var currentLoop:int;
      
      public function CharEndTaskData()
      {
         super();
         this.taskID = 0;
         this.currentLoop = 0;
      }
      
      public function get taskRes() : TaskRes
      {
         return TaskResManager.getTaskRes(this.taskID);
      }
   }
}

