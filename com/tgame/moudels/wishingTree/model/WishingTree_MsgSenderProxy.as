package com.tgame.moudels.wishingTree.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WishingTree_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WishingTree_MsgSenderProxy";
      
      public function WishingTree_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73031(param1:* = null) : void
      {
         ZLog.add("73031：请求许愿树面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73031,_loc2_);
      }
      
      public function send_73033(param1:* = null) : void
      {
         ZLog.add("73033：请求浇水");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73033,_loc2_);
      }
      
      public function send_73035(param1:* = null) : void
      {
         ZLog.add("73035：好友浇水");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73035,_loc2_);
      }
      
      public function send_73037(param1:* = null) : void
      {
         ZLog.add("73037：好友浇水记录");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73037,_loc2_);
      }
      
      public function send_73039(param1:* = null) : void
      {
         ZLog.add("73039：请求领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73039,_loc2_);
      }
      
      public function send_73041(param1:* = null) : void
      {
         ZLog.add("73041：请求前往浇水");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73041,_loc2_);
      }
      
      public function send_73043(param1:* = null) : void
      {
         ZLog.add("73043：种下 许愿树");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(73043,_loc2_);
      }
   }
}

