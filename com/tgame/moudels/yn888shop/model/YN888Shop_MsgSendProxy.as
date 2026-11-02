package com.tgame.moudels.yn888shop.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN888Shop_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YN888Shop_MsgSendProxy";
      
      public function YN888Shop_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73851(param1:* = null) : void
      {
         ZLog.add("73851：请求是否显示世界杯面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73851,_loc2_);
      }
   }
}

