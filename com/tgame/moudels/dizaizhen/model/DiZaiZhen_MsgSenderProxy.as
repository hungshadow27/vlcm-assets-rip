package com.tgame.moudels.dizaizhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DiZaiZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "DiZaiZhen_MsgSenderProxy";
      
      public function DiZaiZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71701(param1:* = null) : void
      {
         ZLog.add("71701\t\t请求玩家地载阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71701,_loc2_);
      }
      
      public function send_71703(param1:* = null) : void
      {
         ZLog.add("71703\t\t玩家请求地载阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71703,_loc2_);
      }
      
      public function send_71705(param1:* = null) : void
      {
         ZLog.add("71705\t\t请求突破地载阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71705,_loc2_);
      }
      
      public function send_71707(param1:* = null) : void
      {
         ZLog.add("71707\t\t设置地载阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71707,_loc2_);
      }
   }
}

