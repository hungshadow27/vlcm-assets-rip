package com.tgame.moudels.xunzhang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhang_MsgSenderProxy";
      
      public function XunZhang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_59657(param1:* = null) : void
      {
         ZLog.add("59657：请求勋章兑换面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(59657,_loc2_);
      }
      
      public function send_59659(param1:* = null) : void
      {
         ZLog.add("59659：请求翻页");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeByte(int(param1[2]));
         NetWorkManager.sendMsg(59659,_loc2_);
      }
   }
}

