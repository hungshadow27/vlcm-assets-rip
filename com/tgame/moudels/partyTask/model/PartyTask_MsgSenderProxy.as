package com.tgame.moudels.partyTask.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PartyTask_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "PartyTask_MsgSenderProxy";
      
      public function PartyTask_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53731(param1:* = null) : void
      {
         ZLog.add("53731:请求镖车信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53731,_loc2_);
      }
      
      public function send_53733(param1:* = null) : void
      {
         ZLog.add("53733:领取护镖任务");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(53733,_loc2_);
      }
      
      public function send_53735(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53735,_loc2_);
      }
      
      public function send_53737(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53737,_loc2_);
      }
      
      public function send_53739(param1:* = null) : void
      {
         ZLog.add("53739:请求护镖任务奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53739,_loc2_);
      }
      
      public function send_53741(param1:* = null) : void
      {
         ZLog.add("53741:完成护镖任务");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53741,_loc2_);
      }
      
      public function send_53747(param1:* = null) : void
      {
         ZLog.add("53747:放弃护镖任务");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53747,_loc2_);
      }
      
      public function send_53751(param1:* = null) : void
      {
         ZLog.add("53751:请求升级镖车详细信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53751,_loc2_);
      }
      
      public function send_53753(param1:* = null) : void
      {
         ZLog.add("53753:修改镖车名字");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt((param1 as Array)[0]);
         _loc2_.writeUTF((param1 as Array)[1]);
         NetWorkManager.sendMsg(53753,_loc2_);
      }
      
      public function send_53755(param1:* = null) : void
      {
         ZLog.add("53755:升级镖车");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53755,_loc2_);
      }
      
      public function send_51201(param1:* = null) : void
      {
         ZLog.add("51201:请求初始化帮派boss面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51201,_loc2_);
      }
      
      public function send_51203(param1:* = null) : void
      {
         ZLog.add("51203:挑战帮派BOSS");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(51203,_loc2_);
      }
      
      public function send_51205(param1:* = null) : void
      {
         ZLog.add("51205: 请求祭奠boss");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeUTF(_loc3_[2]);
         _loc2_.writeByte(_loc3_[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(51205,_loc2_);
      }
      
      public function send_51207(param1:* = null) : void
      {
         ZLog.add("51207:请求进入帮派boss副本");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51207,_loc2_);
      }
      
      public function send_51213(param1:* = null) : void
      {
         ZLog.add("51213:提交精魄");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         var _loc4_:int = int(_loc3_.length);
         _loc2_.writeByte(_loc3_[_loc3_.length - 1]);
         if(_loc4_ > 1)
         {
            _loc4_--;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_.writeShort(_loc3_[_loc5_]);
            _loc5_++;
         }
         NetWorkManager.sendMsg(51213,_loc2_);
      }
      
      public function send_71015(param1:* = null) : void
      {
         ZLog.add("71015:请求帮派荣誉面板城池列表信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71015,_loc2_);
      }
      
      public function send_71017(param1:* = null) : void
      {
         ZLog.add("71017:请求选中城池信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71017,_loc2_);
      }
      
      public function send_71033(param1:* = null) : void
      {
         ZLog.add("71033:激活龙脉");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71033,_loc2_);
      }
      
      public function send_71019(param1:* = null) : void
      {
         ZLog.add("71019:请求查看该城史志");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(71019,_loc2_);
      }
   }
}

