package com.tgame.moudels.moxue.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MoXue_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "MoXue_MsgSenderProxy";
      
      public function MoXue_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_59771(param1:* = null) : void
      {
         ZLog.add("59771：请求魔血娃娃界面");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(59771,_loc2_);
      }
      
      public function send_59773(param1:* = null) : void
      {
         ZLog.add("59773：请求魔血灌注");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(59773,_loc2_);
      }
      
      public function send_59775(param1:* = null) : void
      {
         ZLog.add("59775：请求魔血提取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(59775,_loc2_);
      }
   }
}

