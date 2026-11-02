package com.tgame.common.res.task
{
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.staticdata.TaskPublishType;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TaskRes
   {
      
      private var _acceptNpc:int;
      
      public var id:int;
      
      public var name:String;
      
      public var type:int;
      
      public var islost:Boolean;
      
      public var publishStyle:int;
      
      public var receptionLevel:int;
      
      public var receptionUpLevel:int;
      
      public var endTaskLevel:int;
      
      public var premiseTask:int;
      
      public var limitTime:Number;
      
      public var endNpc:int;
      
      public var publishDes:String;
      
      public var unEndDes:String;
      
      public var endDes:String;
      
      public var targetGoods:Array;
      
      public var targetMonster:Array;
      
      public var targetNpc:Array;
      
      public var targetArea:Array;
      
      public var targetAction:Array;
      
      public var goods:Array;
      
      public var gold:int;
      
      public var copper:int;
      
      public var experience:Number;
      
      public var goodFeel:int;
      
      public var party:int;
      
      public var goodBad:int;
      
      public var title:int;
      
      public var beginNpc:int;
      
      public var isRepeat:Boolean;
      
      public var warrepute:int;
      
      public var buffid:int;
      
      public var bulletin:int;
      
      public var zhenqi:int;
      
      public var loopTaskDifficulty:int;
      
      public var loopTaskBonus:int;
      
      public var targetHorse:Array;
      
      public var hourseDrop:Boolean;
      
      public var taskTargetDes:String;
      
      public var targetShopping:Array;
      
      public var targetRecharge:TaskTargetData;
      
      public var targetMountUpgrade:TaskTargetData;
      
      public var targetGroup:TaskTargetData;
      
      public var targetFriend:TaskTargetData;
      
      public var targetEquip:TaskTargetData;
      
      public var targetSkillLv:TaskTargetData;
      
      public var targetAllSkillLv:TaskTargetData;
      
      public var targetPoint:TaskTargetData;
      
      public var targetChannel:TaskTargetData;
      
      public var targetBuff:TaskTargetData;
      
      public var loopMaxCount:int;
      
      public var accept_begin_time:String;
      
      public var complete_end_time:String;
      
      public var isLoop:Boolean;
      
      public function TaskRes()
      {
         super();
         this._acceptNpc = 0;
         this.id = 0;
         this.name = "";
         this.type = 0;
         this.islost = false;
         this.publishStyle = 0;
         this.receptionLevel = 0;
         this.receptionUpLevel = 0;
         this.endTaskLevel = 0;
         this.premiseTask = 0;
         this.limitTime = -1;
         this.endNpc = 0;
         this.publishDes = "";
         this.unEndDes = "";
         this.endDes = "";
         this.targetGoods = [];
         this.targetMonster = [];
         this.targetNpc = [];
         this.targetArea = [];
         this.targetAction = [];
         this.goods = [];
         this.gold = 0;
         this.copper = 0;
         this.experience = 0;
         this.goodFeel = 0;
         this.party = 0;
         this.goodBad = 0;
         this.title = 0;
         this.beginNpc = 0;
         this.isRepeat = false;
         this.warrepute = 0;
         this.buffid = 0;
         this.bulletin = 0;
         this.zhenqi = 0;
         this.loopTaskDifficulty = 0;
         this.loopTaskBonus = 0;
         this.targetHorse = [];
         this.hourseDrop = false;
         this.taskTargetDes = "";
         this.targetShopping = [];
         this.targetRecharge = null;
         this.targetMountUpgrade = null;
         this.targetGroup = null;
         this.targetFriend = null;
         this.targetEquip = null;
         this.targetSkillLv = null;
         this.targetAllSkillLv = null;
         this.targetPoint = null;
         this.targetChannel = null;
         this.targetBuff = null;
         this.isLoop = false;
         this.loopMaxCount = 0;
         this.accept_begin_time = "";
         this.complete_end_time = "";
      }
      
      public function get acceptNpc() : int
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         if(this._acceptNpc == 0)
         {
            if(this.publishStyle == TaskPublishType.SYSTEM)
            {
               this._acceptNpc = -1;
            }
            else if(this.publishStyle == TaskPublishType.GOODS)
            {
               this._acceptNpc = -2;
            }
            else if(this.publishStyle == TaskPublishType.CREAT_PLAYER)
            {
               this._acceptNpc = -3;
            }
            else if(this.publishStyle == TaskPublishType.ADVENTURE)
            {
               this._acceptNpc = -4;
            }
            else
            {
               _loc1_ = NpcResManager.getNpcIDandTaskIDArrBySceneID();
               for each(_loc2_ in _loc1_)
               {
                  if((_loc2_[1] as Array).indexOf(this.id) != -1)
                  {
                     this._acceptNpc = _loc2_[0];
                     break;
                  }
               }
            }
         }
         return this._acceptNpc;
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
         var _loc2_:TaskTargetData = null;
         for each(_loc2_ in this.targetHorse)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getTargetShopping(param1:int) : TaskTargetData
      {
         var _loc2_:TaskTargetData = null;
         for each(_loc2_ in this.targetShopping)
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

