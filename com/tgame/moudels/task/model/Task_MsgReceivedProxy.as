package com.tgame.moudels.task.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.vo.character.info.DynamicTaskInfo;
   import com.tgame.common.vo.character.info.data.CharEndTaskData;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.task.view.Task_AcceptCycTaskPlaneMediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Task_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Task_MsgReceivedProxy";
      
      private var _taskProxy:Task_TaskProxy;
      
      private var _acceptCycPlaneMediator:Task_AcceptCycTaskPlaneMediator;
      
      public function Task_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get taskProxy() : Task_TaskProxy
      {
         if(this._taskProxy == null)
         {
            this._taskProxy = facade.retrieveProxy(Task_TaskProxy.NAME) as Task_TaskProxy;
         }
         return this._taskProxy;
      }
      
      private function get acceptCycPlaneMediator() : Task_AcceptCycTaskPlaneMediator
      {
         if(!this._acceptCycPlaneMediator)
         {
            this._acceptCycPlaneMediator = facade.retrieveMediator(Task_AcceptCycTaskPlaneMediator.NAME) as Task_AcceptCycTaskPlaneMediator;
         }
         return this._acceptCycPlaneMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10260,10262,20000,10264,20002,10266,20004,10268,20010,20012,20020,20030],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10260,10262,20000,10264,20002,10266,20004,10268,20010,20012,20020,20030],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_10260(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = null;
         var _loc5_:int = 0;
         var _loc6_:CharTaskData = null;
         var _loc8_:CharEndTaskData = null;
         var _loc9_:int = 0;
         var _loc10_:XML = null;
         ZLog.add("10260：初始化主角任务列表");
         _loc2_ = param1;
         var _loc3_:Array = [];
         var _loc4_:int = _loc2_.readByte();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new CharTaskData();
            _loc6_.taskID = _loc2_.readInt();
            _loc6_.leaveTime = _loc2_.readInt();
            _loc6_.targetMonster = TaskResManager.getTargetMonsterArr(_loc2_.readUTF(),false);
            _loc6_.targetNpc = TaskResManager.getTargetNpcArr(_loc2_.readUTF(),false);
            _loc6_.targetArea = TaskResManager.getTargetAreaArr(_loc2_.readUTF(),false);
            _loc6_.targetAction = TaskResManager.getTargetActionArr(_loc2_.readUTF(),false);
            _loc6_.targetShopping = TaskResManager.getTargetShoppingArr(_loc2_.readUTF());
            _loc6_.targetRecharge = TaskResManager.getTargetRechargeTTD(_loc2_.readUTF());
            _loc6_.targetMountUpgrade = TaskResManager.getTargetMountUpgradeTTD(_loc2_.readUTF());
            _loc6_.currentLoop = _loc2_.readShort();
            _loc3_[_loc3_.length] = _loc6_;
            _loc5_++;
         }
         var _loc7_:Array = [];
         _loc4_ = _loc2_.readShort();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = new CharEndTaskData();
            _loc8_.taskID = _loc2_.readInt();
            _loc8_.currentLoop = _loc2_.readShort();
            _loc7_[_loc7_.length] = _loc8_;
            _loc5_++;
         }
         _loc4_ = _loc2_.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc9_ = _loc2_.readInt();
            _loc10_ = TaskResManager.getOriginalTaskResXML(_loc9_);
            if(_loc10_ != null)
            {
               _loc10_ = _loc10_.copy();
               _loc10_.@loopTaskDifficulty = _loc2_.readInt();
               _loc10_.@targetMonster = _loc2_.readUTF();
               _loc10_.@targetNpc = _loc2_.readUTF();
               _loc10_.@targetGoods = _loc2_.readUTF();
               _loc10_.@targetHorse = _loc2_.readUTF();
               _loc10_.@loopTaskBonus = _loc2_.readInt();
               _loc10_.@copper = _loc2_.readInt();
               _loc10_.@experience = _loc2_.readInt();
               _loc10_.@zhenqi = _loc2_.readInt();
               _loc10_.@goods = _loc2_.readUTF();
               _loc10_.@endNpc = _loc2_.readInt();
               TaskResManager.addTaskRes(_loc10_);
            }
            _loc5_++;
         }
         this.taskProxy.init(_loc3_,_loc7_);
      }
      
      public function received_10262(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1 ? true : false;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            this.taskProxy.received_AcceptTask(_loc4_);
            ZLog.add("10262：接任务成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"接任务成功"),false);
            GameInstance.mainChar.showAttackFace(AttackFace.OTHERS_TASK_ACCEPT,0,LanResManager.getLanTextWords(this,"接受任务"));
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("10262：接任务失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
         }
      }
      
      public function received_20000(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:XML = null;
         var _loc9_:TaskRes = null;
         var _loc10_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1 ? true : false;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readShort();
            _loc7_ = _loc2_.readInt();
            _loc8_ = TaskResManager.getOriginalTaskResXML(_loc7_);
            if(_loc8_ != null)
            {
               _loc8_ = _loc8_.copy();
               _loc8_.@loopTaskDifficulty = _loc2_.readInt();
               _loc8_.@targetMonster = _loc2_.readUTF();
               _loc8_.@targetNpc = _loc2_.readUTF();
               _loc8_.@targetGoods = _loc2_.readUTF();
               _loc8_.@targetHorse = _loc2_.readUTF();
               _loc8_.@loopTaskBonus = _loc2_.readInt();
               _loc8_.@copper = _loc2_.readInt();
               _loc8_.@experience = _loc2_.readInt();
               _loc8_.@zhenqi = _loc2_.readInt();
               _loc8_.@goods = _loc2_.readUTF();
               _loc8_.@endNpc = _loc2_.readInt();
               TaskResManager.addTaskRes(_loc8_);
            }
            this.taskProxy.received_AcceptTask(_loc4_,_loc5_);
            _loc9_ = TaskResManager.getTaskRes(_loc4_);
            if(_loc9_.isLoop && _loc9_.type != TaskType.LV_LOOP && _loc9_.type != TaskType.CISHA)
            {
               this.acceptCycPlaneMediator.showCycPlane(_loc4_,_loc6_);
            }
            ZLog.add("20000：接循环任务成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"接循环任务成功"),false);
            GameInstance.mainChar.showAttackFace(AttackFace.OTHERS_TASK_ACCEPT);
         }
         else
         {
            _loc10_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("20000：接循环任务失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc10_);
         }
      }
      
      public function received_10264(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:AvatarParamData = null;
         var _loc6_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1 ? true : false;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            this.taskProxy.received_HandInTask(_loc4_);
            ZLog.add("10264：交任务成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"交任务成功"),false);
            _loc5_ = new AvatarParamData(ResPathManager.AVATAR_TASK_HANDIN,AvatarPartType.MAGIC);
            GameInstance.mainChar.loadAvatarPart(_loc5_);
            GameInstance.mainChar.showAttackFace(AttackFace.OTHERS_TASK_HANDIN,0,LanResManager.getLanTextWords(this,"完成任务"));
         }
         else
         {
            _loc6_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("10264：交任务失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc6_);
         }
      }
      
      public function received_20002(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:AvatarParamData = null;
         var _loc7_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1 ? true : false;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readShort();
            TaskResManager.recoveryTaskRes(_loc4_);
            this.taskProxy.received_HandInTask(_loc4_,_loc5_);
            ZLog.add("20002：交循环任务成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"交循环任务成功"),false);
            _loc6_ = new AvatarParamData(ResPathManager.AVATAR_TASK_HANDIN,AvatarPartType.MAGIC);
            GameInstance.mainChar.loadAvatarPart(_loc6_);
            GameInstance.mainChar.showAttackFace(AttackFace.OTHERS_TASK_HANDIN,0,LanResManager.getLanTextWords(this,"完成任务"));
         }
         else
         {
            _loc7_ = _loc2_.readUTF();
            ZLog.add("20002：交循环任务失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc7_);
         }
      }
      
      public function received_10266(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1 ? true : false;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            this.taskProxy.received_GaveUpTask(_loc4_);
            ZLog.add("10266：放弃任务成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"放弃任务成功"),false);
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("10266：放弃任务失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
         }
      }
      
      public function received_20004(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1 ? true : false;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readShort();
            TaskResManager.recoveryTaskRes(_loc4_);
            this.taskProxy.received_GaveUpTask(_loc4_,_loc5_);
            ZLog.add("20004：放弃循环任务成功");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"放弃循环任务成功"),false);
         }
         else
         {
            _loc6_ = _loc2_.readUTF();
            ZLog.add("20004：放弃循环任务失败");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc6_);
         }
      }
      
      public function received_10268(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:String = _loc2_.readUTF();
         ZLog.add("10268：任务数据同步:" + _loc3_ + "," + _loc4_ + "," + _loc5_);
         TaskTracker.receivedTaskRequiredGoods(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_20010(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:XML = null;
         var _loc7_:int = 0;
         ZLog.add("20010：添加动态任务res");
         throw new Error("没做NPC处理，所以此消息目前不可用");
      }
      
      public function received_20012(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("20012：移除动态任务res");
         throw new Error("没做NPC处理，所以此消息目前不可用");
      }
      
      public function received_20020(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("20020：删除指定任务所有数据");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_.readInt();
            TaskResManager.recoveryTaskRes(_loc5_);
            this.taskProxy.removeTaskData(_loc5_);
            _loc4_++;
         }
         TaskTracker.updateTaskUI();
      }
      
      public function received_20030(param1:ByteArray) : void
      {
         var _loc4_:CharTaskData = null;
         ZLog.add("20030：服务端控制的任务的状态更新");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(_loc2_ == DynamicTaskInfo.CISHA_TASK_ID)
         {
            GameInstance.mainCharData.dynamicTaskInfo.CISHA_TASK_STATUS = _loc3_;
            if(_loc3_ == 2)
            {
               _loc4_ = GameInstance.mainCharData.taskInfo.getTask(_loc2_);
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_TASK_TARGET_COMPLETE,[_loc4_]);
            }
            TaskTracker.updateTaskUI();
         }
      }
   }
}

