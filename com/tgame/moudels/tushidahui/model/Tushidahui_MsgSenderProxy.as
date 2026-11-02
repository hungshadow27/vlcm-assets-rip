package com.tgame.moudels.tushidahui.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Tushidahui_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Tushidahui_MsgSenderProxy";
      
      public function Tushidahui_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_71651(param1:* = null) : void
      {
         ZLog.add("71651\t\t请求玩家屠狮大会详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71651,_loc2_);
      }
      
      public function send_71653(param1:* = null) : void
      {
         ZLog.add("71653\t\t玩家请求屠狮大会闯关数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71653,_loc2_);
      }
      
      public function send_71655(param1:* = null) : void
      {
         ZLog.add("71655\t\t请求提升屠狮大会");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71655,_loc2_);
      }
      
      public function send_71657(param1:* = null) : void
      {
         ZLog.add("71657\t\t请求闯关屠狮大会");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71657,_loc2_);
      }
   }
}

