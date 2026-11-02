package com.tgame.moudels.hutaozhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HuTaoZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "HuTaoZhen_MsgSenderProxy";
      
      public function HuTaoZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71101(param1:* = null) : void
      {
         ZLog.add("71101\t\t请求玩家虎韬阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71101,_loc2_);
      }
      
      public function send_71103(param1:* = null) : void
      {
         ZLog.add("71103\t\t玩家请求虎韬阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71103,_loc2_);
      }
      
      public function send_71105(param1:* = null) : void
      {
         ZLog.add("71105\t\t请求突破虎韬阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71105,_loc2_);
      }
      
      public function send_71107(param1:* = null) : void
      {
         ZLog.add("71107\t\t设置虎韬阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71107,_loc2_);
      }
   }
}

