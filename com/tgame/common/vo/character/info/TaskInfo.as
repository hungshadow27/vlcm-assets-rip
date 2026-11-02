package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.vo.character.info.data.CharEndTaskData;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   
   public class TaskInfo
   {
      
      public static const MAX_TASK_NUM:int = 30;
      
      public var taskArr:Array;
      
      public var endTaskArr:Array;
      
      public function TaskInfo()
      {
         super();
         this.init([],[]);
      }
      
      public function init(param1:Array, param2:Array) : void
      {
         this.taskArr = param1;
         this.endTaskArr = param2;
      }
      
      public function hasTask(param1:int) : Boolean
      {
         return this.getTask(param1) != null;
      }
      
      public function getTask(param1:int) : CharTaskData
      {
         var _loc2_:CharTaskData = null;
         for each(_loc2_ in this.taskArr)
         {
            if(_loc2_.taskID == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addTask(param1:int, param2:int = 0) : CharTaskData
      {
         var _loc3_:TaskRes = TaskResManager.getTaskRes(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:CharTaskData = this.getTask(param1);
         if(_loc4_ == null)
         {
            _loc4_ = new CharTaskData();
            _loc4_.taskID = param1;
            _loc4_.currentLoop = param2;
            _loc4_.leaveTime = _loc3_.limitTime != -1 ? _loc3_.limitTime * 60 : -1;
            this.taskArr[this.taskArr.length] = _loc4_;
         }
         else
         {
            _loc4_.currentLoop = param2;
         }
         return _loc4_;
      }
      
      public function removeTask(param1:int) : CharTaskData
      {
         var _loc2_:CharTaskData = null;
         for each(_loc2_ in this.taskArr)
         {
            if(_loc2_.taskID == param1)
            {
               _loc2_.destroy();
               this.taskArr.splice(this.taskArr.indexOf(_loc2_),1);
               break;
            }
         }
         return _loc2_;
      }
      
      public function getTasksNum() : int
      {
         return this.taskArr.length;
      }
      
      public function isEndTask(param1:int) : Boolean
      {
         var _loc2_:CharEndTaskData = this.getEndTask(param1);
         if(_loc2_ == null || _loc2_.taskRes.isLoop && _loc2_.currentLoop < _loc2_.taskRes.loopMaxCount)
         {
            return false;
         }
         return true;
      }
      
      public function getEndTask(param1:int) : CharEndTaskData
      {
         var _loc2_:CharEndTaskData = null;
         for each(_loc2_ in this.endTaskArr)
         {
            if(_loc2_.taskID == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addEndTask(param1:int, param2:int = 0) : CharEndTaskData
      {
         var _loc3_:CharEndTaskData = this.getEndTask(param1);
         if(_loc3_ == null)
         {
            _loc3_ = new CharEndTaskData();
            _loc3_.taskID = param1;
            _loc3_.currentLoop = param2;
            this.endTaskArr.push(_loc3_);
         }
         else
         {
            _loc3_.currentLoop = param2;
         }
         return _loc3_;
      }
      
      public function removeEndTask(param1:int) : CharEndTaskData
      {
         var _loc2_:CharEndTaskData = null;
         for each(_loc2_ in this.endTaskArr)
         {
            if(_loc2_.taskID == param1)
            {
               this.endTaskArr.splice(this.endTaskArr.indexOf(_loc2_),1);
               break;
            }
         }
         return _loc2_;
      }
      
      public function getEndTasksNum() : int
      {
         return this.endTaskArr.length;
      }
   }
}

