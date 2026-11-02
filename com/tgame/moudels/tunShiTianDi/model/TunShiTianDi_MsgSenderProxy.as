package com.tgame.moudels.tunShiTianDi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TunShiTianDi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TunShiTianDi_MsgSenderProxy";
      
      public function TunShiTianDi_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73951(param1:* = null) : void
      {
         ZLog.add("73951 \t请求吞食天地信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73951,_loc2_);
      }
      
      public function send_73953(param1:* = null) : void
      {
         ZLog.add("73953 \t请求吞食天地排行榜");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73953,_loc2_);
      }
      
      public function send_73955(param1:* = null) : void
      {
         ZLog.add("73955 \t吞食天地请求、取消报名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73955,_loc2_);
      }
      
      public function send_73957(param1:* = null) : void
      {
         ZLog.add("73957 \t请求吞食天地领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73957,_loc2_);
      }
      
      public function send_73973(param1:* = null) : void
      {
         ZLog.add("73973 \t玩家请求选择角色");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73973,_loc2_);
      }
      
      public function send_73975(param1:* = null) : void
      {
         ZLog.add("73975 \t玩家请求特定职业属性");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73975,_loc2_);
      }
   }
}

