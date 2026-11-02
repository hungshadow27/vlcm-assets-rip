package com.tgame.moudels.amulet.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Amult_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Amult_MsgSenderProxy";
      
      public function Amult_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_50125(param1:* = null) : void
      {
      }
      
      public function send_52101(param1:* = null) : void
      {
         ZLog.add("52101舍利子镶嵌/拨除查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         NetWorkManager.sendMsg(52101,_loc2_);
      }
      
      public function send_52103(param1:* = null) : void
      {
         ZLog.add("52103舍利子镶嵌确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         _loc2_.writeInt(param1.sid);
         _loc2_.writeShort(param1.sxy);
         NetWorkManager.sendMsg(52103,_loc2_);
      }
      
      public function send_52105(param1:* = null) : void
      {
         ZLog.add("52105舍利子拨除确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         _loc2_.writeByte(param1.sid);
         NetWorkManager.sendMsg(52105,_loc2_);
      }
      
      public function send_52107(param1:* = null) : void
      {
         ZLog.add("52107舍利子合成查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         NetWorkManager.sendMsg(52107,_loc2_);
      }
      
      public function send_52109(param1:* = null) : void
      {
         ZLog.add("52109舍利子合成确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         _loc2_.writeByte(param1.useJLJH);
         NetWorkManager.sendMsg(52109,_loc2_);
      }
      
      public function send_52111(param1:* = null) : void
      {
         ZLog.add("52111护身符进阶查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         NetWorkManager.sendMsg(52111,_loc2_);
      }
      
      public function send_52113(param1:* = null) : void
      {
         ZLog.add("52113重置武功类型查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         NetWorkManager.sendMsg(52113,_loc2_);
      }
      
      public function send_52115(param1:* = null) : void
      {
         ZLog.add("52115护身符进阶确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         NetWorkManager.sendMsg(52115,_loc2_);
      }
      
      public function send_52117(param1:* = null) : void
      {
         ZLog.add("52117重置武功类型确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         _loc2_.writeShort(param1.xingyunJingNum);
         NetWorkManager.sendMsg(52117,_loc2_);
      }
      
      public function send_52121(param1:* = null) : void
      {
         ZLog.add("52121护身符进阶查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         NetWorkManager.sendMsg(52121,_loc2_);
      }
      
      public function send_52123(param1:* = null) : void
      {
         ZLog.add("52123护身符进阶确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.xy);
         NetWorkManager.sendMsg(52123,_loc2_);
      }
      
      public function send_50181(param1:* = null) : void
      {
         ZLog.add("50181 2011清明节活动 融雪丹确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         NetWorkManager.sendMsg(50181,_loc2_);
      }
      
      public function send_52125(param1:* = null) : void
      {
         ZLog.add("52125 打孔查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0] as int);
         _loc2_.writeInt(param1[1] as int);
         NetWorkManager.sendMsg(52125,_loc2_);
      }
      
      public function send_52127(param1:* = null) : void
      {
         ZLog.add("52127 打孔确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0] as int);
         _loc2_.writeInt(param1[1] as int);
         NetWorkManager.sendMsg(52127,_loc2_);
      }
      
      public function send_52161(param1:* = null) : void
      {
         ZLog.add("52161 道具提取宝盒刷新");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52161,_loc2_);
      }
      
      public function send_52163(param1:* = null) : void
      {
         ZLog.add("52163 道具提取宝盒领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1 as int);
         NetWorkManager.sendMsg(52163,_loc2_);
      }
      
      public function send_83121(param1:* = null) : void
      {
         ZLog.add("83121 打孔查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0] as int);
         _loc2_.writeInt(param1[1] as int);
         NetWorkManager.sendMsg(83121,_loc2_);
      }
      
      public function send_83123(param1:* = null) : void
      {
         ZLog.add("83123 打孔确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0] as int);
         _loc2_.writeInt(param1[1] as int);
         NetWorkManager.sendMsg(83123,_loc2_);
      }
   }
}

