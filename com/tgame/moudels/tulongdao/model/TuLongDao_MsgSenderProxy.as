package com.tgame.moudels.tulongdao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TuLongDao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TuLongDao_MsgSenderProxy";
      
      public function TuLongDao_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_74751(param1:* = null) : void
      {
         ZLog.add("74751 \t屠龙刀请求信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74751,_loc2_);
      }
      
      public function send_74753(param1:* = null) : void
      {
         ZLog.add("74753\t\t屠龙刀领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74753,_loc2_);
      }
      
      public function send_74755(param1:* = null) : void
      {
         ZLog.add("74755\t\t屠龙刀申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74755,_loc2_);
      }
      
      public function send_74757(param1:* = null) : void
      {
         ZLog.add("74757\t\t请求屠龙刀武器外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74757,_loc2_);
      }
      
      public function send_74759(param1:* = null) : void
      {
         ZLog.add("74759\t 屠龙刀申请力量灌注");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74759,_loc2_);
      }
      
      public function send_71053(param1:* = null) : void
      {
         ZLog.add("71053  踩中陷阱");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71053,_loc2_);
      }
      
      public function send_74761(param1:* = null) : void
      {
         ZLog.add("74761 \t屠龙刀进阶激活");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74761,_loc2_);
      }
   }
}

