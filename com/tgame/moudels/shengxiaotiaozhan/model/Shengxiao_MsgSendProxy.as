package com.tgame.moudels.shengxiaotiaozhan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shengxiao_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Shengxiao_MsgSendProxy";
      
      public function Shengxiao_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73871(param1:* = null) : void
      {
         ZLog.add("73871：请求十二生肖面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73871,_loc2_);
      }
      
      public function send_73873(param1:* = null) : void
      {
         ZLog.add("73873：请求每层内级数信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73873,_loc2_);
      }
      
      public function send_73875(param1:* = null) : void
      {
         ZLog.add("73875：请求开始挑战提示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73875,_loc2_);
      }
      
      public function send_73877(param1:* = null) : void
      {
         ZLog.add("73877：请求开始挑战");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73877,_loc2_);
      }
      
      public function send_73879(param1:* = null) : void
      {
         ZLog.add("73879：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73879,_loc2_);
      }
      
      public function send_73883(param1:* = null) : void
      {
         ZLog.add("73883：请求离开");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73883,_loc2_);
      }
      
      public function send_73889(param1:* = null) : void
      {
         ZLog.add("73889：请求确定复活");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73889,_loc2_);
      }
      
      public function send_73893(param1:* = null) : void
      {
         ZLog.add("73893：请求锻造神器");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73893,_loc2_);
      }
   }
}

