package com.tgame.moudels.buchangfuben.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BuchangFuben_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "BuchangFuben_MsgSendProxy";
      
      public function BuchangFuben_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74361(param1:* = null) : void
      {
         ZLog.add("74361：请求领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74361,_loc2_);
      }
      
      public function send_74363(param1:* = null) : void
      {
         ZLog.add("74363：请求进入副本");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74363,_loc2_);
      }
   }
}

