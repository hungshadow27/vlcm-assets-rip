package com.tgame.moudels.kuafu3v3.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Kuafu3v3_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Kuafu3v3_MsgSenderProxy";
      
      public function Kuafu3v3_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53601(param1:* = null) : void
      {
         ZLog.add("53601：请求报名和取消报名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53601,_loc2_);
      }
      
      public function send_53603(param1:* = null) : void
      {
         ZLog.add("53603：是否接受邀请报名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(53603,_loc2_);
      }
      
      public function send_53609(param1:* = null) : void
      {
         ZLog.add("53609：提交拔旗");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53609,_loc2_);
      }
      
      public function send_53615(param1:* = null) : void
      {
         ZLog.add("53615：吃神符");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53615,_loc2_);
      }
      
      public function send_53617(param1:* = null) : void
      {
         ZLog.add("53617：请求退出3V3竞技场");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53617,_loc2_);
      }
   }
}

