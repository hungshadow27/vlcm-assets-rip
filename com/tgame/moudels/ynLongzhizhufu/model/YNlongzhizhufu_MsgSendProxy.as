package com.tgame.moudels.ynLongzhizhufu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNlongzhizhufu_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNlongzhizhufu_MsgSendProxy";
      
      public function YNlongzhizhufu_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74881(param1:* = null) : void
      {
         ZLog.add("74881：请求在线奖励面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74881,_loc2_);
      }
      
      public function send_74883(param1:* = null) : void
      {
         ZLog.add("74883：请求领取在线奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(74883,_loc2_);
      }
   }
}

