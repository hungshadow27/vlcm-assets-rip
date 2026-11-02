package com.tgame.moudels.kuafuzhan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Kuafuzhan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Kuafuzhan_MsgSenderProxy";
      
      public function Kuafuzhan_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_40211(param1:* = null) : void
      {
         ZLog.add("40211：跨服服务器查询");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40211,_loc2_);
      }
      
      public function send_10113(param1:* = null) : void
      {
         ZLog.add("10113：请求进入跨服服务器条件");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(10113,_loc2_);
      }
      
      public function send_10115(param1:* = null) : void
      {
         ZLog.add("10115：请求进入跨服服务器密钥");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(10115,_loc2_);
      }
   }
}

