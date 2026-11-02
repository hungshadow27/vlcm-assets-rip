package com.tgame.moudels.pangxiezhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PangXieZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "PangXieZhen_MsgSenderProxy";
      
      public function PangXieZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71251(param1:* = null) : void
      {
         ZLog.add("71251\t\t请求玩家螃蟹阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71251,_loc2_);
      }
      
      public function send_71253(param1:* = null) : void
      {
         ZLog.add("71253\t\t玩家请求螃蟹阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71253,_loc2_);
      }
      
      public function send_71255(param1:* = null) : void
      {
         ZLog.add("71255\t\t请求突破螃蟹阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71255,_loc2_);
      }
      
      public function send_71257(param1:* = null) : void
      {
         ZLog.add("71257\t\t设置螃蟹阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71257,_loc2_);
      }
   }
}

