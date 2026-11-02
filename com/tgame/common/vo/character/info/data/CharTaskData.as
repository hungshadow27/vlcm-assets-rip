package com.tgame.common.vo.character.info.data
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.TaskTracker;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.TimerManager;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class CharTaskData
   {
      
      public var taskID:int;
      
      public var targetMonster:Array;
      
      private var _targetGoods:Array;
      
      public var targetNpc:Array;
      
      public var targetArea:Array;
      
      public var targetAction:Array;
      
      private var _targetHorse:Array;
      
      public var targetShopping:Array;
      
      public var targetRecharge:TaskTargetData;
      
      public var targetMountUpgrade:TaskTargetData;
      
      private var _targetGroup:TaskTargetData;
      
      private var _targetFriend:TaskTargetData;
      
      private var _targetEquip:TaskTargetData;
      
      private var _targetSkillLv:TaskTargetData;
      
      private var _targetAllSkillLv:TaskTargetData;
      
      private var _targetPoint:TaskTargetData;
      
      private var _targetChannel:TaskTargetData;
      
      private var _targetBuff:TaskTargetData;
      
      public var currentLoop:int;
      
      private var _leaveTime:Number;
      
      private var _timerData:TimerData;
      
      public var updateTime_for_taskList:Function;
      
      public var updateTime_for_taskTracker:Function;
      
      public function CharTaskData()
      {
         super();
         this.taskID = 0;
         this.targetMonster = [];
         this._targetGoods = [];
         this.targetNpc = [];
         this.targetArea = [];
         this.targetAction = [];
         this._targetHorse = [];
         this.targetShopping = [];
         this.targetRecharge = null;
         this.targetMountUpgrade = null;
         this._targetGroup = null;
         this._targetFriend = null;
         this._targetEquip = null;
         this._targetSkillLv = null;
         this._targetAllSkillLv = null;
         this._targetPoint = null;
         this._targetChannel = null;
         this._targetBuff = null;
         this.currentLoop = 0;
         this._leaveTime = -1;
      }
      
      public function get taskRes() : TaskRes
      {
         return TaskResManager.getTaskRes(this.taskID);
      }
      
      public function get targetGoods() : Array
      {
         var _loc1_:TaskTargetData = null;
         var _loc3_:int = 0;
         this._targetGoods = [];
         var _loc2_:String = "";
         for each(_loc1_ in this.taskRes.targetGoods)
         {
            _loc3_ = Math.min(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc1_.id,true),_loc1_.count);
            if(_loc2_ != "")
            {
               _loc2_ += ",";
            }
            _loc2_ += _loc1_.id + "#" + _loc3_ + "#" + _loc1_.name + "#" + _loc1_.pos.toSplitString("_");
         }
         this._targetGoods = TaskResManager.getTargetGoodsArr(_loc2_);
         return this._targetGoods;
      }
      
      public function get targetHorse() : Array
      {
         var _loc1_:TaskTargetData = null;
         var _loc3_:int = 0;
         this._targetHorse = [];
         var _loc2_:String = "";
         for each(_loc1_ in this.taskRes.targetHorse)
         {
            _loc3_ = Math.min(GameInstance.mainCharData.mountInfo.getMountNumByMID(_loc1_.id,this.taskRes.hourseDrop),_loc1_.count);
            if(_loc2_ != "")
            {
               _loc2_ += ",";
            }
            _loc2_ += _loc1_.id + "#" + _loc3_ + "#" + _loc1_.name + "#" + _loc1_.pos.toSplitString("_");
         }
         this._targetHorse = TaskResManager.getTargetHorseArr(_loc2_);
         return this._targetHorse;
      }
      
      public function get targetGroup() : TaskTargetData
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc1_:TaskTargetData = this.taskRes.targetGroup;
         if(_loc1_ != null)
         {
            _loc2_ = Math.min(GameInstance.mainCharData.teamInfo.teamPlayers.length,_loc1_.count);
            _loc3_ = _loc2_.toString();
            this._targetGroup = TaskResManager.getTargetGroupTTD(_loc3_);
            this._targetGroup.count = 0;
            if(_loc2_ >= _loc1_.count)
            {
               this._targetGroup.count = 1;
            }
         }
         else
         {
            this._targetGroup = null;
         }
         return this._targetGroup;
      }
      
      public function get targetFriend() : TaskTargetData
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc1_:TaskTargetData = this.taskRes.targetFriend;
         if(_loc1_ != null)
         {
            _loc2_ = Math.min(GameInstance.mainCharData.friendInfo.friends.length,_loc1_.count);
            _loc3_ = _loc2_.toString();
            this._targetFriend = TaskResManager.getTargetFriendTTD(_loc3_);
            this._targetFriend.count = 0;
            if(_loc2_ >= _loc1_.count)
            {
               this._targetFriend.count = 1;
            }
         }
         else
         {
            this._targetFriend = null;
         }
         return this._targetFriend;
      }
      
      public function get targetEquip() : TaskTargetData
      {
         var _loc2_:String = null;
         var _loc3_:Goods = null;
         var _loc1_:TaskTargetData = this.taskRes.targetEquip;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.area.x + "#" + _loc1_.area.y + "#" + _loc1_.name;
            this._targetEquip = TaskResManager.getTargetEquipTTD(_loc2_);
            this._targetEquip.count = 0;
            _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc1_.area.x);
            if(_loc3_ != null)
            {
               if(_loc1_.area.y != 0)
               {
                  if(_loc3_.id == _loc1_.area.y)
                  {
                     this._targetEquip.count = 1;
                  }
               }
               else
               {
                  this._targetEquip.count = 1;
               }
            }
         }
         else
         {
            this._targetEquip = null;
         }
         return this._targetEquip;
      }
      
      public function get targetSkillLv() : TaskTargetData
      {
         var _loc2_:String = null;
         var _loc3_:Skill = null;
         var _loc1_:TaskTargetData = this.taskRes.targetSkillLv;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.area.x + "#" + _loc1_.area.y + "#" + _loc1_.name;
            this._targetSkillLv = TaskResManager.getTargetSkillLvTTD(_loc2_);
            this._targetSkillLv.count = 0;
            _loc3_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc1_.area.x);
            if(_loc3_ != null)
            {
               if(_loc1_.area.y != 0)
               {
                  if(_loc3_.level >= _loc1_.area.y)
                  {
                     this._targetSkillLv.count = 1;
                  }
               }
               else
               {
                  this._targetSkillLv.count = 1;
               }
            }
         }
         else
         {
            this._targetSkillLv = null;
         }
         return this._targetSkillLv;
      }
      
      public function get targetAllSkillLv() : TaskTargetData
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc1_:TaskTargetData = this.taskRes.targetAllSkillLv;
         if(_loc1_ != null)
         {
            _loc2_ = Math.min(GameInstance.mainCharData.skillInfo.skillLevel,_loc1_.count);
            _loc3_ = _loc2_.toString();
            this._targetAllSkillLv = TaskResManager.getTargetAllSkillLvTTD(_loc3_);
            this._targetAllSkillLv.count = 0;
            if(_loc2_ >= _loc1_.count)
            {
               this._targetAllSkillLv.count = 1;
            }
         }
         else
         {
            this._targetAllSkillLv = null;
         }
         return this._targetAllSkillLv;
      }
      
      public function get targetPoint() : TaskTargetData
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc1_:TaskTargetData = this.taskRes.targetPoint;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.id + "#" + _loc1_.name;
            this._targetPoint = TaskResManager.getTargetPointTTD(_loc2_);
            this._targetPoint.count = 0;
            _loc3_ = GameInstance.mainCharData.jingmaiInfo.isXueweiOpened(_loc1_.id);
            if(_loc3_)
            {
               this._targetPoint.count = 1;
            }
         }
         else
         {
            this._targetPoint = null;
         }
         return this._targetPoint;
      }
      
      public function get targetChannel() : TaskTargetData
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc1_:TaskTargetData = this.taskRes.targetChannel;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.id + "#" + _loc1_.name;
            this._targetChannel = TaskResManager.getTargetChannelTTD(_loc2_);
            this._targetChannel.count = 0;
            _loc3_ = GameInstance.mainCharData.jingmaiInfo.isJingmaiOpened(_loc1_.id);
            if(_loc3_)
            {
               this._targetChannel.count = 1;
            }
         }
         else
         {
            this._targetChannel = null;
         }
         return this._targetChannel;
      }
      
      public function get targetBuff() : TaskTargetData
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc1_:TaskTargetData = this.taskRes.targetBuff;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.id + "#" + _loc1_.name;
            this._targetBuff = TaskResManager.getTargetBuffTTD(_loc2_);
            this._targetBuff.count = 0;
            _loc3_ = GameInstance.mainCharData.buffInfo.hasBuff(_loc1_.id);
            if(_loc3_)
            {
               this._targetBuff.count = 1;
            }
         }
         else
         {
            this._targetBuff = null;
         }
         return this._targetBuff;
      }
      
      public function getTargetGoods(param1:int) : TaskTargetData
      {
         var _loc3_:TaskTargetData = null;
         var _loc2_:Array = this.targetGoods;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getTargetMonster(param1:int) : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         for each(_loc2_ in this.targetMonster)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getTargetNpc(param1:int) : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         for each(_loc2_ in this.targetNpc)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getTargetArea(param1:int, param2:Rectangle = null, param3:Point = null) : TaskTargetData
      {
         var _loc4_:TaskTargetData = null;
         for each(_loc4_ in this.targetArea)
         {
            if(_loc4_.id == param1 && (!param2 || _loc4_.area.equals(param2)) && (!param3 || _loc4_.area.contains(param3.x,param3.y)))
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function getTargetAction(param1:int) : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         for each(_loc2_ in this.targetAction)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getTargetHorse(param1:int) : TaskTargetData
      {
         var _loc3_:TaskTargetData = null;
         var _loc2_:Array = this.targetHorse;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getTargetShopping(param1:int) : TaskTargetData
      {
         var _loc3_:TaskTargetData = null;
         var _loc2_:Array = this.targetShopping;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function readyTargetMonster(param1:int = -1) : Boolean
      {
         var _loc3_:TaskTargetData = null;
         var _loc4_:TaskTargetData = null;
         var _loc2_:TaskRes = this.taskRes;
         if(_loc2_.targetMonster.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc3_ = _loc2_.getTargetMonster(param1);
            _loc4_ = this.getTargetMonster(param1);
            if(!_loc3_ || !_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc3_ in _loc2_.targetMonster)
         {
            _loc4_ = this.getTargetMonster(_loc3_.id);
            if(!_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function readyTargetGoods(param1:int = -1) : Boolean
      {
         var _loc3_:TaskTargetData = null;
         var _loc4_:TaskTargetData = null;
         var _loc2_:TaskRes = this.taskRes;
         if(_loc2_.targetGoods.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc3_ = _loc2_.getTargetGoods(param1);
            _loc4_ = this.getTargetGoods(param1);
            if(!_loc3_ || !_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc3_ in _loc2_.targetGoods)
         {
            _loc4_ = this.getTargetGoods(_loc3_.id);
            if(!_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function readyTargetNpc(param1:int = -1) : Boolean
      {
         var _loc3_:TaskTargetData = null;
         var _loc4_:TaskTargetData = null;
         var _loc2_:TaskRes = this.taskRes;
         if(_loc2_.targetNpc.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc3_ = _loc2_.getTargetNpc(param1);
            _loc4_ = this.getTargetNpc(param1);
            if(!_loc3_ || !_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc3_ in _loc2_.targetNpc)
         {
            _loc4_ = this.getTargetNpc(_loc3_.id);
            if(!_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function readyTargetArea(param1:int = -1, param2:Rectangle = null, param3:Point = null) : Boolean
      {
         var _loc5_:TaskTargetData = null;
         var _loc6_:TaskTargetData = null;
         var _loc4_:TaskRes = this.taskRes;
         if(_loc4_.targetArea.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc5_ = _loc4_.getTargetArea(param1,param2,param3);
            _loc6_ = this.getTargetArea(param1,param2,param3);
            if(!_loc5_ || !_loc6_ || _loc6_.count < _loc5_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc5_ in _loc4_.targetArea)
         {
            _loc6_ = this.getTargetArea(_loc5_.id,_loc5_.area);
            if(!_loc6_ || _loc6_.count < _loc5_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function readyTargetAction(param1:int = -1) : Boolean
      {
         var _loc3_:TaskTargetData = null;
         var _loc4_:TaskTargetData = null;
         var _loc2_:TaskRes = this.taskRes;
         if(_loc2_.targetAction.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc3_ = _loc2_.getTargetAction(param1);
            _loc4_ = this.getTargetAction(param1);
            if(!_loc3_ || !_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc3_ in _loc2_.targetAction)
         {
            _loc4_ = this.getTargetAction(_loc3_.id);
            if(!_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function readyTargetHorse(param1:int = -1) : Boolean
      {
         var _loc3_:TaskTargetData = null;
         var _loc4_:TaskTargetData = null;
         var _loc2_:TaskRes = this.taskRes;
         if(_loc2_.targetHorse.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc3_ = _loc2_.getTargetHorse(param1);
            _loc4_ = this.getTargetHorse(param1);
            if(!_loc3_ || !_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc3_ in _loc2_.targetHorse)
         {
            _loc4_ = this.getTargetHorse(_loc3_.id);
            if(!_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function readyTargetShopping(param1:int = -1) : Boolean
      {
         var _loc3_:TaskTargetData = null;
         var _loc4_:TaskTargetData = null;
         var _loc2_:TaskRes = this.taskRes;
         if(_loc2_.targetShopping.length == 0)
         {
            return true;
         }
         if(param1 != -1)
         {
            _loc3_ = _loc2_.getTargetShopping(param1);
            _loc4_ = this.getTargetShopping(param1);
            if(!_loc3_ || !_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
            return true;
         }
         for each(_loc3_ in _loc2_.targetShopping)
         {
            _loc4_ = this.getTargetShopping(_loc3_.id);
            if(!_loc4_ || _loc4_.count < _loc3_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function readyTargetRecharge() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetRecharge == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetRecharge;
         _loc3_ = this.targetRecharge;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetMountUpgrade() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetMountUpgrade == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetMountUpgrade;
         _loc3_ = this.targetMountUpgrade;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetGroup() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetGroup == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetGroup;
         _loc3_ = this.targetGroup;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetFriend() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetFriend == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetFriend;
         _loc3_ = this.targetFriend;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetEquip() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetEquip == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetEquip;
         _loc3_ = this.targetEquip;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetSkillLv() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetSkillLv == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetSkillLv;
         _loc3_ = this.targetSkillLv;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetAllSkillLv() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetAllSkillLv == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetAllSkillLv;
         _loc3_ = this.targetAllSkillLv;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetPoint() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetPoint == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetPoint;
         _loc3_ = this.targetPoint;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetChannel() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetChannel == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetChannel;
         _loc3_ = this.targetChannel;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function readyTargetBuff() : Boolean
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         if(_loc1_.targetBuff == null)
         {
            return true;
         }
         _loc2_ = _loc1_.targetBuff;
         _loc3_ = this.targetBuff;
         if(!_loc2_ || !_loc3_ || _loc3_.count < _loc2_.count)
         {
            return false;
         }
         return true;
      }
      
      public function nextTargetMonster() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         for each(_loc2_ in _loc1_.targetMonster)
         {
            _loc3_ = this.getTargetMonster(_loc2_.id);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function nextTargetGoods() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         for each(_loc2_ in _loc1_.targetGoods)
         {
            _loc3_ = this.getTargetGoods(_loc2_.id);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function nextTargetNpc() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         for each(_loc2_ in _loc1_.targetNpc)
         {
            _loc3_ = this.getTargetNpc(_loc2_.id);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function nextTargetArea() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         for each(_loc2_ in _loc1_.targetArea)
         {
            _loc3_ = this.getTargetArea(_loc2_.id,_loc2_.area);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function nextTargetAction() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         for each(_loc2_ in _loc1_.targetAction)
         {
            _loc3_ = this.getTargetAction(_loc2_.id);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function nextTargetMount() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         for each(_loc2_ in _loc1_.targetHorse)
         {
            _loc3_ = this.getTargetHorse(_loc2_.id);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function nextTargetShopping() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         for each(_loc2_ in _loc1_.targetShopping)
         {
            _loc3_ = this.getTargetShopping(_loc2_.id);
            if(!_loc3_ || _loc3_.count < _loc2_.count)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function nextTargetRecharge() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetRecharge;
         _loc3_ = this.targetRecharge;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextMountUpgrade() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetMountUpgrade;
         _loc3_ = this.targetMountUpgrade;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextGroup() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetGroup;
         _loc3_ = this.targetGroup;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextFriend() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetFriend;
         _loc3_ = this.targetFriend;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextEquip() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetEquip;
         _loc3_ = this.targetEquip;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextSkillLv() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetSkillLv;
         _loc3_ = this.targetSkillLv;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextAllSkillLv() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetAllSkillLv;
         _loc3_ = this.targetAllSkillLv;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextPoint() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetPoint;
         _loc3_ = this.targetPoint;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextChannel() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetChannel;
         _loc3_ = this.targetChannel;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function nextBuff() : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         var _loc3_:TaskTargetData = null;
         var _loc1_:TaskRes = this.taskRes;
         _loc2_ = _loc1_.targetBuff;
         _loc3_ = this.targetBuff;
         if(!_loc3_ || _loc3_.count < _loc2_.count)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function timeOut() : Boolean
      {
         return this._leaveTime == 0;
      }
      
      public function get leaveTime() : Number
      {
         return this._leaveTime;
      }
      
      public function set leaveTime(param1:Number) : void
      {
         this._leaveTime = param1;
         if(this._timerData)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
         }
         if(this._leaveTime == -1)
         {
            return;
         }
         if(this._leaveTime < 0)
         {
            this._leaveTime = -1;
         }
         else if(this._leaveTime > 0)
         {
            this._timerData = TimerManager.createExactTimer(this._leaveTime,this._leaveTime,0,this.timerHandler,null,1);
         }
      }
      
      private function timerHandler(param1:int) : void
      {
         this._leaveTime = param1;
         if(this._leaveTime < 0)
         {
            this._leaveTime = 0;
         }
         if(this.updateTime_for_taskList != null)
         {
            this.updateTime_for_taskList(this._leaveTime);
         }
         if(this.updateTime_for_taskTracker != null)
         {
            this.updateTime_for_taskTracker(this._leaveTime);
         }
         if(this._leaveTime == 0)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
            this.updateTime_for_taskList = null;
            this.updateTime_for_taskTracker = null;
            TaskTracker.updateTaskUI();
         }
      }
      
      public function destroy() : void
      {
         if(this._timerData)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
         }
         this.updateTime_for_taskList = null;
         this.updateTime_for_taskTracker = null;
      }
   }
}

