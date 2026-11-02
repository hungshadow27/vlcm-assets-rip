package com.tgame.moudels.huangjinshu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HuangJinShu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "HuangJinShu_MsgSenderProxy";
      
      public function HuangJinShu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73051(param1:* = null) : void
      {
         ZLog.add("73051：请求黄金树面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73051,_loc2_);
      }
      
      public function send_73053(param1:* = null) : void
      {
         ZLog.add("73053：请求浇水");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73053,_loc2_);
      }
      
      public function send_73055(param1:* = null) : void
      {
         ZLog.add("73055：请求领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73055,_loc2_);
      }
   }
}

