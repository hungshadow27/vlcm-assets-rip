package com.tgame.moudels.yanYueZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YanYueZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YanYueZhen_MsgSenderProxy";
      
      public function YanYueZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70351(param1:* = null) : void
      {
         ZLog.add("70351\t\t请求玩家偃月阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70351,_loc2_);
      }
      
      public function send_70353(param1:* = null) : void
      {
         ZLog.add("70353\t\t玩家请求偃月阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70353,_loc2_);
      }
      
      public function send_70355(param1:* = null) : void
      {
         ZLog.add("70355\t\t请求突破偃月阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70355,_loc2_);
      }
      
      public function send_70357(param1:* = null) : void
      {
         ZLog.add("70357\t\t设置偃月阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70357,_loc2_);
      }
   }
}

