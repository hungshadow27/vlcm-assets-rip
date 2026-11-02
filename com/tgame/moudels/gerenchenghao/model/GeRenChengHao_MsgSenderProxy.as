package com.tgame.moudels.gerenchenghao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GeRenChengHao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "GeRenChengHao_MsgSenderProxy";
      
      public function GeRenChengHao_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73201(param1:* = null) : void
      {
         ZLog.add("73201：发出 请求普通称号列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73201,_loc2_);
      }
      
      public function send_73205(param1:* = null) : void
      {
         ZLog.add("73205：发出 请求专属称号列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73205,_loc2_);
      }
      
      public function send_73207(param1:* = null) : void
      {
         ZLog.add("73207：发出 请求显示或隐藏专属 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73207,_loc2_);
      }
      
      public function send_73209(param1:* = null) : void
      {
         ZLog.add("73209：发出 请求全平台专属列表 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73209,_loc2_);
      }
      
      public function send_73211(param1:* = null) : void
      {
         ZLog.add("73211：请求称号勾选");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73211,_loc2_);
      }
   }
}

