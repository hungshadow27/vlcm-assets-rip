package com.tgame.moudels.hanbingshenzhang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HanBingShenZhang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "HanBingShenZhang_MsgSenderProxy";
      
      public function HanBingShenZhang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_74521(param1:* = null) : void
      {
         ZLog.add("74521：请求玩家寒冰神掌详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74521,_loc2_);
      }
      
      public function send_74523(param1:* = null) : void
      {
         ZLog.add("74523：请求寒冰神掌突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74523,_loc2_);
      }
      
      public function send_74525(param1:* = null) : void
      {
         ZLog.add("74225：请求玩家寒冰神掌详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74525,_loc2_);
      }
   }
}

