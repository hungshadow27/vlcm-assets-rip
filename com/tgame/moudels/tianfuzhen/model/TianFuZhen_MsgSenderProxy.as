package com.tgame.moudels.tianfuzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianFuZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TianFuZhen_MsgSenderProxy";
      
      public function TianFuZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_71451(param1:* = null) : void
      {
         ZLog.add("71451\t\t请求玩家天覆阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71451,_loc2_);
      }
      
      public function send_71453(param1:* = null) : void
      {
         ZLog.add("71453\t\t玩家请求天覆阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71453,_loc2_);
      }
      
      public function send_71455(param1:* = null) : void
      {
         ZLog.add("71455\t\t请求突破天覆阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71455,_loc2_);
      }
      
      public function send_71457(param1:* = null) : void
      {
         ZLog.add("71457\t\t设置天覆阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71457,_loc2_);
      }
   }
}

