package com.tgame.moudels.tianFu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianFu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TianFu_MsgSenderProxy";
      
      public function TianFu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_58321(param1:* = null) : void
      {
         ZLog.add("58321：发出 请求天赋碎片合成初始信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58321,_loc2_);
      }
      
      public function send_58251(param1:* = null) : void
      {
         ZLog.add("58251：发出 请求主角天赋信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58251,_loc2_);
      }
      
      public function send_58323(param1:*) : void
      {
         ZLog.add("58323：发出 请求天赋碎片拖入或拔除");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(58323,_loc2_);
      }
      
      public function send_58325(param1:* = null) : void
      {
         ZLog.add("58325：发出 请求合成天赋碎片");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58325,_loc2_);
      }
      
      public function send_58327(param1:* = null) : void
      {
         ZLog.add("58327：发出 请求领取天赋合成");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58327,_loc2_);
      }
      
      public function send_58253(param1:* = null) : void
      {
         ZLog.add("58253：发出 主角刷新天赋物品请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58253,_loc2_);
      }
      
      public function send_58255(param1:* = null) : void
      {
         ZLog.add("58255：发出 主角推命请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58255,_loc2_);
      }
      
      public function send_58257(param1:* = null) : void
      {
         ZLog.add("58257：发出 查看他人天赋请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(58257,_loc2_);
      }
      
      public function send_58259(param1:* = null) : void
      {
         ZLog.add("58259：请求领取天赋");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58259,_loc2_);
      }
      
      public function send_58301(param1:*) : void
      {
         ZLog.add("58301：发出 请求镶嵌天赋面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(58301,_loc2_);
      }
      
      public function send_58303(param1:*) : void
      {
         ZLog.add("58303：发出 请求遗忘天赋");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(58303,_loc2_);
      }
      
      public function send_58305(param1:*) : void
      {
         ZLog.add("58305：发出 请求唤醒天赋");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeInt(param1[3]);
         NetWorkManager.sendMsg(58305,_loc2_);
      }
      
      public function send_58307(param1:*) : void
      {
         ZLog.add("58307：发出 请求拖动天赋");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeInt(param1[3]);
         _loc2_.writeInt(param1[4]);
         NetWorkManager.sendMsg(58307,_loc2_);
      }
   }
}

