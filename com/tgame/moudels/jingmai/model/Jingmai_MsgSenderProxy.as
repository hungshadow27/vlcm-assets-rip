package com.tgame.moudels.jingmai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Jingmai_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Jingmai_MsgSenderProxy";
      
      public function Jingmai_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_50213(param1:* = null) : void
      {
         ZLog.add("50213：发送请求经脉总揽面板");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50213,_loc3_);
      }
      
      public function send_50203(param1:* = null) : void
      {
         ZLog.add("50203：发送请求冲穴");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeShort(_loc2_[0]);
         _loc3_.writeByte(_loc2_[1]);
         NetWorkManager.sendMsg(50203,_loc3_);
      }
      
      public function send_50211(param1:* = null) : void
      {
         ZLog.add("50211：发送请求突破瓶颈面板");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50211,_loc3_);
      }
      
      public function send_50209(param1:* = null) : void
      {
         ZLog.add("50209：发送请求突破瓶颈");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50209,_loc3_);
      }
      
      public function send_50217(param1:* = null) : void
      {
         ZLog.add("50217：发送请求受伤经脉信息面板");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50217,_loc3_);
      }
      
      public function send_50233(param1:* = null) : void
      {
         ZLog.add("50233：发送请求当前经脉气海是否冲通");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         NetWorkManager.sendMsg(50233,_loc3_);
      }
      
      public function send_50231(param1:* = null) : void
      {
         ZLog.add("50231：发送请求经脉气海修炼");
         var _loc2_:Array = param1 as Array;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         NetWorkManager.sendMsg(50231,_loc3_);
      }
      
      public function send_50235(param1:* = null) : void
      {
         ZLog.add("50235：发送请求TA的经脉");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50235,_loc2_);
      }
   }
}

