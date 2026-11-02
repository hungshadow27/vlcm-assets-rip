package com.tgame.moudels.douZhuanXingYi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DouZhuanXingYi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "DouZhuanXingYi_MsgSenderProxy";
      
      public function DouZhuanXingYi_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_61301(param1:* = null) : void
      {
         ZLog.add("61301：请求玩家斗转星移详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(61301,_loc2_);
      }
      
      public function send_61303(param1:* = null) : void
      {
         ZLog.add("61303\t\t玩家请求斗转星移突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(61303,_loc2_);
      }
      
      public function send_61305(param1:* = null) : void
      {
         ZLog.add("61305：请求突破斗转星移");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61305,_loc2_);
      }
   }
}

