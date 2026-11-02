package com.tgame.moudels.rijinlun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Rijinlun_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Rijinlun_MsgSenderProxy";
      
      public function Rijinlun_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74321(param1:* = null) : void
      {
         ZLog.add("74321：请求日金轮面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74321,_loc2_);
      }
      
      public function send_74323(param1:* = null) : void
      {
         ZLog.add("74323：请求日金轮领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74323,_loc2_);
      }
      
      public function send_74325(param1:* = null) : void
      {
         ZLog.add("74325：请求领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74325,_loc2_);
      }
   }
}

