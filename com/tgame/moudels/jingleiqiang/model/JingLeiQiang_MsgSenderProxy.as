package com.tgame.moudels.jingleiqiang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JingLeiQiang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JingLeiQiang_MsgSenderProxy";
      
      public function JingLeiQiang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_74851(param1:* = null) : void
      {
         ZLog.add("74851：请求玩家惊雷枪详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74851,_loc2_);
      }
      
      public function send_74853(param1:* = null) : void
      {
         ZLog.add("74853：请求惊雷枪突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74853,_loc2_);
      }
      
      public function send_74855(param1:* = null) : void
      {
         ZLog.add("74855：请求玩家惊雷枪详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74855,_loc2_);
      }
      
      public function send_74857(param1:* = null) : void
      {
         ZLog.add("74857：惊雷枪请求显示/隐藏");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74857,_loc2_);
      }
   }
}

