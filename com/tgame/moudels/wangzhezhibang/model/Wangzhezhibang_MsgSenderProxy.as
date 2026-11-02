package com.tgame.moudels.wangzhezhibang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wangzhezhibang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Wangzhezhibang_MsgSenderProxy";
      
      public function Wangzhezhibang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74541(param1:* = null) : void
      {
         ZLog.add("74541：请求王者之帮面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74541,_loc2_);
      }
      
      public function send_74543(param1:* = null) : void
      {
         ZLog.add("74543：请求报名");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74543,_loc2_);
      }
      
      public function send_74545(param1:* = null) : void
      {
         ZLog.add("74545：请求流程图");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74545,_loc2_);
      }
      
      public function send_74547(param1:* = null) : void
      {
         ZLog.add("74547：请求进入比赛");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74547,_loc2_);
      }
      
      public function send_74549(param1:* = null) : void
      {
         ZLog.add("74549：请求助威面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(74549,_loc2_);
      }
      
      public function send_74551(param1:* = null) : void
      {
         ZLog.add("74551：请求比赛时间");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74551,_loc2_);
      }
      
      public function send_74553(param1:* = null) : void
      {
         ZLog.add("74553：请求历届霸主面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74553,_loc2_);
      }
      
      public function send_74557(param1:* = null) : void
      {
         ZLog.add("74557：请求领奖面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74557,_loc2_);
      }
      
      public function send_74569(param1:* = null) : void
      {
         ZLog.add("74569：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74569,_loc2_);
      }
      
      public function send_74571(param1:* = null) : void
      {
         ZLog.add("74571：请求膜拜王者");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74571,_loc2_);
      }
      
      public function send_74573(param1:* = null) : void
      {
         ZLog.add("74573：请求助威");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(74573,_loc2_);
      }
   }
}

