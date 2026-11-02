package com.tgame.moudels.yanXingZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YanXingZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YanXingZhen_MsgSenderProxy";
      
      public function YanXingZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70801(param1:* = null) : void
      {
         ZLog.add("70801\t\t请求玩家雁行阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70801,_loc2_);
      }
      
      public function send_70803(param1:* = null) : void
      {
         ZLog.add("70803\t\t玩家请求雁行阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70803,_loc2_);
      }
      
      public function send_70805(param1:* = null) : void
      {
         ZLog.add("70805\t\t请求突破雁行阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70805,_loc2_);
      }
      
      public function send_70807(param1:* = null) : void
      {
         ZLog.add("70807\t\t设置雁行阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70807,_loc2_);
      }
   }
}

