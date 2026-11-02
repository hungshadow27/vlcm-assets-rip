package com.tgame.moudels.task.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Task_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Task_MsgSenderProxy";
      
      public function Task_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_10261(param1:* = null) : void
      {
         ZLog.add("10261：接任务");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10261,_loc2_);
      }
      
      public function send_10263(param1:* = null) : void
      {
         ZLog.add("10263：交任务");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(_loc2_[0]);
         _loc3_.writeShort(_loc2_[1]);
         _loc3_.writeInt(_loc2_[2]);
         NetWorkManager.sendMsg(10263,_loc3_);
      }
      
      public function send_10265(param1:* = null) : void
      {
         ZLog.add("10265：放弃任务");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10265,_loc2_);
      }
      
      public function send_10267(param1:* = null) : void
      {
         ZLog.add("10267：同步任务");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(_loc2_[0]);
         _loc3_.writeByte(_loc2_[1]);
         _loc3_.writeInt(_loc2_[2]);
         NetWorkManager.sendMsg(10267,_loc3_);
      }
      
      public function send_20005(param1:* = null) : void
      {
         ZLog.add("20005：降低环任务难度");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(20005,_loc2_);
      }
      
      public function send_20007(param1:* = null) : void
      {
         ZLog.add("20007：提升环任务奖励风厚度");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(20007,_loc2_);
      }
   }
}

