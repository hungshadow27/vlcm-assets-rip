package com.tgame.moudels.molingzhiyi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MoLingZhiYi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "MoLingZhiYi_MsgSenderProxy";
      
      public function MoLingZhiYi_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_73581(param1:* = null) : void
      {
         ZLog.add("73581：请求玩家翅膀详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73581,_loc2_);
      }
      
      public function send_73583(param1:* = null) : void
      {
         ZLog.add("73583：玩家请求翅膀突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73583,_loc2_);
      }
      
      public function send_73585(param1:* = null) : void
      {
         ZLog.add("73585\t\t请求突破翅膀");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73585,_loc2_);
      }
   }
}

