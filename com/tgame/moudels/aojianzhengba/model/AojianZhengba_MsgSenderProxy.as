package com.tgame.moudels.aojianzhengba.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AojianZhengba_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "AojianZhengba_MsgSenderProxy";
      
      public function AojianZhengba_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_57901(param1:* = null) : void
      {
         ZLog.add("57901：傲剑争霸战场线路信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(57901,_loc2_);
      }
      
      public function send_57903(param1:* = null) : void
      {
         ZLog.add("57903：请求进入傲剑争霸战场");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(57903,_loc2_);
      }
   }
}

