package com.tgame.moudels.jingangfumoquan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Jingangfumoquan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Jingangfumoquan_MsgSenderProxy";
      
      public function Jingangfumoquan_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_61661(param1:* = null) : void
      {
         ZLog.add("61661：请求玩家金刚伏魔圈详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(61661,_loc2_);
      }
      
      public function send_61663(param1:* = null) : void
      {
         ZLog.add("61663\t玩家请求金刚伏魔圈突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(61663,_loc2_);
      }
      
      public function send_61665(param1:* = null) : void
      {
         ZLog.add("61665：请求突破金刚伏魔圈");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(61665,_loc2_);
      }
   }
}

