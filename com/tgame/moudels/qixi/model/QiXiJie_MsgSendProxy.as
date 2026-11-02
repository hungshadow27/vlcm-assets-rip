package com.tgame.moudels.qixi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiXiJie_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "QiXiJie_MsgSendProxy";
      
      public function QiXiJie_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74301(param1:* = null) : void
      {
         ZLog.add("74301：打开七夕节面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74301,_loc2_);
      }
      
      public function send_74303(param1:* = null) : void
      {
         ZLog.add("74303：请求七夕节奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74303,_loc2_);
      }
      
      public function send_74305(param1:* = null) : void
      {
         ZLog.add("74305：请求排行榜");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74305,_loc2_);
      }
      
      public function send_74307(param1:* = null) : void
      {
         ZLog.add("74307：请求提交喜鹊");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74307,_loc2_);
      }
   }
}

