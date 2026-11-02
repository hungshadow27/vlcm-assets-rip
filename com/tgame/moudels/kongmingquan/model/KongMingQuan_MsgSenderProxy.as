package com.tgame.moudels.kongmingquan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class KongMingQuan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "KongMingQuan_MsgSenderProxy";
      
      public function KongMingQuan_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_74341(param1:* = null) : void
      {
         ZLog.add("74341：请求玩家空明拳详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74341,_loc2_);
      }
      
      public function send_74343(param1:* = null) : void
      {
         ZLog.add("74343：请求空明拳突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74343,_loc2_);
      }
      
      public function send_74345(param1:* = null) : void
      {
         ZLog.add("74345：请求玩家空明拳详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74345,_loc2_);
      }
   }
}

