package com.tgame.moudels.xinnianyasuiqian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Xinnianyasuiqian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Xinnianyasuiqian_MsgSenderProxy";
      
      public function Xinnianyasuiqian_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_82031(param1:* = null) : void
      {
         ZLog.add("82031：发出 请求在线玩家列表$name= ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(82031,_loc2_);
      }
      
      public function send_82033(param1:* = null) : void
      {
         ZLog.add("82033：发出 请求送花");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82033,_loc2_);
      }
      
      public function send_82035(param1:* = null) : void
      {
         ZLog.add("82035：发出 请求确认送花");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(82035,_loc2_);
      }
      
      public function send_82037(param1:* = null) : void
      {
         ZLog.add("82037：发出 请求排行榜");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82037,_loc2_);
      }
      
      public function send_82039(param1:* = null) : void
      {
         ZLog.add("82039：发出 请求领取排行榜奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82039,_loc2_);
      }
   }
}

