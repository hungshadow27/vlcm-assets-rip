package com.tgame.moudels.dazuo.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DaZuo_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "DaZuo_MsgSenderProxy";
      
      public function DaZuo_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_50503(param1:* = null) : void
      {
         ZLog.add("50503:开始打坐");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50503,_loc2_);
      }
      
      public function send_50507(param1:* = null) : void
      {
         ZLog.add("50507:玩家查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeShort(param1.pageNum);
         _loc2_.writeUTF(param1.name);
         NetWorkManager.sendMsg(50507,_loc2_);
      }
      
      public function send_50509(param1:* = null) : void
      {
         ZLog.add("50509:请求双修");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeInt(param1.targetID);
         NetWorkManager.sendMsg(50509,_loc2_);
      }
      
      public function send_50511(param1:* = null) : void
      {
         ZLog.add("50511:是否同意双修");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.isShuangXiu);
         NetWorkManager.sendMsg(50511,_loc2_);
      }
   }
}

