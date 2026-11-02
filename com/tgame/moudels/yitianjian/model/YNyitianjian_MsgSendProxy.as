package com.tgame.moudels.yitianjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNyitianjian_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNyitianjian_MsgSendProxy";
      
      public function YNyitianjian_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_82291(param1:* = null) : void
      {
         ZLog.add("82291：请求倚天剑面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82291,_loc2_);
      }
      
      public function send_82293(param1:* = null) : void
      {
         ZLog.add("82293：请求倚天剑激活");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82293,_loc2_);
      }
   }
}

