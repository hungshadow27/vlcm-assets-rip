package com.tgame.moudels.achievement.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Achievement_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Achievement_MsgSenderProxy";
      
      public function Achievement_MsgSenderProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function send_51001(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(51001,_loc2_);
      }
      
      public function send_51003() : void
      {
         NetWorkManager.sendMsg(51003,new ByteArray());
      }
      
      public function send_51011(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51011,_loc2_);
      }
      
      public function send_51005(param1:Object = null) : void
      {
         ZLog.add("51005:玩家查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.pageNum);
         _loc2_.writeUTF(param1.name);
         NetWorkManager.sendMsg(51005,_loc2_);
      }
      
      public function send_51013(param1:Object = null) : void
      {
         ZLog.add("51013:请求目标人物成就");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.targetID);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(51013,_loc2_);
      }
   }
}

