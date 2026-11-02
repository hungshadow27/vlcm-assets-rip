package com.tgame.moudels.fuWenKeHua.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FuWenKeHua_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "FuWenKeHua_MsgSenderProxy";
      
      public function FuWenKeHua_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_78421(param1:* = null) : void
      {
         ZLog.add("78421\t\t请求符文刻画信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(78421,_loc2_);
      }
      
      public function send_78423(param1:* = null) : void
      {
         ZLog.add("78423\t\t请求符文详细信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(78423,_loc2_);
      }
      
      public function send_78425(param1:* = null) : void
      {
         ZLog.add("78425\t\t请求符文换装显示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(78425,_loc2_);
      }
   }
}

