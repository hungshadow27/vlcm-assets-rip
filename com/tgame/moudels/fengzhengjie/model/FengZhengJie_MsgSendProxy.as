package com.tgame.moudels.fengzhengjie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FengZhengJie_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "FengZhengJie_MsgSendProxy";
      
      public function FengZhengJie_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73251(param1:* = null) : void
      {
         ZLog.add("73251：打开风筝节面板请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73251,_loc2_);
      }
      
      public function send_73253(param1:int, param2:int) : void
      {
         ZLog.add("73253：请求风筝节排行榜数据");
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param2);
         _loc3_.writeInt(param1);
         NetWorkManager.sendMsg(73253,_loc3_);
      }
      
      public function send_73263(param1:* = null) : void
      {
         ZLog.add("73263：领取美人");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73263,_loc2_);
      }
      
      public function send_73261(param1:* = null) : void
      {
         ZLog.add("73261：领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73261,_loc2_);
      }
      
      public function send_73255(param1:* = null) : void
      {
         ZLog.add("73255：制作风筝");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73255,_loc2_);
      }
      
      public function send_73257(param1:* = null) : void
      {
         ZLog.add("73257：升级风筝");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73257,_loc2_);
      }
      
      public function send_73259(param1:* = null) : void
      {
         ZLog.add("73259：把风筝赠送给npc");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73259,_loc2_);
      }
   }
}

