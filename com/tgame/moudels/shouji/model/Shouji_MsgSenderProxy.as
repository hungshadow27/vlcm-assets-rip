package com.tgame.moudels.shouji.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shouji_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Shouji_MsgSenderProxy";
      
      public function Shouji_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_50901(param1:* = null) : void
      {
         ZLog.add("50901：请求收集信息初始化");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50901,_loc2_);
      }
      
      public function send_50903(param1:* = null) : void
      {
         ZLog.add("50903：提交古玩物品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50903,_loc2_);
      }
      
      public function send_50905(param1:* = null) : void
      {
         ZLog.add("50905：领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50905,_loc2_);
      }
   }
}

