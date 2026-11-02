package com.tgame.moudels.yurenjie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YuRenJie_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YuRenJie_MsgSenderProxy";
      
      public function YuRenJie_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73131(param1:* = null) : void
      {
         ZLog.add("73131：打开愚人节面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73131,_loc2_);
      }
      
      public function send_73133(param1:int) : void
      {
         ZLog.add("73133：请求排行榜数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73133,_loc2_);
      }
      
      public function send_73137(param1:* = null) : void
      {
         ZLog.add("73137：领取战袍");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73137,_loc2_);
      }
      
      public function send_73139(param1:* = null) : void
      {
         ZLog.add("73139：领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73139,_loc2_);
      }
   }
}

