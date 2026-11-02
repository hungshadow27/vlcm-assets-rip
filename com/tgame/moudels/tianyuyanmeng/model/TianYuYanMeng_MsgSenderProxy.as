package com.tgame.moudels.tianyuyanmeng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianYuYanMeng_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TianYuYanMeng_MsgSenderProxy";
      
      public function TianYuYanMeng_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73751(param1:* = null) : void
      {
         ZLog.add("73751：请求玩家天欲烟梦详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73751,_loc2_);
      }
      
      public function send_73753(param1:* = null) : void
      {
         ZLog.add("73753：请求天欲烟梦突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73753,_loc2_);
      }
      
      public function send_73755(param1:* = null) : void
      {
         ZLog.add("73755：请求玩家天欲烟梦详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73755,_loc2_);
      }
   }
}

