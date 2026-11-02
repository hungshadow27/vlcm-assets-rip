package com.tgame.moudels.skill.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Skill_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Skill_MsgSenderProxy";
      
      public function Skill_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_10271(param1:* = null) : void
      {
         ZLog.add("10271：发送技能升级消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(10271,_loc2_);
      }
      
      public function send_10275(param1:* = null) : void
      {
         ZLog.add("10275：发送技能突破消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10275,_loc2_);
      }
      
      public function send_10291(param1:* = null) : void
      {
         ZLog.add("10291：发送查询该技能的突破瓶颈信息消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10291,_loc2_);
      }
      
      public function send_50631(param1:* = null) : void
      {
         ZLog.add("50631：发送修炼心法消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50631,_loc2_);
      }
      
      public function send_82421(param1:* = null) : void
      {
         ZLog.add("82421:请求武防");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82421,_loc2_);
      }
      
      public function send_83241(param1:* = null) : void
      {
         ZLog.add("83241:请求天赋");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83241,_loc2_);
      }
      
      public function send_83243(param1:* = null) : void
      {
         ZLog.add("83243:请求天赋突破");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83243,_loc2_);
      }
   }
}

