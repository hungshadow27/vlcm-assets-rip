package com.tgame.moudels.tengtianyi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Tengtianyi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Tengtianyi_MsgSenderProxy";
      
      public function Tengtianyi_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_81681(param1:* = null) : void
      {
         ZLog.add("81681：请求玩家翅膀详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(81681,_loc2_);
      }
      
      public function send_81683(param1:* = null) : void
      {
         ZLog.add("81683：玩家请求翅膀突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81683,_loc2_);
      }
      
      public function send_81685(param1:* = null) : void
      {
         ZLog.add("81685\t\t请求突破翅膀");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81685,_loc2_);
      }
   }
}

