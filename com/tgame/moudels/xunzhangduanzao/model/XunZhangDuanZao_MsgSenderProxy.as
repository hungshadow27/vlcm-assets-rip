package com.tgame.moudels.xunzhangduanzao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangDuanZao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangDuanZao_MsgSenderProxy";
      
      public function XunZhangDuanZao_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_53565(param1:* = null) : void
      {
         ZLog.add("53565:请求勋章/战旗锻造/帝王剑面板消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(53565,_loc2_);
      }
      
      public function send_53567(param1:* = null) : void
      {
         ZLog.add("53567:请求勋章/战旗锻造/帝王剑确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeByte(param1[2]);
         _loc2_.writeShort(param1[3]);
         _loc2_.writeShort(param1[4]);
         NetWorkManager.sendMsg(53567,_loc2_);
      }
      
      public function send_53575(param1:* = null) : void
      {
         ZLog.add("53575:请求勋章强化面板消息，多种强化方式");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(53575,_loc2_);
      }
      
      public function send_53577(param1:* = null) : void
      {
         ZLog.add("53577:请求勋章强化消息，多种强化方式");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(53577,_loc2_);
      }
      
      public function send_53579(param1:* = null) : void
      {
         ZLog.add("53579:请求进化面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(53579,_loc2_);
      }
      
      public function send_82701(param1:* = null) : void
      {
         ZLog.add("82701:武防强化面板请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(82701,_loc2_);
      }
      
      public function send_82703(param1:* = null) : void
      {
         ZLog.add("82703:武防强化开始");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(82703,_loc2_);
      }
   }
}

