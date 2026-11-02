package com.tgame.moudels.xunzhangduihuan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangDuiHuan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangDuiHuan_MsgSenderProxy";
      
      public function XunZhangDuiHuan_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_59651(param1:* = null) : void
      {
         ZLog.add("59651：请求勋章兑换面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59651,_loc2_);
      }
      
      public function send_59653(param1:* = null) : void
      {
         ZLog.add("59653：请求翻页");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(59653,_loc2_);
      }
      
      public function send_59655(param1:* = null) : void
      {
         ZLog.add("59655：兑换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(59655,_loc2_);
      }
   }
}

