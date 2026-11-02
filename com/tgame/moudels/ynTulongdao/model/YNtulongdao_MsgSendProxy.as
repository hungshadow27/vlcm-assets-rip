package com.tgame.moudels.ynTulongdao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNtulongdao_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNtulongdao_MsgSendProxy";
      
      public function YNtulongdao_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_81121(param1:* = null) : void
      {
         ZLog.add("81121：请求屠龙刀面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81121,_loc2_);
      }
      
      public function send_81123(param1:* = null) : void
      {
         ZLog.add("81123：请求激活屠龙刀");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81123,_loc2_);
      }
   }
}

