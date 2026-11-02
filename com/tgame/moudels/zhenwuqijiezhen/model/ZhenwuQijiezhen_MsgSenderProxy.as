package com.tgame.moudels.zhenwuqijiezhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhenwuQijiezhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ZhenwuQijiezhen_MsgSenderProxy";
      
      public function ZhenwuQijiezhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_60951(param1:* = null) : void
      {
         ZLog.add("60951：真武七截阵 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(60951,_loc2_);
      }
      
      public function send_60953(param1:* = null) : void
      {
         ZLog.add("60953：玩家请求真武七截阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(60953,_loc2_);
      }
      
      public function send_60955(param1:* = null) : void
      {
         ZLog.add("60955：请求突破真武七截阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(60955,_loc2_);
      }
   }
}

