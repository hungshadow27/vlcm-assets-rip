package com.tgame.moudels.aojianzhuzao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianZhuZao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Biguan_MsgSenderProxy";
      
      public function AoJianZhuZao_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_58101(param1:* = null) : void
      {
         ZLog.add("58101:请求放入傲剑碎片");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.goodId);
         NetWorkManager.sendMsg(58101,_loc2_);
      }
      
      public function send_58103(param1:* = null) : void
      {
         ZLog.add("58103:请求铸造傲剑");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(58103,_loc2_);
      }
   }
}

