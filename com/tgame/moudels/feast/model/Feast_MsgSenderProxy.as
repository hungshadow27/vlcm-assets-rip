package com.tgame.moudels.feast.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Feast_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgSenderProxy";
      
      public function Feast_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_52249(param1:int) : void
      {
         ZLog.add("52249：申请婚宴");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52249,_loc2_);
      }
      
      public function send_52251(param1:int) : void
      {
         ZLog.add("52251：红包列表请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52251,_loc2_);
      }
      
      public function send_52253(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         ZLog.add("52253：参加婚宴查询");
         NetWorkManager.sendMsg(52253,_loc2_);
      }
      
      public function send_52255(param1:* = null) : void
      {
         ZLog.add("52255： 给红包");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(52255,_loc2_);
      }
      
      public function send_52257(param1:* = null) : void
      {
         ZLog.add("52257：食用菜肴请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52257,_loc2_);
      }
      
      public function send_52259(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52259,_loc2_);
         ZLog.add("52259：红包领取→无需参数");
      }
      
      public function send_52261(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         ZLog.add("52261页码： " + param1);
         NetWorkManager.sendMsg(52261,_loc2_);
      }
   }
}

