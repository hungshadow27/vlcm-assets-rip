package com.tgame.moudels.yuanwu.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Yuanwu_SenderProxy extends Proxy
   {
      
      public static const NAME:String = "Yuanwu_SenderProxy";
      
      public function Yuanwu_SenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_83059(param1:* = null) : void
      {
         ZLog.add("83059：请求元武信息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeInt(_loc3_[0]);
         _loc2_.writeInt(_loc3_[1]);
         NetWorkManager.sendMsg(83059,_loc2_);
      }
      
      public function send_83033(param1:* = null) : void
      {
         ZLog.add("83033：请求元武培养面板消息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeInt(_loc3_[0]);
         _loc2_.writeInt(_loc3_[1]);
         NetWorkManager.sendMsg(83033,_loc2_);
      }
      
      public function send_83035(param1:* = null) : void
      {
         ZLog.add("83035：重生");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeInt(_loc3_[1]);
         if(_loc3_[0].length)
         {
            _loc2_.writeInt(_loc3_[0].length);
         }
         else
         {
            _loc2_.writeInt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_[0].length)
         {
            _loc2_.writeInt(_loc3_[0][_loc4_]);
            _loc4_++;
         }
         NetWorkManager.sendMsg(83035,_loc2_);
      }
      
      public function send_83037(param1:* = null) : void
      {
         ZLog.add("83037：元武装备佩戴");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         _loc2_.writeInt(_loc3_[0]);
         _loc2_.writeInt(_loc3_[1]);
         NetWorkManager.sendMsg(83037,_loc2_);
      }
      
      public function send_10075(param1:* = null) : void
      {
         ZLog.add("10075：发送道具挪动消息");
         PipeManager.sendMsg(PipeConstants.ITEM_SWAP_OR_MOVE,[param1[0],param1[2]]);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[4]);
         _loc2_.writeShort(param1[2]);
         _loc2_.writeInt(param1[3]);
         NetWorkManager.sendMsg(10075,_loc2_);
      }
      
      public function send_83039(param1:* = null) : void
      {
         var _loc6_:Goods = null;
         ZLog.add("83039：元武装备吞噬");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Object = param1 as Object;
         var _loc4_:Array = _loc3_.arr;
         _loc2_.writeInt(_loc3_.post);
         _loc2_.writeInt(_loc4_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_] as Goods;
            _loc2_.writeInt(_loc6_.position);
            _loc2_.writeInt(_loc6_.id);
            _loc5_++;
         }
         NetWorkManager.sendMsg(83039,_loc2_);
      }
      
      public function send_83051(param1:* = null) : void
      {
         ZLog.add("83051：请求核心面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83051,_loc2_);
      }
      
      public function send_83053(param1:* = null) : void
      {
         ZLog.add("83053：请求突破");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83053,_loc2_);
      }
      
      public function send_83055(param1:* = null) : void
      {
         ZLog.add("83055：请求提升");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83055,_loc2_);
      }
      
      public function send_83057(param1:* = null) : void
      {
         ZLog.add("83057：请求元武展示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(83057,_loc2_);
      }
   }
}

