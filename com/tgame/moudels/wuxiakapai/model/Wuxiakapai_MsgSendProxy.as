package com.tgame.moudels.wuxiakapai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wuxiakapai_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Wuxiakapai_MsgSendProxy";
      
      public function Wuxiakapai_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74241(param1:* = null) : void
      {
         ZLog.add("74241：请求卡牌类型列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74241,_loc2_);
      }
      
      public function send_74243(param1:* = null) : void
      {
         ZLog.add("74243：请求卡牌列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(74243,_loc2_);
      }
      
      public function send_74245(param1:* = null) : void
      {
         ZLog.add("74245：请求卡牌详细信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(74245,_loc2_);
      }
      
      public function send_74247(param1:* = null) : void
      {
         ZLog.add("74247：请求一键兑换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74247,_loc2_);
      }
      
      public function send_74249(param1:* = null) : void
      {
         ZLog.add("74249：请求卡牌兑换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74249,_loc2_);
      }
      
      public function send_74251(param1:* = null) : void
      {
         ZLog.add("74251：请求激活外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74251,_loc2_);
      }
   }
}

