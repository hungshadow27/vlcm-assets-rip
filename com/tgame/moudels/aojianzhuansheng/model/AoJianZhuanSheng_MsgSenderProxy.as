package com.tgame.moudels.aojianzhuansheng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianZhuanSheng_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "AoJianZhuanSheng_MsgSenderProxy";
      
      public function AoJianZhuanSheng_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_80191(param1:* = null) : void
      {
         ZLog.add("80191：请求傲剑转生信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80191,_loc2_);
      }
      
      public function send_80193(param1:* = null) : void
      {
         ZLog.add("80193：请求转生注灵");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80193,_loc2_);
      }
      
      public function send_80195(param1:* = null) : void
      {
         ZLog.add("80195：请求转生");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80195,_loc2_);
      }
   }
}

