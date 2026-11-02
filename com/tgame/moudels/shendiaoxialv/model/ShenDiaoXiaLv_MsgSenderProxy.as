package com.tgame.moudels.shendiaoxialv.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShenDiaoXiaLv_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ShenDiaoXiaLv_MsgSenderProxy";
      
      public function ShenDiaoXiaLv_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_61021(param1:* = null) : void
      {
         ZLog.add("61021：发出 请求刷新");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(61021,_loc2_);
      }
      
      public function send_61023(param1:* = null) : void
      {
         ZLog.add("61023：发出 请求领取神雕之羽");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61023,_loc2_);
      }
      
      public function send_61025(param1:* = null) : void
      {
         ZLog.add("61025：发出 请求领取侠侣碎片");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61025,_loc2_);
      }
      
      public function send_61027(param1:* = null) : void
      {
         ZLog.add("61027：发出 请求申请活动 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[2]);
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(61027,_loc2_);
      }
   }
}

