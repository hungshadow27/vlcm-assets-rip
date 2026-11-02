package com.tgame.moudels.yuncheng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YunCheng_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YunCheng_MsgSenderProxy";
      
      public function YunCheng_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_54201(param1:* = -1) : void
      {
         ZLog.add("54201：发出 请求获得所有运程");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(54201,_loc2_);
      }
      
      public function send_54203(param1:* = null) : void
      {
         ZLog.add("54203：发出 请求激活运程_type= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54203,_loc2_);
      }
   }
}

