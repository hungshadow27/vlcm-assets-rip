package com.tgame.moudels.wanhunzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WanHunZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WanHunZhen_MsgSenderProxy";
      
      public function WanHunZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73181(param1:* = null) : void
      {
         ZLog.add("73181：请求玩家万魂阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73181,_loc2_);
      }
      
      public function send_73183(param1:* = null) : void
      {
         ZLog.add("73183：请求万魂阵突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73183,_loc2_);
      }
      
      public function send_73185(param1:* = null) : void
      {
         ZLog.add("73185：请求玩家万魂阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73185,_loc2_);
      }
   }
}

