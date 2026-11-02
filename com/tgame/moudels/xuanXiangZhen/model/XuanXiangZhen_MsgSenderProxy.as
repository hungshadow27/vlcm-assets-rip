package com.tgame.moudels.xuanXiangZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XuanXiangZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XuanXiangZhen_MsgSenderProxy";
      
      public function XuanXiangZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70751(param1:* = null) : void
      {
         ZLog.add("70751\t\t请求玩家玄襄阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70751,_loc2_);
      }
      
      public function send_70753(param1:* = null) : void
      {
         ZLog.add("70753\t\t玩家请求玄襄阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70753,_loc2_);
      }
      
      public function send_70755(param1:* = null) : void
      {
         ZLog.add("70755\t\t请求突破玄襄阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70755,_loc2_);
      }
      
      public function send_70757(param1:* = null) : void
      {
         ZLog.add("70757\t\t设置玄襄阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70757,_loc2_);
      }
   }
}

