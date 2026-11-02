package com.tgame.moudels.biguan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Biguan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Biguan_MsgSenderProxy";
      
      public function Biguan_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_50551(param1:* = null) : void
      {
         ZLog.add("50551：发出闭关时间");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50551,_loc2_);
      }
      
      public function send_50553(param1:int, param2:* = null) : void
      {
         ZLog.add("50553：是否使用闭关令");
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param2);
         NetWorkManager.sendMsg(50553,_loc3_);
      }
   }
}

