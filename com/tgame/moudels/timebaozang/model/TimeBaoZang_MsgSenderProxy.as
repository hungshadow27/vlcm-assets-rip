package com.tgame.moudels.timebaozang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TimeBaoZang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TimeBaoZang_MsgSenderProxy";
      
      public function TimeBaoZang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_60911(param1:* = null) : void
      {
         ZLog.add("60911：时间宝藏 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60911,_loc2_);
      }
      
      public function send_60913(param1:* = null) : void
      {
         ZLog.add("60913：请求兑换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(60913,_loc2_);
      }
      
      public function send_60915(param1:* = null) : void
      {
         ZLog.add("60915：关闭时间宝藏面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60915,_loc2_);
      }
   }
}

