package com.tgame.moudels.duguqiubai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuGuQiuBai_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "DuGuQiuBai_MsgSenderProxy";
      
      public function DuGuQiuBai_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_73001(param1:* = null) : void
      {
         ZLog.add("73001：请求玩家独孤求败详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73001,_loc2_);
      }
      
      public function send_73003(param1:* = null) : void
      {
         ZLog.add("73003：请求玩家独孤求败突破");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73003,_loc2_);
      }
      
      public function send_73005(param1:* = null) : void
      {
         ZLog.add("73005：请求玩家独孤求败换装");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[0]);
         NetWorkManager.sendMsg(73005,_loc2_);
      }
   }
}

