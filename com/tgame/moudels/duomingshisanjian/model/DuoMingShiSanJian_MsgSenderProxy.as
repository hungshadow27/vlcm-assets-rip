package com.tgame.moudels.duomingshisanjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuoMingShiSanJian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "DuoMingShiSanJian_MsgSenderProxy";
      
      public function DuoMingShiSanJian_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_74221(param1:* = null) : void
      {
         ZLog.add("74221：请求玩家夺命十三剑详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74221,_loc2_);
      }
      
      public function send_74223(param1:* = null) : void
      {
         ZLog.add("74223：请求夺命十三剑突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74223,_loc2_);
      }
      
      public function send_74225(param1:* = null) : void
      {
         ZLog.add("74225：请求玩家夺命十三剑详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74225,_loc2_);
      }
   }
}

