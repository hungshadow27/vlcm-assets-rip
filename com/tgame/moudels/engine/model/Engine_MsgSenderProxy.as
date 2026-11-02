package com.tgame.moudels.engine.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Engine_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Engine_MsgSenderProxy";
      
      public function Engine_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_10061(param1:* = null) : void
      {
         ZLog.add("10061：发送主角移动队列消息");
         var _loc2_:ByteArray = param1 as ByteArray;
         NetWorkManager.sendMsg(10061,_loc2_);
      }
      
      public function send_10063(param1:* = null) : void
      {
         ZLog.add("10063：发送主角跳跃消息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeShort(_loc3_[0]);
         _loc2_.writeShort(_loc3_[1]);
         _loc2_.writeShort(_loc3_[2]);
         _loc2_.writeShort(_loc3_[3]);
         _loc2_.writeByte(_loc3_[4]);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(10063,_loc2_);
      }
      
      public function send_10051(param1:* = null) : void
      {
         ZLog.add("10051：发送主角切换场景消息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeShort(_loc3_[0]);
         _loc2_.writeShort(_loc3_[1]);
         NetWorkManager.sendMsg(10051,_loc2_);
      }
      
      public function send_10053(param1:* = null) : void
      {
         ZLog.add("10053：发送主角确认切换场景消息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeShort(_loc3_[0]);
         _loc2_.writeShort(_loc3_[1]);
         NetWorkManager.sendMsg(10053,_loc2_);
      }
   }
}

