package com.tgame.moudels.xuantiejianfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XuanTieJianFa_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XuanTieJianFa_MsgSenderProxy";
      
      public function XuanTieJianFa_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73101(param1:* = null) : void
      {
         ZLog.add("73101：请求玩家玄铁剑法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73101,_loc2_);
      }
      
      public function send_73103(param1:* = null) : void
      {
         ZLog.add("73103：请求玄铁剑法突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73103,_loc2_);
      }
      
      public function send_73105(param1:* = null) : void
      {
         ZLog.add("73105：请求玩家玄铁剑法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73105,_loc2_);
      }
   }
}

