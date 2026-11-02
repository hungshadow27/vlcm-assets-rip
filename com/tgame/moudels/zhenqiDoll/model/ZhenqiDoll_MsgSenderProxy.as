package com.tgame.moudels.zhenqiDoll.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhenqiDoll_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgSenderProxy";
      
      public function ZhenqiDoll_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_50701(param1:* = null) : void
      {
         ZLog.add("50701：发送将身上的真气灌入充气娃娃消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(50701,_loc2_);
      }
      
      public function send_50707(param1:* = null) : void
      {
         ZLog.add("50707：发送将充气娃娃中的真气灌入到角色身上消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(50707,_loc2_);
      }
      
      public function send_50705(param1:* = null) : void
      {
         ZLog.add("50705：发送古树精魄查询消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50705,_loc2_);
      }
      
      public function send_51401(param1:* = null) : void
      {
         ZLog.add("51401：发送提取超级古树精魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(51401,_loc2_);
      }
   }
}

