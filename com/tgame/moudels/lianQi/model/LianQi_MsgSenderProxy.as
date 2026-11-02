package com.tgame.moudels.lianQi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LianQi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LianQi_MsgSenderProxy";
      
      public function LianQi_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70051(param1:* = null) : void
      {
         ZLog.add("70051\t\t请求玩家炼气详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70051,_loc2_);
      }
      
      public function send_70053(param1:* = null) : void
      {
         ZLog.add("70053\t\t玩家请求炼气突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70053,_loc2_);
      }
      
      public function send_70055(param1:* = null) : void
      {
         ZLog.add("70055\t\t请求突破炼气");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70055,_loc2_);
      }
      
      public function send_70057(param1:* = null) : void
      {
         ZLog.add("70057\t\t请求提升炼气所需信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70057,_loc2_);
      }
      
      public function send_70059(param1:* = null) : void
      {
         ZLog.add("70059\t\t请求提升炼气");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(70059,_loc2_);
      }
   }
}

