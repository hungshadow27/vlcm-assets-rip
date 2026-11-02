package com.tgame.moudels.xianmozhilu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XianMoZhiLu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XianMoZhiLu_MsgSenderProxy";
      
      public function XianMoZhiLu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_80231(param1:* = null) : void
      {
         ZLog.add("80231：请求仙魔之路");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(80231,_loc2_);
      }
      
      public function send_80233(param1:* = null) : void
      {
         ZLog.add("80233：请求仙魔之路突破");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(80233,_loc2_);
      }
      
      public function send_80235(param1:* = null) : void
      {
         ZLog.add("80235：请求仙魔之路----进入地图");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80235,_loc2_);
      }
      
      public function send_80237(param1:* = null) : void
      {
         ZLog.add("80237：请求仙魔之路----装备预览");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.position);
         _loc2_.writeInt(param1.ID);
         NetWorkManager.sendMsg(80237,_loc2_);
      }
      
      public function send_80239(param1:* = null) : void
      {
         ZLog.add("80239：请求仙魔之路----装备升级");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.position);
         _loc2_.writeInt(param1.ID);
         NetWorkManager.sendMsg(80239,_loc2_);
      }
      
      public function send_80241(param1:* = null) : void
      {
         ZLog.add("80241：请求仙魔之路----传送");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80241,_loc2_);
      }
      
      public function send_80461(param1:* = null) : void
      {
         ZLog.add("80461：请求仙魔之路----转职");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80461,_loc2_);
      }
      
      public function send_80463(param1:* = null) : void
      {
         ZLog.add("80463：请求仙魔之路----种族界面");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80463,_loc2_);
      }
      
      public function send_80465(param1:* = null) : void
      {
         ZLog.add("80465：请求仙魔之路----显示/隐藏外观");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80465,_loc2_);
      }
      
      public function send_80467(param1:* = null) : void
      {
         ZLog.add("80467：请求仙魔之路----解除转职");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80467,_loc2_);
      }
      
      public function send_80491(param1:* = null) : void
      {
         ZLog.add("80491：请求仙魔觉醒");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80491,_loc2_);
      }
      
      public function send_80493(param1:* = null) : void
      {
         ZLog.add("80493：请求仙魔觉醒----升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80493,_loc2_);
      }
      
      public function send_80941(param1:* = null) : void
      {
         ZLog.add("80941：请求仙魔天技");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80941,_loc2_);
      }
      
      public function send_80943(param1:* = null) : void
      {
         ZLog.add("80943：请求仙魔天技----升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80943,_loc2_);
      }
      
      public function send_81101(param1:* = null) : void
      {
         ZLog.add("81101：请求仙魔天纹");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81101,_loc2_);
      }
      
      public function send_81103(param1:* = null) : void
      {
         ZLog.add("81103：请求仙魔天纹----升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81103,_loc2_);
      }
      
      public function send_81321(param1:* = null) : void
      {
         ZLog.add("81321：请求仙魔天瑞");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81321,_loc2_);
      }
      
      public function send_81323(param1:* = null) : void
      {
         ZLog.add("81323：请求仙魔天瑞----升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81323,_loc2_);
      }
      
      public function send_81325(param1:* = null) : void
      {
         ZLog.add("81325：请求仙魔天瑞----换装");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81325,_loc2_);
      }
      
      public function send_73005(param1:* = null) : void
      {
         ZLog.add("73005：请求玩家独孤求败换装");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[0]);
         NetWorkManager.sendMsg(73005,_loc2_);
      }
   }
}

