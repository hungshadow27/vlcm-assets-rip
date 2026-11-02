package com.tgame.moudels.zunrongwanbaoge.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZunrongWanbaoge_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ZunrongWanbaoge_MsgSenderProxy";
      
      public function ZunrongWanbaoge_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_71821(param1:* = null) : void
      {
         ZLog.add("71821：万宝阁回归界面消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71821,_loc2_);
      }
      
      public function send_71823(param1:* = null) : void
      {
         ZLog.add("71823：进入万宝阁请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71823,_loc2_);
      }
      
      public function send_71825(param1:* = null) : void
      {
         ZLog.add("71825：尊荣万宝阁宝石鉴赏信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71825,_loc2_);
      }
      
      public function send_71827(param1:* = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         ZLog.add("71827：玩家确认押宝");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = 0;
         while(_loc3_ < 8)
         {
            _loc2_.writeDouble(param1[_loc3_]);
            _loc4_ = param1[_loc3_ + 1];
            _loc2_.writeByte(_loc4_.length / 2);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc2_.writeInt(_loc4_[_loc5_]);
               _loc2_.writeInt(_loc4_[_loc5_ + 1]);
               _loc5_ += 2;
            }
            _loc3_ += 2;
         }
         NetWorkManager.sendMsg(71827,_loc2_);
      }
   }
}

