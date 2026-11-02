package com.tgame.moudels.baoshijianshang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaoShiJianShang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BaoShiJianShang_MsgSenderProxy";
      
      public function BaoShiJianShang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_54001(param1:* = null) : void
      {
         ZLog.add("54001：宝石鉴赏信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(54001,_loc2_);
      }
      
      public function send_54003(param1:* = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         ZLog.add("54003：玩家确认押宝");
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
         NetWorkManager.sendMsg(54003,_loc2_);
      }
      
      public function send_10731(param1:* = null) : void
      {
         ZLog.add("10731：发出进入万宝阁地图");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(10731,_loc2_);
      }
   }
}

