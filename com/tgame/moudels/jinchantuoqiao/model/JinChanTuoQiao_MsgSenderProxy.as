package com.tgame.moudels.jinchantuoqiao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JinChanTuoQiao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JinChanTuoQiao_MsgSenderProxy";
      
      public function JinChanTuoQiao_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_60481(param1:* = null) : void
      {
         ZLog.add("60481：请求玩家金蝉脱壳阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60481,_loc2_);
      }
      
      public function send_60483(param1:* = null) : void
      {
         ZLog.add("60483：请求金蝉脱壳突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(60483,_loc2_);
      }
      
      public function send_60485(param1:* = null) : void
      {
         ZLog.add("60485：请求玩家金蝉脱壳阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60485,_loc2_);
      }
   }
}

