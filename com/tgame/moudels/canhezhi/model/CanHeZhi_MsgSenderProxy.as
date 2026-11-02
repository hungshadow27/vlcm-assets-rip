package com.tgame.moudels.canhezhi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CanHeZhi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "CanHeZhi_MsgSenderProxy";
      
      public function CanHeZhi_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_70451(param1:* = null) : void
      {
         ZLog.add("70451：请求玩家参合指阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70451,_loc2_);
      }
      
      public function send_70453(param1:* = null) : void
      {
         ZLog.add("70453：请求参合指突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(70453,_loc2_);
      }
      
      public function send_70455(param1:* = null) : void
      {
         ZLog.add("70455：请求玩家参合指阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70455,_loc2_);
      }
   }
}

