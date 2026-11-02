package com.tgame.moudels.BeiMingShenGong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BeiMingShenGong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BeiMingShenGong_MsgSenderProxy";
      
      public function BeiMingShenGong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_56101(param1:* = null) : void
      {
         ZLog.add("56101：北冥神功 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(56101,_loc2_);
      }
      
      public function send_56103(param1:* = null) : void
      {
         ZLog.add("56103：北冥神功领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(56103,_loc2_);
      }
      
      public function send_56105(param1:* = null) : void
      {
         ZLog.add("56105：北冥神功申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(56105,_loc2_);
      }
      
      public function send_56107(param1:* = null) : void
      {
         ZLog.add("56107：北冥神功设置武功是否开启");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(56107,_loc2_);
      }
   }
}

