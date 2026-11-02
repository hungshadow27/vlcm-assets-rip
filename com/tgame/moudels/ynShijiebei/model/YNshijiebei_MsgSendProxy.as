package com.tgame.moudels.ynShijiebei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNshijiebei_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNshijiebei_MsgSendProxy";
      
      public function YNshijiebei_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73791(param1:* = null) : void
      {
         ZLog.add("73791：请求是否显示世界杯面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73791,_loc2_);
      }
      
      public function send_73793(param1:* = null) : void
      {
         ZLog.add("73793：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73793,_loc2_);
      }
      
      public function send_73795(param1:* = null) : void
      {
         ZLog.add("73795：提交足球");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73795,_loc2_);
      }
      
      public function send_79443(param1:* = null) : void
      {
         ZLog.add("79443：请求排行榜");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(79443,_loc2_);
      }
      
      public function send_79441(param1:* = null) : void
      {
         ZLog.add("79441：提交物品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[1]);
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(79441,_loc2_);
      }
      
      public function send_79445(param1:* = null) : void
      {
         ZLog.add("79445：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79445,_loc2_);
      }
   }
}

