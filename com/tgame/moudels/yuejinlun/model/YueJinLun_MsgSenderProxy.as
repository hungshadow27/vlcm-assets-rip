package com.tgame.moudels.yuejinlun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YueJinLun_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YueJinLun_MsgSenderProxy";
      
      public function YueJinLun_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74451(param1:* = null) : void
      {
         ZLog.add("74451：请求月金轮面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74451,_loc2_);
      }
      
      public function send_74453(param1:* = null) : void
      {
         ZLog.add("74453：请求月金轮领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74453,_loc2_);
      }
      
      public function send_74455(param1:* = null) : void
      {
         ZLog.add("74455：请求领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74455,_loc2_);
      }
   }
}

