package com.tgame.moudels.silingzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class SiLingZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "SiLingZhen_MsgSenderProxy";
      
      public function SiLingZhen_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53405(param1:* = null) : void
      {
         ZLog.add("53405：发出 请求获得已激活四灵阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53405,_loc2_);
      }
      
      public function send_53401(param1:* = null) : void
      {
         ZLog.add("53401：发出 请求升级四灵阵_type= " + param1[0]);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(53401,_loc2_);
      }
      
      public function send_53407() : void
      {
         ZLog.add("53407：激活四灵阵隐藏属性");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53407,_loc1_);
      }
   }
}

