package com.tgame.moudels.ynLongwuge.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNlongwuge_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNlongwuge_MsgSendProxy";
      
      public function YNlongwuge_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_79881(param1:* = null) : void
      {
         ZLog.add("79881：请求龙武阁钱监信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(79881,_loc2_);
      }
      
      public function send_79883(param1:* = null) : void
      {
         ZLog.add("79883：请求龙武阁升级");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79883,_loc2_);
      }
      
      public function send_79885(param1:* = null) : void
      {
         ZLog.add("79885：请求领取收益");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79885,_loc2_);
      }
      
      public function send_79887(param1:* = null) : void
      {
         ZLog.add("79887：请求增加农民");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(79887,_loc2_);
      }
      
      public function send_79889(param1:* = null) : void
      {
         ZLog.add("79889：请求龙武阁四圣兽面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[2]);
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(79889,_loc2_);
      }
   }
}

