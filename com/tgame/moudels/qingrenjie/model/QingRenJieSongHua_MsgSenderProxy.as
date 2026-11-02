package com.tgame.moudels.qingrenjie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingRenJieSongHua_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QingRenJieSongHua_MsgSenderProxy";
      
      public function QingRenJieSongHua_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_72701(param1:* = null) : void
      {
         ZLog.add("72701：发出 请求在线玩家列表$name= ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(72701,_loc2_);
      }
      
      public function send_72703(param1:* = null) : void
      {
         ZLog.add("72703：发出 请求送花");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72703,_loc2_);
      }
      
      public function send_72705(param1:* = null) : void
      {
         ZLog.add("72705：发出 请求确认送花");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(72705,_loc2_);
      }
      
      public function send_82465(param1:* = null) : void
      {
         ZLog.add("82465：发出 请求确认送花");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(82465,_loc2_);
      }
      
      public function send_82485(param1:* = null) : void
      {
         ZLog.add("82485：请求投票");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82485,_loc2_);
      }
      
      public function send_83095(param1:* = null) : void
      {
         ZLog.add("83095：请求师徒赠送");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83095,_loc2_);
      }
   }
}

