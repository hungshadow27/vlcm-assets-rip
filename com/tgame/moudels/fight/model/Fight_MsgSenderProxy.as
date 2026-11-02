package com.tgame.moudels.fight.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fight_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Fight_MsgSenderProxy";
      
      public function Fight_MsgSenderProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function send_10083(param1:* = null) : void
      {
         ZLog.add("10083：发送主角攻击其他角色消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(10083,_loc2_);
      }
      
      public function send_10283(param1:* = null) : void
      {
         ZLog.add("10283：发送主角攻击地面消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeShort(param1[2]);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(10283,_loc2_);
      }
      
      public function send_20075(param1:* = null) : void
      {
         ZLog.add("20075：发送主角请求复活");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(20075,_loc2_);
      }
      
      public function send_10901(param1:* = null) : void
      {
         ZLog.add("10901：发送PK模式切换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(10901,_loc2_);
      }
      
      public function send_52005(param1:* = null) : void
      {
         ZLog.add("52005：开启暗器使用");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = param1 == true ? 1 : 0;
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52005,_loc2_);
      }
      
      public function send_52009(param1:* = null) : void
      {
         ZLog.add("52009：暗器突破瓶颈");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52009,_loc2_);
      }
      
      public function send_52011(param1:* = null) : void
      {
         ZLog.add("52011：使用暗器提速石提速");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52011,_loc2_);
      }
      
      public function send_52017(param1:* = null) : void
      {
         ZLog.add("52017：查看其他玩家暗器请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52017,_loc2_);
      }
      
      public function send_52019(param1:* = null) : void
      {
         ZLog.add("52019：查看激活暗器隐藏属性请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52019,_loc2_);
      }
      
      public function send_52021(param1:* = null) : void
      {
         ZLog.add("52021：暗器开封面板信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52021,_loc2_);
      }
      
      public function send_52023(param1:* = null) : void
      {
         ZLog.add("52023：暗器开封");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52023,_loc2_);
      }
      
      public function send_10151(param1:* = null) : void
      {
         ZLog.add("10151:比武招亲大雕开始、取消");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(10151,_loc2_);
      }
      
      public function send_61031(param1:* = null) : void
      {
         ZLog.add("61031:夫妻竞技大雕开始、取消");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61031,_loc2_);
      }
   }
}

