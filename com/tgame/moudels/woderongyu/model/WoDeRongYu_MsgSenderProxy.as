package com.tgame.moudels.woderongyu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WoDeRongYu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WoDeRongYu_MsgSenderProxy";
      
      public function WoDeRongYu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_71025(param1:* = null) : void
      {
         ZLog.add("71025：请求我的荣誉面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71025,_loc2_);
      }
      
      public function send_71027(param1:* = null) : void
      {
         ZLog.add("71027：请求参合指突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71027,_loc2_);
      }
   }
}

