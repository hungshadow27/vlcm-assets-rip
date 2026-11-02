package com.tgame.common.res.task
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.res.task.vo.TaskTargetPos;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.TaskActionType;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.manager.TaskManager;
   import flash.geom.Rectangle;
   
   public class TaskResManager
   {
      
      private static var taskResXML:XML;
      
      private static var taskResContainer:Object = new Object();
      
      private static var taskDialogResContainer:Object = new Object();
      
      public function TaskResManager()
      {
         super();
      }
      
      public static function parseTaskRes(param1:String) : void
      {
         var _loc2_:TaskRes = null;
         var _loc3_:XML = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         taskResXML = XML(param1);
         if(!taskResXML)
         {
            return;
         }
         for each(_loc3_ in taskResXML.tasks.task)
         {
            addTaskRes(_loc3_);
         }
      }
      
      public static function addTaskRes(param1:XML) : void
      {
         var _loc3_:TaskRes = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc12_:TaskTargetData = null;
         var _loc2_:XML = param1;
         _loc3_ = new TaskRes();
         _loc3_.id = int(Number(_loc2_.@id));
         _loc3_.name = _loc2_.name;
         _loc3_.type = int(Number(_loc2_.@type));
         _loc3_.islost = String(_loc2_.@islost) == "1" ? true : false;
         _loc3_.publishStyle = int(Number(_loc2_.@publishStyle));
         _loc3_.receptionLevel = int(Number(_loc2_.@receptionLevel));
         _loc3_.receptionUpLevel = int(Number(_loc2_.@receptionUpLevel));
         _loc3_.endTaskLevel = int(Number(_loc2_.@endTaskLevel));
         _loc3_.premiseTask = int(Number(_loc2_.@premiseTask));
         _loc3_.limitTime = int(Number(_loc2_.@limitTime));
         _loc3_.endNpc = int(Number(_loc2_.@endNpc));
         _loc3_.publishDes = _loc2_.publishDes;
         _loc3_.unEndDes = _loc2_.unEndDes;
         _loc3_.endDes = _loc2_.endDes;
         _loc3_.targetGoods = getTargetGoodsArr(_loc2_.@targetGoods);
         _loc3_.targetMonster = getTargetMonsterArr(_loc2_.@targetMonster);
         _loc3_.targetNpc = getTargetNpcArr(_loc2_.@targetNpc);
         _loc3_.targetArea = getTargetAreaArr(_loc2_.@targetArea);
         _loc3_.targetAction = getTargetActionArr(_loc2_.@targetAction);
         _loc3_.targetHorse = getTargetHorseArr(_loc2_.@targetHorse);
         _loc3_.targetShopping = getTargetShoppingArr(_loc2_.@targetShopping);
         _loc3_.targetRecharge = getTargetRechargeTTD(_loc2_.@targetRecharge);
         _loc3_.targetMountUpgrade = getTargetMountUpgradeTTD(_loc2_.@targetMountUpgrade);
         _loc3_.targetGroup = getTargetGroupTTD(_loc2_.@targetGroup);
         _loc3_.targetFriend = getTargetFriendTTD(_loc2_.@targetFriend);
         _loc3_.targetEquip = getTargetEquipTTD(_loc2_.@targetEquip);
         _loc3_.targetSkillLv = getTargetSkillLvTTD(_loc2_.@targetSkillLv);
         _loc3_.targetAllSkillLv = getTargetAllSkillLvTTD(_loc2_.@targetAllSkillLv);
         _loc3_.targetPoint = getTargetPointTTD(_loc2_.@targetPoint);
         _loc3_.targetChannel = getTargetChannelTTD(_loc2_.@targetChannel);
         _loc3_.targetBuff = getTargetBuffTTD(_loc2_.@targetBuff);
         _loc3_.goods = [];
         if(_loc2_.@goods != undefined && _loc2_.@goods != null && _loc2_.@goods != "" && _loc2_.@goods != "null")
         {
            _loc9_ = _loc2_.@goods.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
            _loc4_ = _loc9_.split(",");
            for each(_loc7_ in _loc4_)
            {
               _loc5_ = _loc7_.split("#");
               _loc12_ = new TaskTargetData(int(Number(_loc5_[0])),int(Number(_loc5_[1])));
               _loc12_.userData = int(Number(_loc5_[2]));
               _loc3_.goods.push(_loc12_);
            }
         }
         _loc3_.copper = int(Number(_loc2_.@copper));
         _loc3_.gold = int(Number(_loc2_.@gold));
         _loc3_.experience = int(Number(_loc2_.@experience));
         _loc3_.goodFeel = int(Number(_loc2_.@goodFeel));
         _loc3_.party = int(Number(_loc2_.@party));
         _loc3_.goodBad = int(Number(_loc2_.@goodBad));
         _loc3_.title = int(Number(_loc2_.@title));
         _loc3_.beginNpc = int(Number(_loc2_.@beginNpc));
         _loc3_.isRepeat = String(_loc2_.@isRepeat) == "1" ? true : false;
         _loc3_.warrepute = int(Number(_loc2_.@warrepute));
         _loc3_.buffid = int(Number(_loc2_.@buffid));
         _loc3_.bulletin = int(Number(_loc2_.@bulletin));
         _loc3_.zhenqi = int(Number(_loc2_.@zhenqi));
         _loc3_.loopTaskDifficulty = int(Number(_loc2_.@loopTaskDifficulty));
         _loc3_.loopTaskBonus = int(Number(_loc2_.@loopTaskBonus));
         _loc3_.hourseDrop = String(_loc2_.@horseDrop) == "1" ? true : false;
         _loc3_.taskTargetDes = _loc2_.taskTargetDes;
         _loc3_.loopMaxCount = _loc2_.@loopMaxCount;
         var _loc10_:Date = new Date();
         var _loc11_:Number = Number(String(_loc2_.@accept_begin_time));
         if(_loc11_ > 0)
         {
            _loc10_.time = _loc11_;
            _loc3_.accept_begin_time = LanResManager.getLanTextWords(TaskResManager,"年月日时",[_loc10_.getFullYear(),_loc10_.getMonth() + 1,_loc10_.getDate(),_loc10_.getHours()]);
         }
         else
         {
            _loc3_.accept_begin_time = "";
         }
         _loc11_ = Number(String(_loc2_.@complete_end_time));
         if(_loc11_ > 0)
         {
            _loc10_.time = _loc11_;
            _loc3_.complete_end_time = LanResManager.getLanTextWords(TaskResManager,"年月日时",[_loc10_.getFullYear(),_loc10_.getMonth() + 1,_loc10_.getDate(),_loc10_.getHours()]);
         }
         else
         {
            _loc3_.complete_end_time = "";
         }
         if(_loc3_.type == TaskType.DAY_LOOP || _loc3_.type == TaskType.DAY_YABIAO || _loc3_.type == TaskType.WEEK_LOOP || _loc3_.type == TaskType.LV_LOOP || _loc3_.type == TaskType.CISHA)
         {
            _loc3_.isLoop = true;
         }
         else
         {
            _loc3_.isLoop = false;
         }
         taskResContainer[_loc3_.id] = _loc3_;
      }
      
      public static function removeTaskRes(param1:int) : void
      {
         delete taskResContainer[param1];
      }
      
      public static function parseTaskDialogRes(param1:String) : void
      {
         var _loc3_:TaskDialogRes = null;
         var _loc4_:XML = null;
         var _loc5_:TaskTalk = null;
         var _loc6_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.dialogs.dialog)
         {
            _loc3_ = new TaskDialogRes();
            _loc3_.taskId = int(Number(_loc4_.@taskId));
            _loc3_.dialogType = int(Number(_loc4_.@dialogType));
            _loc3_.npcId = int(Number(_loc4_.@npcId));
            _loc3_.talks = [];
            for each(_loc6_ in _loc4_.children())
            {
               _loc5_ = new TaskTalk();
               _loc5_.talkType = int(Number(_loc6_.@talkType));
               _loc5_.talkNpc = int(Number(_loc6_.@talkNpc)) != 0 ? int(Number(_loc6_.@talkNpc)) : _loc3_.npcId;
               _loc5_.talk = _loc6_;
               _loc3_.talks.push(_loc5_);
            }
            taskDialogResContainer[_loc3_.taskId + "_" + _loc3_.dialogType + "_" + _loc3_.npcId] = _loc3_;
         }
      }
      
      public static function getTaskRes(param1:int) : TaskRes
      {
         return taskResContainer[param1];
      }
      
      public static function getOriginalTaskResXML(param1:int) : XML
      {
         var _loc2_:XML = null;
         for each(_loc2_ in taskResXML.tasks.task)
         {
            if(int(Number(_loc2_.@id)) == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function recoveryTaskRes(param1:int) : void
      {
         var _loc2_:XML = getOriginalTaskResXML(param1);
         if(_loc2_ != null)
         {
            addTaskRes(_loc2_);
         }
         else
         {
            removeTaskRes(param1);
         }
      }
      
      public static function getTaskDialogRes(param1:int, param2:int, param3:int) : TaskDialogRes
      {
         return taskDialogResContainer[param1 + "_" + param2 + "_" + param3];
      }
      
      public static function getTargetMonsterArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.split("#");
            _loc3_.push(new TaskTargetData(_loc5_[0],int(Number(_loc5_[1])),_loc5_[2],null,param2 ? TaskTargetPos.fromSplitString(_loc5_[3],"_") : new TaskTargetPos(0,0,0,0)));
         }
         return _loc3_;
      }
      
      public static function getTargetGoodsArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.split("#");
            _loc3_.push(new TaskTargetData(_loc5_[0],int(Number(_loc5_[1])),_loc5_[2],null,param2 ? TaskTargetPos.fromSplitString(_loc5_[3],"_") : new TaskTargetPos(0,0,0,0)));
         }
         return _loc3_;
      }
      
      public static function getTargetNpcArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc5_:String = null;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "0" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc5_ in _loc4_)
         {
            _loc3_.push(new TaskTargetData(int(Number(_loc5_)),1,"",null,new TaskTargetPos(0,0,0,0)));
         }
         return _loc3_;
      }
      
      public static function getTargetAreaArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc7_ in _loc4_)
         {
            _loc5_ = _loc7_.split("#");
            _loc6_ = [];
            for each(_loc8_ in _loc5_[1].split("_"))
            {
               _loc6_[_loc6_.length] = int(Number(_loc8_));
            }
            _loc3_.push(new TaskTargetData(int(Number(_loc5_[0])),1,"",new Rectangle(_loc6_[0],_loc6_[1],_loc6_[2],_loc6_[3]),param2 ? TaskTargetPos.fromSplitString(_loc5_[2],"_") : new TaskTargetPos(0,0,0,0)));
         }
         return _loc3_;
      }
      
      public static function getTargetActionArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc5_:String = null;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "0" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc5_ in _loc4_)
         {
            _loc3_.push(new TaskTargetData(int(Number(_loc5_)),1,TaskActionType.getNameByValue(int(Number(_loc5_))),null,new TaskTargetPos(0,0,0,0)));
         }
         return _loc3_;
      }
      
      public static function getTargetHorseArr(param1:String, param2:Boolean = true) : Array
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.split("#");
            _loc3_.push(new TaskTargetData(_loc5_[0],int(Number(_loc5_[1])),_loc5_[2],null,param2 ? TaskTargetPos.fromSplitString(_loc5_[3],"_") : new TaskTargetPos(0,0,0,0)));
         }
         return _loc3_;
      }
      
      public static function getTargetShoppingArr(param1:String) : Array
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc2_:Boolean = false;
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return [];
         }
         param1 = param1.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
         var _loc3_:Array = [];
         var _loc4_:Array = param1.split(",");
         for each(_loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.split("#");
            _loc3_.push(new TaskTargetData(_loc5_[0],int(Number(_loc5_[1])),_loc5_[2],null,_loc2_ ? TaskTargetPos.fromSplitString(_loc5_[3],"_") : new TaskTargetPos(0,0,0,0)));
         }
         return _loc3_;
      }
      
      public static function getTargetRechargeTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         return new TaskTargetData(0,int(Number(param1)),LanResManager.getLanCommonTextWords("元宝"),null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetMountUpgradeTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         return new TaskTargetData(0,1,LanResManager.getLanCommonTextWords("将“的卢马”进阶为“金甲神牛”"),null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetGroupTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         return new TaskTargetData(0,int(Number(param1)),LanResManager.getLanCommonTextWords("队伍人数"),null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetFriendTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         return new TaskTargetData(0,int(Number(param1)),LanResManager.getLanCommonTextWords("好友人数"),null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetEquipTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         var _loc2_:Array = param1.split("#");
         var _loc3_:int = parseInt(_loc2_[0]);
         var _loc4_:String = ItemPositionRange.getEquipTypeName(_loc3_);
         var _loc5_:int = parseInt(_loc2_[1]);
         var _loc6_:String = _loc2_[2];
         return new TaskTargetData(0,1,_loc5_ != 0 ? _loc6_ : _loc4_,new Rectangle(_loc3_,_loc5_,0,0),new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetSkillLvTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         var _loc2_:Array = param1.split("#");
         var _loc3_:int = parseInt(_loc2_[0]);
         var _loc4_:int = parseInt(_loc2_[1]);
         var _loc5_:String = _loc2_[2];
         return new TaskTargetData(0,1,"[" + _loc5_ + "]" + LanResManager.getLanCommonTextWords("等级"),new Rectangle(_loc3_,_loc4_,0,0),new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetAllSkillLvTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         return new TaskTargetData(0,int(Number(param1)),LanResManager.getLanCommonTextWords("角色全体武功层数"),null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetPointTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         var _loc2_:Array = param1.split("#");
         var _loc3_:int = parseInt(_loc2_[0]);
         var _loc4_:String = _loc2_[1];
         return new TaskTargetData(_loc3_,1,LanResManager.getLanCommonTextWords("冲开穴位") + "[" + _loc4_ + "]",null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetChannelTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         var _loc2_:Array = param1.split("#");
         var _loc3_:int = parseInt(_loc2_[0]);
         var _loc4_:String = _loc2_[1];
         return new TaskTargetData(_loc3_,1,LanResManager.getLanCommonTextWords("打通经脉") + "[" + _loc4_ + "]",null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getTargetBuffTTD(param1:String) : TaskTargetData
      {
         if(param1 == undefined || param1 == null || param1 == "" || param1 == "null" || param1 == "undefined")
         {
            return null;
         }
         var _loc2_:Array = param1.split("#");
         var _loc3_:int = parseInt(_loc2_[0]);
         var _loc4_:String = _loc2_[1];
         return new TaskTargetData(_loc3_,1,LanResManager.getLanCommonTextWords("获得BUFF") + "[" + _loc4_ + "]",null,new TaskTargetPos(0,0,0,0));
      }
      
      public static function getAcceptableTaskResListByNpc(param1:int) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = NpcResManager.getTaskIDListByNpcID(param1);
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return [];
         }
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            if(TaskManager.checkAcceptableTask(_loc4_,false)[0] == 1)
            {
               _loc3_[_loc3_.length] = getTaskRes(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function getHandInTaskResListByNpc(param1:int) : Array
      {
         var _loc3_:TaskRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskResContainer)
         {
            if(_loc3_.endNpc == param1)
            {
               if(TaskManager.checkHandInTask(_loc3_.id,false,true)[0] == 1)
               {
                  _loc2_[_loc2_.length] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function getActivateTaskResListByNpcID(param1:int) : Array
      {
         var _loc3_:TaskRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskResContainer)
         {
            if(_loc3_.endNpc == param1)
            {
               if(TaskManager.hasTask(_loc3_.id) && TaskManager.checkHandInTask(_loc3_.id,false,true)[0] == 0)
               {
                  _loc2_[_loc2_.length] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function getDialogTaskResListByNpcID(param1:int) : Array
      {
         var _loc3_:TaskRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskResContainer)
         {
            if(_loc3_.getTargetNpc(param1))
            {
               if(TaskManager.hasTask(_loc3_.id) && !TaskManager.hasTalkedWithNpc(_loc3_.id,param1))
               {
                  _loc2_[_loc2_.length] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function getAcceptableLoopTaskResListByType(param1:int = -1) : Array
      {
         var _loc3_:TaskRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskResContainer)
         {
            if(_loc3_.isLoop == true)
            {
               if((param1 == -1 || _loc3_.type == param1) && _loc3_.type != TaskType.CISHA)
               {
                  if(TaskManager.checkAcceptableTask(_loc3_.id,false)[0] == 1)
                  {
                     _loc2_[_loc2_.length] = _loc3_;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public static function getAcceptableTaskResListByType(param1:int = -1) : Array
      {
         var _loc3_:TaskRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskResContainer)
         {
            if(param1 == -1 || _loc3_.type == param1)
            {
               if(TaskManager.checkAcceptableTask(_loc3_.id,false)[0] == 1)
               {
                  _loc2_[_loc2_.length] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function getHandInTaskResListByType(param1:int = -1) : Array
      {
         var _loc3_:TaskRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskResContainer)
         {
            if(param1 == -1 || _loc3_.type == param1)
            {
               if(TaskManager.checkHandInTask(_loc3_.id,false,true)[0] == 1)
               {
                  _loc2_[_loc2_.length] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function getActivateTaskResListByType(param1:int = -1) : Array
      {
         var _loc3_:TaskRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in taskResContainer)
         {
            if(param1 == -1 || _loc3_.type == param1)
            {
               if(TaskManager.hasTask(_loc3_.id) && TaskManager.checkHandInTask(_loc3_.id,false,true)[0] == 0)
               {
                  _loc2_[_loc2_.length] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
   }
}

