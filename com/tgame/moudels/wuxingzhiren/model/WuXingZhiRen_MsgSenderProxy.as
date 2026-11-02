package com.tgame.moudels.wuxingzhiren.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuXingZhiRen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WuXingZhiRen_MsgSenderProxy";
      
      public function WuXingZhiRen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_55521(param1:* = -1) : void
      {
         ZLog.add("55521：发出 请求五行之刃");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(55521,_loc2_);
      }
      
      public function send_55523(param1:* = null) : void
      {
         ZLog.add("55523：发出 请求激活五行之刃_type= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(55523,_loc2_);
      }
      
      public function send_55525(param1:* = null) : void
      {
         ZLog.add("55525：发出 请求切换五行之刃");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(55525,_loc2_);
      }
   }
}

