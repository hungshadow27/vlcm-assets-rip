package com.tgame.moudels.xunzhangyangcheng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangYangCheng_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangYangCheng_MsgSenderProxy";
      
      public function XunZhangYangCheng_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_61461(param1:* = null) : void
      {
         ZLog.add("61461：请求勋章养成面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(61461,_loc2_);
      }
      
      public function send_61463(param1:* = null) : void
      {
         ZLog.add("61463：请求领取道具");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61463,_loc2_);
      }
      
      public function send_61465(param1:* = null) : void
      {
         ZLog.add("61465：请求一键养成");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61465,_loc2_);
      }
   }
}

