package com.tgame.moudels.Fashion.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fashion_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Fashion_MsgSenderProxy";
      
      public function Fashion_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_73321(param1:* = null) : void
      {
         ZLog.add("73321：请求时装面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(73321,_loc2_);
      }
      
      public function send_73323(param1:* = null) : void
      {
         ZLog.add("73323：请求试穿时装");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(73323,_loc2_);
      }
      
      public function send_73325(param1:* = null) : void
      {
         ZLog.add("73325：请求保存时装换装");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(73325,_loc2_);
      }
      
      public function send_83171(param1:* = null) : void
      {
         ZLog.add("83171：请求保存时装换装");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83171,_loc2_);
      }
   }
}

