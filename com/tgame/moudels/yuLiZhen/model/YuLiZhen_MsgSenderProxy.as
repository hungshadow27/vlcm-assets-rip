package com.tgame.moudels.yuLiZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YuLiZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YuLiZhen_MsgSenderProxy";
      
      public function YuLiZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70251(param1:* = null) : void
      {
         ZLog.add("70251\t\t请求玩家鱼丽阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70251,_loc2_);
      }
      
      public function send_70253(param1:* = null) : void
      {
         ZLog.add("70253\t\t玩家请求鱼丽阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70253,_loc2_);
      }
      
      public function send_70255(param1:* = null) : void
      {
         ZLog.add("70255\t\t请求突破鱼丽阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70255,_loc2_);
      }
      
      public function send_70257(param1:* = null) : void
      {
         ZLog.add("70257\t\t设置鱼丽阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70257,_loc2_);
      }
   }
}

