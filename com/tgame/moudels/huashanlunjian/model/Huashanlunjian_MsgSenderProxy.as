package com.tgame.moudels.huashanlunjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Huashanlunjian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Huashanlunjian_MsgSenderProxy";
      
      public function Huashanlunjian_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74421(param1:* = null) : void
      {
         ZLog.add("74421：请求华山论剑面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74421,_loc2_);
      }
      
      public function send_74423(param1:* = null) : void
      {
         ZLog.add("74423：请求领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74423,_loc2_);
      }
      
      public function send_74425(param1:* = null) : void
      {
         ZLog.add("74425：请求领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74425,_loc2_);
      }
   }
}

