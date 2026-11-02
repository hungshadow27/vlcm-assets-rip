package com.tgame.moudels.yitiantulong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YiTianTuLong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YiTianTuLong_MsgSenderProxy";
      
      public function YiTianTuLong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_79481(param1:* = null) : void
      {
         ZLog.add("79481 \t倚天屠龙请求信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79481,_loc2_);
      }
      
      public function send_79483(param1:* = null) : void
      {
         ZLog.add("79483\t\t倚天屠龙请求玄铁重剑信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79483,_loc2_);
      }
      
      public function send_79485(param1:* = null) : void
      {
         ZLog.add("79485\t\t倚天屠龙请求铸造/淬炼");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(79485,_loc2_);
      }
      
      public function send_79487(param1:* = null) : void
      {
         ZLog.add("79487\t  请求进入场地");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79487,_loc2_);
      }
      
      public function send_79495(param1:* = null) : void
      {
         ZLog.add("79495\t  请求查看淬炼需要的玄铁精粹");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(79495,_loc2_);
      }
      
      public function send_70567(param1:* = null) : void
      {
         ZLog.add("70567：请求进入白驼山");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(70567,_loc2_);
      }
   }
}

