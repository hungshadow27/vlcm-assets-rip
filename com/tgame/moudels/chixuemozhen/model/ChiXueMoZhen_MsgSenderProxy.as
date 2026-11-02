package com.tgame.moudels.chixuemozhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChiXueMoZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ChiXueMoZhen_MsgSenderProxy";
      
      public function ChiXueMoZhen_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_59751(param1:* = null) : void
      {
         ZLog.add("59751：请求玩家赤血魔阵信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(59751,_loc2_);
      }
      
      public function send_59753(param1:* = null) : void
      {
         ZLog.add("59753：玩家请求赤血魔阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59753,_loc2_);
      }
      
      public function send_59755(param1:* = null) : void
      {
         ZLog.add("59755：请求突破赤血魔阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(59755,_loc2_);
      }
      
      public function send_59757(param1:* = null) : void
      {
         ZLog.add("59757：请求提升血池上限");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59757,_loc2_);
      }
      
      public function send_59759(param1:* = null) : void
      {
         ZLog.add("59759：请求血魔物品拖入面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(59759,_loc2_);
      }
   }
}

