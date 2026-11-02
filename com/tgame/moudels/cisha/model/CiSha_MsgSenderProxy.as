package com.tgame.moudels.cisha.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CiSha_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "CiSha_MsgSenderProxy";
      
      public function CiSha_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_57451(param1:* = null) : void
      {
         ZLog.add("57451：请求复仇/刺杀成功奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57451,_loc2_);
      }
      
      public function send_57453(param1:* = null) : void
      {
         ZLog.add("57453：请求领取刺杀成功奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(57453,_loc2_);
      }
      
      public function send_57455(param1:* = null) : void
      {
         ZLog.add("57455：请求领取复仇成功奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(57455,_loc2_);
      }
      
      public function send_57411(param1:* = null) : void
      {
         ZLog.add("57411：请求刺杀密令面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57411,_loc2_);
      }
      
      public function send_57419(param1:int) : void
      {
         ZLog.add("57419：请求地下钱庄商城 列表 类型=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57419,_loc2_);
      }
      
      public function send_57421(param1:int, param2:int) : void
      {
         ZLog.add("57421： 钱庄金票兑换商城物品, id=" + param1);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(param1);
         _loc3_.writeShort(param2);
         NetWorkManager.sendMsg(57421,_loc3_);
      }
   }
}

