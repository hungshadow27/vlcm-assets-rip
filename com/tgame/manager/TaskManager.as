package com.tgame.manager
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.TaskInfo;
   import com.tgame.common.vo.character.info.data.CharEndTaskData;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   
   public class TaskManager
   {
      
      public function TaskManager()
      {
         super();
      }
      
      public static function get taskInfo() : TaskInfo
      {
         return GameInstance.mainCharData.taskInfo;
      }
      
      public static function hasTask(param1:int) : Boolean
      {
         return taskInfo.hasTask(param1);
      }
      
      public static function getTask(param1:int) : CharTaskData
      {
         return taskInfo.getTask(param1);
      }
      
      public static function getEndTask(param1:int) : CharEndTaskData
      {
         return taskInfo.getEndTask(param1);
      }
      
      public static function getTasksNum() : int
      {
         return taskInfo.getTasksNum();
      }
      
      public static function getTaskList() : Array
      {
         return taskInfo.taskArr;
      }
      
      public static function getTaskListByType(param1:int) : Array
      {
         var _loc3_:CharTaskData = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskInfo.taskArr)
         {
            if(_loc3_.taskRes.type == param1)
            {
               _loc2_[_loc2_.length] = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public static function getLoopTaskListByType(param1:int = -1) : Array
      {
         var _loc3_:CharTaskData = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskInfo.taskArr)
         {
            if(_loc3_.taskRes.isLoop == true)
            {
               if((param1 == -1 || _loc3_.taskRes.type == param1) && _loc3_.taskRes.type != TaskType.CISHA)
               {
                  _loc2_[_loc2_.length] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function checkAcceptableTask(param1:int, param2:Boolean = true, param3:Boolean = false) : Array
      {
         var _loc6_:Player = null;
         var _loc4_:Array = [1,""];
         var _loc5_:TaskRes = TaskResManager.getTaskRes(param1);
         if(_loc5_)
         {
            _loc6_ = GameInstance.mainCharData;
            if(param2 && _loc6_.taskInfo.getTasksNum() >= TaskInfo.MAX_TASK_NUM)
            {
               return [0,LanResManager.getLanCommonTextWords("任务栏已满")];
            }
            if(_loc6_.taskInfo.isEndTask(param1))
            {
               return [0,LanResManager.getLanCommonTextWords("该任务已经做过啦")];
            }
            if(_loc6_.taskInfo.hasTask(param1))
            {
               return [0,LanResManager.getLanCommonTextWords("该任务已经存在于您的任务列表中")];
            }
            if(param3 || _loc5_.type != TaskType.MAIN)
            {
               if(_loc6_.attributeInfo.lv < _loc5_.receptionLevel)
               {
                  return [0,LanResManager.getLanCommonTextWords("接此任务至少需要达到") + _loc5_.receptionLevel + LanResManager.getLanCommonTextWords("级")];
               }
               if(_loc5_.receptionUpLevel != 0 && _loc6_.attributeInfo.lv > _loc5_.receptionUpLevel)
               {
                  return [0,LanResManager.getLanCommonTextWords("接此任务级别必须低于") + _loc5_.receptionUpLevel + LanResManager.getLanCommonTextWords("级")];
               }
            }
            if(_loc5_.premiseTask != 0 && !_loc6_.taskInfo.isEndTask(_loc5_.premiseTask))
            {
               return [0,LanResManager.getLanCommonTextWords("请先完成前提任务") + "[" + TaskResManager.getTaskRes(_loc5_.premiseTask).name + "]"];
            }
         }
         else
         {
            _loc4_ = [0,LanResManager.getLanCommonTextWords("该任务不存在")];
         }
         return _loc4_;
      }
      
      public static function checkHandInTask(param1:int, param2:Boolean = true, param3:Boolean = true) : Array
      {
         var _loc6_:Player = null;
         var _loc7_:CharTaskData = null;
         var _loc4_:Array = [1,""];
         var _loc5_:TaskRes = TaskResManager.getTaskRes(param1);
         if(_loc5_)
         {
            _loc6_ = GameInstance.mainCharData;
            _loc7_ = _loc6_.taskInfo.getTask(param1);
            if(!_loc7_)
            {
               return [0,LanResManager.getLanCommonTextWords("您的任务列表里没有该任务")];
            }
            if(_loc5_.type == TaskType.CISHA)
            {
               if(_loc6_.dynamicTaskInfo.CISHA_TASK_STATUS != 2)
               {
                  _loc4_ = [0,LanResManager.getLanCommonTextWords("任务没有达到完成要求")];
               }
               return _loc4_;
            }
            if(param2 && _loc7_.timeOut())
            {
               return [0,LanResManager.getLanCommonTextWords("任务超时啦，不能完成")];
            }
            if(param3 && _loc6_.attributeInfo.lv < _loc5_.endTaskLevel)
            {
               return [0,LanResManager.getLanCommonTextWords("完成此任务至少需要达到") + _loc5_.receptionLevel + LanResManager.getLanCommonTextWords("级")];
            }
            if(!_loc7_.readyTargetMonster() || !_loc7_.readyTargetGoods() || !_loc7_.readyTargetNpc() || !_loc7_.readyTargetAction() || !_loc7_.readyTargetArea() || !_loc7_.readyTargetHorse() || !_loc7_.readyTargetShopping() || !_loc7_.readyTargetRecharge() || !_loc7_.readyTargetMountUpgrade() || !_loc7_.readyTargetGroup() || !_loc7_.readyTargetFriend() || !_loc7_.readyTargetEquip() || !_loc7_.readyTargetSkillLv() || !_loc7_.readyTargetAllSkillLv() || !_loc7_.readyTargetPoint() || !_loc7_.readyTargetChannel() || !_loc7_.readyTargetBuff())
            {
               return [0,LanResManager.getLanCommonTextWords("任务没有达到完成要求")];
            }
         }
         else
         {
            _loc4_ = [0,LanResManager.getLanCommonTextWords("该任务不存在")];
         }
         return _loc4_;
      }
      
      public static function checkGaveUpTask(param1:int) : Array
      {
         var _loc4_:Player = null;
         var _loc2_:Array = [1,""];
         var _loc3_:TaskRes = TaskResManager.getTaskRes(param1);
         if(_loc3_)
         {
            _loc4_ = GameInstance.mainCharData;
            if(!_loc3_.islost)
            {
               return [0,LanResManager.getLanCommonTextWords("该任务不可放弃")];
            }
            if(!_loc4_.taskInfo.hasTask(param1))
            {
               return [0,LanResManager.getLanCommonTextWords("您的任务列表里没有该任务")];
            }
         }
         else
         {
            _loc2_ = [0,LanResManager.getLanCommonTextWords("该任务不存在")];
         }
         return _loc2_;
      }
      
      public static function hasTalkedWithNpc(param1:int, param2:int) : Boolean
      {
         var _loc4_:Player = null;
         var _loc5_:CharTaskData = null;
         var _loc3_:TaskRes = TaskResManager.getTaskRes(param1);
         if(_loc3_)
         {
            _loc4_ = GameInstance.mainCharData;
            _loc5_ = _loc4_.taskInfo.getTask(param1);
            if(!_loc5_)
            {
               return false;
            }
            if(!_loc5_.readyTargetNpc(param2))
            {
               return false;
            }
            return true;
         }
         return false;
      }
   }
}

