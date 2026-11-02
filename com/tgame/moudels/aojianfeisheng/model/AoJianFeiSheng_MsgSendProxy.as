package com.tgame.moudels.aojianfeisheng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianFeiSheng_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "AoJianFeiSheng_MsgSendProxy";
      
      public function AoJianFeiSheng_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_80981(param1:* = null) : void
      {
         ZLog.add("80981：请求仙魔飞升数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80981,_loc2_);
      }
      
      public function send_80983(param1:* = null) : void
      {
         ZLog.add("80983：领取仙魔飞升奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(80983,_loc2_);
      }
   }
}

