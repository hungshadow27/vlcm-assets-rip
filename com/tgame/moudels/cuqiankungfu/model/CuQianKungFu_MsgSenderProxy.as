package com.tgame.moudels.cuqiankungfu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CuQianKungFu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "CuQianKungFu_MsgSenderProxy";
      
      public function CuQianKungFu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_73451(param1:* = null) : void
      {
         ZLog.add("73451：粗浅功夫 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73451,_loc2_);
      }
      
      public function send_73453(param1:* = null) : void
      {
         ZLog.add("73453：请求挑战粗浅功夫");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73453,_loc2_);
      }
   }
}

