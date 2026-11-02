package com.tgame.manager
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.achieve.AchieveResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.res.task.vo.TaskTargetPos;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.TaskTargetType;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.NPC;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.DynamicTaskInfo;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.common.vo.character.info.data.CharEndTaskData;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.manager.TimerManager;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class TaskTracker
   {
      
      private static var _timerData:TimerData;
      
      public static const TASK_GREEN:String = "#72923C";
      
      public static const TASK_ORANGE:String = "#E2901B";
      
      public static const TASK_YELLOW:String = "#FFD700";
      
      public static const TASK_GREEN2:String = "#00ff00";
      
      public static const TASK_RED:String = "#FF0000";
      
      public static const TASK_BLUE:String = "#00B0F0";
      
      public function TaskTracker()
      {
         super();
      }
      
      public static function doTask(param1:int, param2:*) : void
      {
         var _loc4_:Array = null;
         if(!FacadeManager.hasFacade(PipeConstants.STARTUP_TASK))
         {
            return;
         }
         var _loc3_:Array = getTaskDataListByTargetType(param1,param2);
         if(_loc3_)
         {
            for each(_loc4_ in _loc3_)
            {
               PipeManager.sendMsg(PipeConstants.TASK_UPDATE_CMD,[_loc4_[0],param1,_loc4_[1]]);
            }
         }
      }
      
      public static function receivedTaskRequiredGoods(param1:int, param2:int, param3:*) : void
      {
         if(!FacadeManager.hasFacade(PipeConstants.STARTUP_TASK))
         {
            return;
         }
         var _loc4_:CharTaskData = TaskManager.taskInfo.getTask(param1);
         if(!_loc4_)
         {
            return;
         }
         switch(param2)
         {
            case TaskTargetType.TARGET_MONSTER:
               _loc4_.targetMonster = TaskResManager.getTargetMonsterArr(param3,false);
               break;
            case TaskTargetType.TARGET_NPC:
               _loc4_.targetNpc = TaskResManager.getTargetNpcArr(param3,false);
               break;
            case TaskTargetType.TARGET_AREA:
               _loc4_.targetArea = TaskResManager.getTargetAreaArr(param3,false);
               break;
            case TaskTargetType.TARGET_ACTION:
               _loc4_.targetAction = TaskResManager.getTargetActionArr(param3,false);
               break;
            case TaskTargetType.TRARGET_SHOPPING:
               _loc4_.targetShopping = TaskResManager.getTargetShoppingArr(param3);
               break;
            case TaskTargetType.TRARGET_RECHARGE:
               _loc4_.targetRecharge = TaskResManager.getTargetRechargeTTD(param3);
               break;
            case TaskTargetType.TRARGET_MOUNT_UPGRADE:
               _loc4_.targetMountUpgrade = TaskResManager.getTargetMountUpgradeTTD(param3);
         }
         updateTaskUI();
      }
      
      public static function updateTaskUI(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true, param5:Boolean = false) : void
      {
         if(_timerData != null)
         {
            TimerManager.deleteTimer(_timerData);
            _timerData = null;
         }
         _timerData = TimerManager.createTimer(200,1,doUpdateTaskUI,[param1,param2,param3,param4,param5]);
      }
      
      private static function doUpdateTaskUI(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true, param5:Boolean = false) : void
      {
         var _loc7_:CharTaskData = null;
         var _loc8_:TaskRes = null;
         if(_timerData != null)
         {
            TimerManager.deleteTimer(_timerData);
            _timerData = null;
         }
         if(!FacadeManager.hasFacade(PipeConstants.STARTUP_TASK))
         {
            return;
         }
         if(param1)
         {
            updateTaskListForUI();
         }
         if(param2)
         {
            updateTaskTrackerForUI();
         }
         if(param3)
         {
            updateTaskListForNPC();
         }
         if(param4)
         {
            updateTaskTrackerForNPC();
         }
         var _loc6_:Array = [];
         for each(_loc7_ in GameInstance.mainCharData.taskInfo.taskArr)
         {
            if(TaskManager.checkHandInTask(_loc7_.taskID,false,false)[0] == 1)
            {
               _loc8_ = TaskResManager.getTaskRes(_loc7_.taskID);
               if(_loc8_.targetMonster.length > 0 || _loc8_.targetGoods.length > 0)
               {
                  _loc6_.push(_loc7_);
               }
            }
         }
         if(_loc6_.length > 0)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_TASK_TARGET_COMPLETE,_loc6_);
         }
         if(param5)
         {
            _loc6_ = TaskResManager.getAcceptableTaskResListByType(TaskType.LATERAL);
            if(_loc6_.length > 0)
            {
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHIXIAN_TASK_APPECTABLE,_loc6_);
            }
         }
      }
      
      private static function updateTaskListForUI() : void
      {
         var _loc1_:XML = null;
         var _loc2_:XML = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:* = undefined;
         var _loc8_:TaskRes = null;
         var _loc15_:Array = null;
         var _loc16_:String = null;
         var _loc17_:XML = null;
         var _loc18_:Array = null;
         var _loc19_:CharTaskData = null;
         var _loc20_:Object = null;
         var _loc21_:CharTaskData = null;
         var _loc22_:int = 0;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:int = 0;
         var _loc26_:Array = null;
         var _loc27_:XML = null;
         var _loc28_:CharEndTaskData = null;
         var _loc5_:Array = TaskType.valueName;
         var _loc9_:String = LanResManager.getLanCommonTextWords("任务");
         var _loc10_:String = LanResManager.getLanCommonTextWords("进行中");
         var _loc11_:String = LanResManager.getLanCommonTextWords("可交");
         var _loc12_:String = LanResManager.getLanCommonTextWords("未接");
         var _loc13_:String = LanResManager.getLanCommonTextWords("已失败");
         var _loc14_:String = LanResManager.getLanCommonTextWords("已超时");
         if(GameState.taskPlaneTabStatus == 1)
         {
            _loc1_ = <node label="root"/>;
            for each(_loc6_ in _loc5_)
            {
               _loc4_ = TaskManager.getTaskListByType(_loc6_[0]);
               if(_loc4_.length > 0)
               {
                  _loc16_ = _loc9_ + _loc6_[1] + "(" + _loc4_.length + ")";
                  _loc17_ = <node label="" showLabel={_loc16_}/>;
                  _loc1_.appendChild(_loc17_);
                  _loc18_ = [];
                  for each(_loc19_ in _loc4_)
                  {
                     _loc18_.push({
                        "level":_loc19_.taskRes.receptionLevel,
                        "task":_loc19_
                     });
                  }
                  _loc18_.sortOn("level",Array.NUMERIC);
                  _loc4_ = [];
                  for each(_loc20_ in _loc18_)
                  {
                     _loc4_.push(_loc20_.task);
                  }
                  var _loc31_:int = 0;
                  var _loc32_:* = _loc4_;
                  for(; §§hasnext(_loc32_,_loc31_); _loc16_ = "[" + _loc8_.receptionLevel + "]" + _loc8_.name + _loc23_ + "(" + _loc24_ + ")",_loc17_.appendChild(<node label={_loc8_.id} showLabel={_loc16_} state={_loc22_}/>))
                  {
                     _loc7_ = §§nextvalue(_loc31_,_loc32_);
                     _loc21_ = _loc7_ as CharTaskData;
                     _loc8_ = _loc21_.taskRes;
                     _loc22_ = TaskManager.checkHandInTask(_loc8_.id,false,true)[0] == 1 ? 2 : 1;
                     _loc23_ = _loc8_.isLoop ? "(" + _loc21_.currentLoop + "/" + _loc8_.loopMaxCount + ")" : "";
                     _loc24_ = _loc22_ == 1 ? _loc10_ : _loc11_;
                     if(_loc8_.id != DynamicTaskInfo.CISHA_TASK_ID)
                     {
                        continue;
                     }
                     switch(GameInstance.mainCharData.dynamicTaskInfo.CISHA_TASK_STATUS)
                     {
                        case 1:
                           _loc22_ = 1;
                           _loc24_ = _loc10_;
                           break;
                        case 2:
                           _loc22_ = 2;
                           _loc24_ = _loc11_;
                           break;
                        case 3:
                           _loc22_ = 1;
                           _loc24_ = _loc14_;
                           break;
                        case 4:
                           _loc22_ = 1;
                           _loc24_ = _loc13_;
                     }
                  }
               }
            }
            _loc15_ = [];
            if(GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao() || GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao())
            {
               _loc25_ = (GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao() ? 1 : 0) + (GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao() ? 1 : 0);
               _loc16_ = LanResManager.getLanCommonTextWords("帮会任务") + "(" + _loc25_ + ")";
               _loc17_ = <node label="" showLabel={_loc16_}/>;
               _loc1_.appendChild(_loc17_);
               if(GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao())
               {
                  _loc22_ = GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_HANDIN ? 2 : 1;
                  _loc24_ = _loc22_ == 1 ? _loc10_ : _loc11_;
                  if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE)
                  {
                     _loc24_ = _loc10_;
                  }
                  else if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_FAIL)
                  {
                     _loc24_ = _loc13_;
                  }
                  else if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT)
                  {
                     _loc24_ = _loc14_;
                  }
                  else
                  {
                     _loc24_ = _loc11_;
                  }
                  _loc16_ = "[0]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + _loc24_ + ")";
                  _loc17_.appendChild(<node label={YabiaoInfo.SELF_ID} showLabel={_loc16_} state={_loc22_}/>);
               }
               if(GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao())
               {
                  _loc22_ = GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_HANDIN ? 2 : 1;
                  _loc24_ = _loc22_ == 1 ? _loc10_ : _loc11_;
                  if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE)
                  {
                     _loc24_ = _loc10_;
                  }
                  else if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_FAIL)
                  {
                     _loc24_ = _loc13_;
                  }
                  else if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT)
                  {
                     _loc24_ = _loc14_;
                  }
                  else
                  {
                     _loc24_ = _loc11_;
                  }
                  _loc16_ = "[0]" + LanResManager.getLanCommonTextWords("帮会押镖任务") + "(" + _loc24_ + ")";
                  _loc17_.appendChild(<node label={YabiaoInfo.BANGHUI_ID} showLabel={_loc16_} state={_loc22_}/>);
               }
            }
         }
         else if(GameState.taskPlaneTabStatus == 2)
         {
            _loc2_ = <node label="root"/>;
            for each(_loc6_ in _loc5_)
            {
               _loc4_ = TaskResManager.getAcceptableTaskResListByType(_loc6_[0]);
               if(_loc4_.length > 0)
               {
                  _loc16_ = _loc9_ + _loc6_[1] + "(" + _loc4_.length + ")";
                  _loc27_ = <node label="" showLabel={_loc16_}/>;
                  _loc2_.appendChild(_loc27_);
                  _loc4_ = _loc4_.sortOn("receptionLevel",Array.NUMERIC);
                  for each(_loc7_ in _loc4_)
                  {
                     _loc8_ = _loc7_ as TaskRes;
                     _loc22_ = 0;
                     _loc23_ = "";
                     if(_loc8_.isLoop)
                     {
                        _loc28_ = TaskManager.getEndTask(_loc8_.id);
                        if(_loc28_ != null)
                        {
                           _loc23_ = "(" + (_loc28_.currentLoop + 1) + "/" + _loc8_.loopMaxCount + ")";
                        }
                        else
                        {
                           _loc23_ = "(1/" + _loc8_.loopMaxCount + ")";
                        }
                     }
                     _loc24_ = _loc12_;
                     _loc16_ = "[" + _loc8_.receptionLevel + "]" + _loc8_.name + _loc23_ + "(" + _loc24_ + ")";
                     _loc27_.appendChild(<node label={_loc8_.id} showLabel={_loc16_} state={_loc22_}/>);
                  }
               }
            }
            _loc26_ = [];
            if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
            {
               _loc25_ = (GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE ? 1 : 0) + (GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE ? 1 : 0);
               _loc16_ = LanResManager.getLanCommonTextWords("帮会任务") + "(" + _loc25_ + ")";
               _loc27_ = <node label="" showLabel={_loc16_}/>;
               _loc2_.appendChild(_loc27_);
               if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
               {
                  _loc22_ = 0;
                  _loc24_ = _loc12_;
                  _loc16_ = "[0]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + _loc24_ + ")";
                  _loc27_.appendChild(<node label={YabiaoInfo.SELF_ID} showLabel={_loc16_} state={_loc22_}/>);
               }
               if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
               {
                  _loc22_ = 0;
                  _loc24_ = _loc12_;
                  _loc16_ = "[0]" + LanResManager.getLanCommonTextWords("帮会押镖任务") + "(" + _loc24_ + ")";
                  _loc27_.appendChild(<node label={YabiaoInfo.BANGHUI_ID} showLabel={_loc16_} state={_loc22_}/>);
               }
            }
         }
         PipeManager.sendMsg(PipeConstants.TASK_UPDATE_TASKLIST,[_loc1_,_loc2_]);
      }
      
      private static function updateTaskTrackerForUI() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:CharTaskData = null;
         var _loc6_:Object = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         if(GameState.taskTrackerPlaneTabStatus == 1)
         {
            _loc3_ = TaskManager.getTaskListByType(TaskType.MAIN);
            _loc4_ = [];
            for each(_loc5_ in _loc3_)
            {
               _loc4_.push({
                  "type":_loc5_.taskRes.type,
                  "level":_loc5_.taskRes.receptionLevel,
                  "task":_loc5_
               });
            }
            _loc4_.sortOn(["level"],[Array.NUMERIC]);
            _loc3_ = [];
            for each(_loc6_ in _loc4_)
            {
               _loc3_.push(_loc6_.task);
            }
            _loc7_ = TaskManager.getTaskListByType(TaskType.LATERAL);
            _loc4_ = [];
            for each(_loc5_ in _loc7_)
            {
               _loc4_.push({
                  "type":_loc5_.taskRes.type,
                  "level":_loc5_.taskRes.receptionLevel,
                  "task":_loc5_
               });
            }
            _loc4_.sortOn(["level"],[Array.NUMERIC]);
            _loc7_ = [];
            for each(_loc6_ in _loc4_)
            {
               _loc7_.push(_loc6_.task);
            }
            _loc8_ = TaskManager.getLoopTaskListByType();
            _loc4_ = [];
            for each(_loc5_ in _loc8_)
            {
               _loc4_.push({
                  "type":_loc5_.taskRes.type,
                  "level":_loc5_.taskRes.receptionLevel,
                  "task":_loc5_
               });
            }
            _loc4_.sortOn(["level"],[Array.NUMERIC]);
            _loc8_ = [];
            for each(_loc6_ in _loc4_)
            {
               _loc8_.push(_loc6_.task);
            }
            _loc9_ = TaskResManager.getAcceptableTaskResListByType(TaskType.MAIN);
            _loc9_.sortOn(["receptionLevel"],[Array.NUMERIC]);
            _loc10_ = TaskResManager.getAcceptableLoopTaskResListByType();
            _loc10_.sortOn(["receptionLevel"],[Array.NUMERIC]);
            _loc11_ = TaskManager.getTaskListByType(TaskType.CISHA);
            _loc4_ = [];
            for each(_loc5_ in _loc11_)
            {
               _loc4_.push({
                  "type":_loc5_.taskRes.type,
                  "level":_loc5_.taskRes.receptionLevel,
                  "task":_loc5_
               });
            }
            _loc4_.sortOn(["level"],[Array.NUMERIC]);
            _loc11_ = [];
            for each(_loc6_ in _loc4_)
            {
               _loc11_.push(_loc6_.task);
            }
            _loc1_ = [_loc3_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_];
         }
         else if(GameState.taskTrackerPlaneTabStatus == 2)
         {
            _loc12_ = TaskResManager.getAcceptableTaskResListByType(TaskType.MAIN);
            _loc12_.sortOn(["receptionLevel"],[Array.NUMERIC]);
            _loc13_ = TaskResManager.getAcceptableTaskResListByType(TaskType.LATERAL);
            _loc13_.sortOn(["receptionLevel"],[Array.NUMERIC]);
            _loc14_ = TaskResManager.getAcceptableLoopTaskResListByType();
            _loc14_.sortOn(["receptionLevel"],[Array.NUMERIC]);
            _loc15_ = TaskResManager.getAcceptableTaskResListByType(TaskType.CISHA);
            _loc15_.sortOn(["receptionLevel"],[Array.NUMERIC]);
            _loc2_ = [_loc12_,_loc13_,_loc14_,_loc15_];
         }
         PipeManager.sendMsg(PipeConstants.TASK_UPDATE_TASKTRACKER,[_loc1_,_loc2_]);
      }
      
      private static function updateTaskListForNPC() : void
      {
         var _loc8_:TaskRes = null;
         var _loc9_:TaskRes = null;
         var _loc1_:SceneCharacter = GameInstance.lockOnChar;
         if(!_loc1_ || _loc1_.type != SceneCharacterType.NPC)
         {
            return;
         }
         var _loc2_:NPC = _loc1_.data as NPC;
         var _loc3_:int = _loc1_.id;
         var _loc4_:Array = TaskResManager.getAcceptableTaskResListByNpc(_loc3_);
         var _loc5_:Array = TaskResManager.getActivateTaskResListByNpcID(_loc3_);
         var _loc6_:Array = TaskResManager.getHandInTaskResListByNpc(_loc3_);
         var _loc7_:Array = TaskResManager.getDialogTaskResListByNpcID(_loc3_);
         var _loc10_:* = int(_loc5_.length);
         while(_loc10_-- > 0)
         {
            _loc8_ = _loc5_[_loc10_];
            for each(_loc9_ in _loc7_)
            {
               if(_loc8_ == _loc9_)
               {
                  _loc5_.splice(_loc10_,1);
               }
            }
         }
         PipeManager.sendMsg(PipeConstants.TASK_UPDATE_NPC,[_loc1_,_loc4_,_loc5_,_loc6_,_loc7_]);
      }
      
      private static function updateTaskTrackerForNPC() : void
      {
         var _loc9_:TaskRes = null;
         var _loc11_:int = 0;
         var _loc12_:TaskTargetData = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = GameConfig.wantEnterMapRes.id;
         var _loc6_:Array = TaskResManager.getAcceptableTaskResListByType();
         var _loc7_:Array = TaskResManager.getActivateTaskResListByType();
         var _loc8_:Array = TaskResManager.getHandInTaskResListByType();
         var _loc10_:Array = NpcResManager.getNpcIDandTaskIDArrBySceneID(_loc5_);
         if(_loc6_)
         {
            for each(_loc9_ in _loc6_)
            {
               _loc11_ = 0;
               while(_loc11_ < _loc10_.length)
               {
                  if((_loc10_[_loc11_][1] as Array).indexOf(_loc9_.id) != -1)
                  {
                     if(_loc1_.indexOf(_loc10_[_loc11_][0]) == -1)
                     {
                        _loc1_[_loc1_.length] = _loc10_[_loc11_][0];
                     }
                     _loc10_.splice(_loc11_,1);
                  }
                  _loc11_++;
               }
            }
         }
         if(_loc7_)
         {
            for each(_loc9_ in _loc7_)
            {
               if(_loc2_.indexOf(_loc9_.endNpc) == -1)
               {
                  _loc2_[_loc2_.length] = _loc9_.endNpc;
               }
               if(Boolean(_loc9_.targetNpc) && _loc9_.targetNpc.length > 0)
               {
                  for each(_loc12_ in _loc9_.targetNpc)
                  {
                     if(!TaskManager.getTask(_loc9_.id).readyTargetNpc(_loc12_.id) && _loc4_.indexOf(_loc12_.id) == -1)
                     {
                        _loc4_[_loc4_.length] = _loc12_.id;
                     }
                  }
               }
            }
         }
         if(_loc8_)
         {
            for each(_loc9_ in _loc8_)
            {
               if(_loc3_.indexOf(_loc9_.endNpc) == -1)
               {
                  _loc3_[_loc3_.length] = _loc9_.endNpc;
               }
            }
         }
         if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
         {
            _loc1_.push(YabiaoInfo.ACCEPT_NPC_ID);
         }
         if(GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao() || GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao())
         {
            _loc3_.push(GameInstance.mainCharData.yabiaoInfo.yabiaoNpc);
         }
         PipeManager.sendMsg(PipeConstants.TASK_UPDATE_ALL_NPC_STATUS,[_loc1_,_loc2_,_loc3_,_loc4_]);
      }
      
      private static function getTaskDataListByTargetType(param1:int, param2:*) : Array
      {
         var _loc5_:CharTaskData = null;
         var _loc6_:SceneCharacter = null;
         var _loc7_:int = 0;
         var _loc3_:Array = TaskManager.taskInfo.taskArr;
         var _loc4_:Array = [];
         switch(param1)
         {
            case TaskTargetType.TARGET_MONSTER:
               if(isNaN(param2))
               {
                  return null;
               }
               _loc6_ = GameInstance.scene.getCharByID(param2,SceneCharacterType.MONSTER);
               if(_loc6_)
               {
                  _loc7_ = Monster(_loc6_.data).res.id_kind;
                  for each(_loc5_ in _loc3_)
                  {
                     if(Boolean(_loc5_.taskRes.getTargetMonster(_loc7_)) && !_loc5_.readyTargetMonster(_loc7_))
                     {
                        _loc4_[_loc4_.length] = [_loc5_.taskID,param2];
                     }
                  }
               }
               break;
            case TaskTargetType.TARGET_NPC:
               if(isNaN(param2))
               {
                  return null;
               }
               for each(_loc5_ in _loc3_)
               {
                  if(Boolean(_loc5_.taskRes.getTargetNpc(param2)) && !_loc5_.readyTargetNpc(param2))
                  {
                     _loc4_[_loc4_.length] = [_loc5_.taskID,param2];
                  }
               }
               break;
            case TaskTargetType.TARGET_AREA:
               if(!(param2 is Array) || param2.length != 2 || !(param2[1] is Point))
               {
                  return null;
               }
               for each(_loc5_ in _loc3_)
               {
                  if(Boolean(_loc5_.taskRes.getTargetArea(Number(param2[0]),null,param2[1])) && !_loc5_.readyTargetArea(Number(param2[0])))
                  {
                     _loc4_[_loc4_.length] = [_loc5_.taskID,Number(param2[0])];
                  }
               }
               break;
            case TaskTargetType.TARGET_ACTION:
               if(isNaN(param2))
               {
                  return null;
               }
               for each(_loc5_ in _loc3_)
               {
                  if(Boolean(_loc5_.taskRes.getTargetAction(param2)) && !_loc5_.readyTargetAction(param2))
                  {
                     _loc4_[_loc4_.length] = [_loc5_.taskID,param2];
                  }
               }
         }
         return _loc4_;
      }
      
      public static function doTaskNextBehavior(param1:int) : void
      {
         var _loc3_:Player = null;
         var _loc4_:CharTaskData = null;
         var _loc5_:NpcRes = null;
         var _loc6_:TaskTargetPos = null;
         var _loc7_:TaskTargetData = null;
         if(!FacadeManager.hasFacade(PipeConstants.STARTUP_TASK))
         {
            return;
         }
         var _loc2_:TaskRes = TaskResManager.getTaskRes(param1);
         if(_loc2_)
         {
            _loc3_ = GameInstance.mainCharData;
            _loc4_ = _loc3_.taskInfo.getTask(param1);
            if(!_loc4_)
            {
               _loc5_ = NpcResManager.getNpcRes(_loc2_.acceptNpc);
               if(_loc5_)
               {
                  MainCharSeachPathManager.mainCharWalk(_loc5_.id_kind);
                  return;
               }
               return;
            }
            if(_loc4_.timeOut())
            {
               NoticeManager.notify(NoticeManager.ALERT,"任务超时啦，不能继续");
               return;
            }
            _loc7_ = _loc4_.nextTargetMonster();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextTargetGoods();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextTargetArea();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextTargetAction();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextTargetMount();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextTargetNpc();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.id);
               return;
            }
            _loc7_ = _loc4_.nextTargetShopping();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextTargetRecharge();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextMountUpgrade();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextGroup();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextFriend();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextEquip();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextSkillLv();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextAllSkillLv();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextPoint();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextChannel();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc7_ = _loc4_.nextBuff();
            if(_loc7_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc7_.pos.toSplitString(","));
               return;
            }
            _loc5_ = NpcResManager.getNpcRes(_loc2_.endNpc);
            if(_loc5_)
            {
               MainCharSeachPathManager.mainCharWalk(_loc5_.id_kind);
               return;
            }
            return;
         }
         NoticeManager.notify(NoticeManager.ALERT,"该任务不存在");
      }
      
      public static function convertHtmlStr(param1:String) : String
      {
         var _loc2_:String = param1;
         _loc2_ = _loc2_.replace(/{\s*link\s*\$\s*findPath\s*#\s*scene\s*:\s*([\-\d]+)\s*,\s*x\s*:\s*([\-\d]+)\s*,\s*y\s*:\s*([\-\d]+)\s*,\s*dis\s*:\s*([\-\d]+)\s*,\s*npc\s*:\s*([\-\d]+)\s*}/gi,"<u><font color=\'" + StaticValue.GREEN_HTML + "\'> <a href=\"event:findPath#$1,$2,$3,$4,$5\">");
         _loc2_ = _loc2_.replace(/{\s*link\s*#\s*scene\s*:\s*([\-\d]+)\s*,\s*x\s*:\s*([\-\d]+)\s*,\s*y\s*:\s*([\-\d]+)\s*,\s*dis\s*:\s*([\-\d]+)\s*,\s*npc\s*:\s*([\-\d]+)\s*}/gi,"<u><font color=\'" + StaticValue.GREEN_HTML + "\'> <a href=\"event:findPath#$1,$2,$3,$4,$5\">");
         _loc2_ = _loc2_.replace(/{\s*link\s*\$\s*link$goodsTip\s*#\s*goodsID\s*:\s*([\-\d]+)\s*}/g,"<u><font color=\'" + StaticValue.GREEN_HTML + "\'> <a href=\"event:goodsTip#$1\">");
         return _loc2_.replace(/{\s*\/\s*link\s*}/g,"</a></font></u> ");
      }
      
      public static function getAcceptNpcStr(param1:TaskRes) : String
      {
         var _loc4_:NpcRes = null;
         var _loc5_:MapRes = null;
         var _loc6_:String = null;
         if(!param1)
         {
            return "";
         }
         var _loc2_:String = "";
         var _loc3_:int = param1.acceptNpc;
         if(_loc3_ > 0)
         {
            _loc4_ = NpcResManager.getNpcRes(_loc3_);
            _loc5_ = MapTransManager.getMapRes(_loc4_.sceneid);
            _loc6_ = "[" + _loc5_.name + "]" + _loc4_.name;
            _loc2_ = "<a href=\"event:" + _loc3_ + "\">" + _loc6_ + "</a>";
         }
         else if(_loc3_ == -1)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("系统发布");
         }
         else if(_loc3_ == -2)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("道具发布");
         }
         else if(_loc3_ == -3)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("创建角色发布");
         }
         else if(_loc3_ == -4)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("奇遇发布");
         }
         return _loc2_;
      }
      
      public static function getTaskTrackStr(param1:CharTaskData, param2:String = "", param3:String = "#ffffff", param4:String = "#ff0000", param5:String = "#00ff00") : String
      {
         var _loc7_:NpcRes = null;
         var _loc9_:String = null;
         var _loc10_:TaskTargetData = null;
         var _loc11_:TaskTargetData = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:MapRes = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         if(!param1)
         {
            return "";
         }
         var _loc6_:String = "";
         var _loc8_:Boolean = true;
         if(param1.taskRes.endTaskLevel != 0)
         {
            _loc13_ = GameInstance.mainCharData.attributeInfo.lv;
            if(_loc13_ < param1.taskRes.endTaskLevel)
            {
               _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("完成等级") + "</font> ";
               _loc6_ = _loc6_ + ("<font color=\'" + param4 + "\'>(" + _loc13_ + "/" + param1.taskRes.endTaskLevel + ")(" + LanResManager.getLanCommonTextWords("未完成") + ")</font>");
               _loc8_ = false;
            }
         }
         for each(_loc10_ in param1.taskRes.targetMonster)
         {
            _loc11_ = param1.getTargetMonster(_loc10_.id);
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("击杀") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         for each(_loc10_ in param1.taskRes.targetGoods)
         {
            _loc11_ = param1.getTargetGoods(_loc10_.id);
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("收集") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         for each(_loc10_ in param1.taskRes.targetArea)
         {
            _loc11_ = param1.getTargetArea(_loc10_.id);
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? MapTransManager.getSceneNameBySceneId(_loc10_.id) : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + MapTransManager.getSceneNameBySceneId(_loc10_.id) + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("探索") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("到达") + ")" : "(" + LanResManager.getLanCommonTextWords("未到达") + ")") + "</font>");
            _loc8_ = false;
         }
         for each(_loc10_ in param1.taskRes.targetAction)
         {
            _loc11_ = param1.getTargetAction(_loc10_.id);
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("操作") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("完成") + ")" : "(" + LanResManager.getLanCommonTextWords("未完成") + ")") + "</font>");
            _loc8_ = false;
         }
         for each(_loc10_ in param1.taskRes.targetHorse)
         {
            _loc11_ = param1.getTargetHorse(_loc10_.id);
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("捕获") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         for each(_loc10_ in param1.taskRes.targetNpc)
         {
            _loc11_ = param1.getTargetNpc(_loc10_.id);
            _loc7_ = NpcResManager.getNpcRes(_loc10_.id);
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc14_ = MapTransManager.getMapRes(_loc7_.sceneid);
            _loc15_ = "[" + _loc14_.name + "]" + _loc7_.name;
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("寻找") + "</font> <u><font color=\'" + param5 + "\'><a href=\"event:" + _loc7_.id_kind + "\">" + _loc15_ + "</a></font></u>";
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("找到") + ")" : "(" + LanResManager.getLanCommonTextWords("未找到") + ")") + "</font>");
            _loc8_ = false;
         }
         for each(_loc10_ in param1.taskRes.targetShopping)
         {
            _loc11_ = param1.getTargetShopping(_loc10_.id);
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("购买") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetRecharge;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetRecharge;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("累计充值") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetMountUpgrade;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetMountUpgrade;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("完成") + ")" : "(" + LanResManager.getLanCommonTextWords("未完成") + ")") + "</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetGroup;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetGroup;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("组队") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetFriend;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetFriend;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("加友") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetEquip;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetEquip;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("佩戴") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("完成") + ")" : "(" + LanResManager.getLanCommonTextWords("未完成") + ")") + "</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetSkillLv;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetSkillLv;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + "<font color=\'" + param3 + "\'>" + LanResManager.getLanCommonTextWords("武功") + "</font> " + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetAllSkillLv;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetAllSkillLv;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>(" + (_loc11_ ? _loc11_.count : 0) + "/" + _loc10_.count + ")</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetPoint;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetPoint;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("冲开") + ")" : "(" + LanResManager.getLanCommonTextWords("未冲开") + ")") + "</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetChannel;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetChannel;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("打通") + ")" : "(" + LanResManager.getLanCommonTextWords("未打通") + ")") + "</font>");
            _loc8_ = false;
         }
         _loc10_ = param1.taskRes.targetBuff;
         if(_loc10_ != null)
         {
            _loc11_ = param1.targetBuff;
            _loc9_ = !_loc11_ || _loc11_.count < _loc10_.count ? param4 : param5;
            _loc12_ = _loc10_.pos.isNull() ? _loc10_.name : "<u><font color=\'" + param5 + "\'><a href=\"event:" + _loc10_.pos.toSplitString() + "\">" + _loc10_.name + "</a></font></u>";
            _loc6_ += (_loc8_ ? "" : "\n") + param2 + _loc12_;
            _loc6_ = _loc6_ + ("<font color=\'" + _loc9_ + "\'>" + ((_loc11_ ? _loc11_.count : 0) >= _loc10_.count ? "(" + LanResManager.getLanCommonTextWords("获得") + ")" : "(" + LanResManager.getLanCommonTextWords("未获得") + ")") + "</font>");
            _loc8_ = false;
         }
         if(param1.taskRes.taskTargetDes != "")
         {
            _loc16_ = TaskTracker.convertHtmlStr(param1.taskRes.taskTargetDes);
            if(_loc16_ != "")
            {
               _loc6_ += "\n" + param2 + _loc16_;
            }
         }
         if(param1.taskRes.accept_begin_time != "")
         {
            _loc6_ += "\n" + param2 + LanResManager.getLanCommonTextWords("起始时间") + " " + param1.taskRes.accept_begin_time;
         }
         if(param1.taskRes.complete_end_time != "")
         {
            _loc6_ += "\n" + param2 + LanResManager.getLanCommonTextWords("截止时间") + " " + param1.taskRes.complete_end_time;
         }
         return _loc6_;
      }
      
      public static function setLeaveTimeCallBack(param1:*, param2:int, param3:TextField, param4:String = "", param5:String = "", param6:String = "") : void
      {
         var updateTime_for_plane:Function;
         var timeStr:String = null;
         var leaveTime:Number = NaN;
         var $task:* = param1;
         var $for:int = param2;
         var $textFiled:TextField = param3;
         var $frontStr:String = param4;
         var $backStr:String = param5;
         var $textPrefix:String = param6;
         if(!$task)
         {
            return;
         }
         timeStr = "";
         if($for == 1)
         {
            $task.updateTime_for_taskList = null;
         }
         else if($for == 2)
         {
            $task.updateTime_for_taskTracker = null;
         }
         if($task.timeOut())
         {
            timeStr = $textPrefix + "<font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务已超时") + "</font><br />";
            if($for == 1)
            {
               $task.updateTime_for_taskList = null;
            }
            else if($for == 2)
            {
               $task.updateTime_for_taskTracker = null;
            }
         }
         else
         {
            leaveTime = Number($task.leaveTime);
            if(leaveTime > 0)
            {
               updateTime_for_plane = function(param1:Number):void
               {
                  var _loc2_:String = null;
                  var _loc3_:String = null;
                  var _loc4_:int = 0;
                  var _loc5_:int = 0;
                  var _loc6_:int = 0;
                  var _loc7_:int = 0;
                  if(param1 > 0)
                  {
                     _loc2_ = param1 > 60 ? StaticValue.GREEN_HTML : StaticValue.RED_HTML;
                     _loc3_ = "";
                     _loc4_ = Math.floor(param1 / 86400);
                     _loc5_ = Math.floor(param1 % 86400 / 3600);
                     _loc6_ = Math.floor(param1 % 86400 % 3600 / 60);
                     _loc7_ = Math.floor(param1 % 86400 % 3600 % 60);
                     _loc3_ = LanResManager.getLanTextWords(TaskTracker,"天时分秒",[_loc4_,_loc5_,_loc6_,_loc7_]);
                     timeStr = $textPrefix + "<font size=\'12\' color=\'" + _loc2_ + "\'>" + LanResManager.getLanCommonTextWords("剩余") + _loc3_ + "</font><br />";
                  }
                  else
                  {
                     timeStr = $textPrefix + "<font size=\'12\' color=\'#FF0000\'>" + LanResManager.getLanCommonTextWords("任务已超时") + "</font><br />";
                  }
                  $textFiled.htmlText = $frontStr + timeStr + $backStr;
               };
               updateTime_for_plane(leaveTime);
               if($for == 1)
               {
                  $task.updateTime_for_taskList = updateTime_for_plane;
               }
               else if($for == 2)
               {
                  $task.updateTime_for_taskTracker = updateTime_for_plane;
               }
            }
         }
         $textFiled.htmlText = $frontStr + timeStr + $backStr;
      }
      
      public static function getRewardArr(param1:int) : Array
      {
         var _loc4_:Goods = null;
         var _loc5_:TaskTargetData = null;
         var _loc2_:Array = [[],[]];
         var _loc3_:TaskRes = TaskResManager.getTaskRes(param1);
         if(_loc3_ != null)
         {
            if(_loc3_.gold > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("礼金") + " " + _loc3_.gold);
            }
            if(_loc3_.copper > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("铜币") + " " + _loc3_.copper);
            }
            if(_loc3_.experience > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("经验") + " " + _loc3_.experience);
            }
            if(_loc3_.goodFeel > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("好感") + " " + _loc3_.goodFeel);
            }
            if(_loc3_.party > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("帮贡") + " " + _loc3_.party);
            }
            if(_loc3_.goodBad > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("善恶") + " " + _loc3_.goodBad);
            }
            if(_loc3_.title > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("称号") + " " + AchieveResManager.getAchieveRes(_loc3_.title).name);
            }
            if(_loc3_.warrepute > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("声望") + " " + _loc3_.warrepute);
            }
            if(_loc3_.buffid > 0)
            {
               _loc2_[0].push("BUFF " + SkillResManager.getBuffRes(_loc3_.buffid).name);
            }
            if(_loc3_.bulletin > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("公告") + " " + _loc3_.bulletin);
            }
            if(_loc3_.zhenqi > 0)
            {
               _loc2_[0].push(LanResManager.getLanCommonTextWords("真气") + " " + _loc3_.zhenqi);
            }
            for each(_loc5_ in _loc3_.goods)
            {
               if(_loc5_.userData == 0 || _loc5_.userData == GameInstance.mainCharData.attributeInfo.partyID)
               {
                  _loc4_ = new Goods(_loc5_.id);
                  _loc4_.count = _loc5_.count;
                  _loc2_[1].push(_loc4_);
               }
            }
         }
         return _loc2_;
      }
      
      public static function goonDispatchEvent(param1:MouseEvent) : void
      {
         var _loc5_:TextFormat = null;
         var _loc6_:String = null;
         var _loc2_:TextField = param1.currentTarget as TextField;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Boolean = true;
         var _loc4_:int = _loc2_.getCharIndexAtPoint(param1.localX,param1.localY);
         if(_loc4_ != -1)
         {
            _loc5_ = param1.target.getTextFormat(_loc4_);
            _loc6_ = _loc5_.url;
            _loc3_ = _loc6_ == "";
         }
         if(_loc3_)
         {
            GameInstance.scene.sceneDispatchEvent(param1);
         }
      }
   }
}

