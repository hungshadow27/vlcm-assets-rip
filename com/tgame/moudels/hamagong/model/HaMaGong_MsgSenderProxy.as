package com.tgame.moudels.hamagong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HaMaGong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "HaMaGong_MsgSenderProxy";
      
      public function HaMaGong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_58801(param1:* = null) : void
      {
         ZLog.add("58801：蛤蟆功 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(58801,_loc2_);
      }
      
      public function send_58803(param1:* = null) : void
      {
         ZLog.add("58803：蛤蟆功 领悟面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(58803,_loc2_);
      }
      
      public function send_58805(param1:* = null) : void
      {
         ZLog.add("58805：蛤蟆功 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.id);
         _loc2_.writeByte(param1.isNow);
         NetWorkManager.sendMsg(58805,_loc2_);
      }
      
      public function send_58807(param1:* = null) : void
      {
         ZLog.add("58807：蛤蟆功 他人面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(58807,_loc2_);
      }
   }
}

