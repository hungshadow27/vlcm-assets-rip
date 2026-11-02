package com.tgame.moudels.chiBang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChiBang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ChiBang_MsgSenderProxy";
      
      public function ChiBang_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_61701(param1:* = null) : void
      {
         ZLog.add("61701：请求玩家翅膀详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(61701,_loc2_);
      }
      
      public function send_61703(param1:* = null) : void
      {
         ZLog.add("61703：玩家请求翅膀突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61703,_loc2_);
      }
      
      public function send_61705(param1:* = null) : void
      {
         ZLog.add("61705\t\t请求突破翅膀");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61705,_loc2_);
      }
      
      public function send_61731(param1:* = null) : void
      {
         ZLog.add("61731\t\t羽灵合成信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(61731,_loc2_);
      }
      
      public function send_61733(param1:* = null) : void
      {
         ZLog.add("61733\t\t羽灵合成请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(61733,_loc2_);
      }
      
      public function send_61781(param1:* = null) : void
      {
         ZLog.add("61781\t\t请求上飞");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(61781,_loc2_);
      }
      
      public function send_61787(param1:* = null) : void
      {
         ZLog.add("61787\t\t请求下飞");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(61787,_loc2_);
      }
      
      public function send_61751(param1:* = null) : void
      {
         ZLog.add("61751\t\t请求心魔信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61751,_loc2_);
      }
   }
}

