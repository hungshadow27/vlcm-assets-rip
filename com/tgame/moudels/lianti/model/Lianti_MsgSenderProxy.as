package com.tgame.moudels.lianti.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Lianti_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Lianti_MsgSenderProxy";
      
      public function Lianti_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53001(param1:* = null) : void
      {
         ZLog.add("53001：请求指定角色当前炼体级别");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53001,_loc2_);
      }
      
      public function send_53003(param1:* = null) : void
      {
         ZLog.add("53003：请求主角提升炼体境界面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53003,_loc2_);
      }
      
      public function send_53005(param1:* = null) : void
      {
         ZLog.add("53005：请求提升炼体");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(53005,_loc2_);
      }
      
      public function send_53009(param1:* = null) : void
      {
         ZLog.add("53009：请求激活炼体隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53009,_loc2_);
      }
      
      public function send_53015(param1:* = null) : void
      {
         ZLog.add("53015：请求激活炼体大金龙属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53015,_loc2_);
      }
   }
}

