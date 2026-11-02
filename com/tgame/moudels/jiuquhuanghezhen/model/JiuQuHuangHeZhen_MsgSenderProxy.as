package com.tgame.moudels.jiuquhuanghezhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiuQuHuangHeZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JiuQuHuangHeZhen_MsgSenderProxy";
      
      public function JiuQuHuangHeZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_60851(param1:* = null) : void
      {
         ZLog.add("60851：九曲黄河阵 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(60851,_loc2_);
      }
      
      public function send_60853(param1:* = null) : void
      {
         ZLog.add("60853：玩家请求九曲黄河突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(60853,_loc2_);
      }
      
      public function send_60855(param1:* = null) : void
      {
         ZLog.add("60855：请求突破九曲黄河");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(60855,_loc2_);
      }
   }
}

