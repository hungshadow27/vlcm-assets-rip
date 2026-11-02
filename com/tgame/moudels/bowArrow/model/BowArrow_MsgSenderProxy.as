package com.tgame.moudels.bowArrow.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BowArrow_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BowArrow_MsgSenderProxy";
      
      public function BowArrow_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_53031(param1:* = null) : void
      {
         ZLog.add("53031：弓箭信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53031,_loc2_);
      }
      
      public function send_53033(param1:* = null) : void
      {
         ZLog.add("53033：弓箭进阶查询");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53033,_loc2_);
      }
      
      public function send_53035(param1:* = null) : void
      {
         ZLog.add("53035：弓箭进阶");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.isUseShenQiLongShouJin);
         NetWorkManager.sendMsg(53035,_loc2_);
      }
      
      public function send_53037(param1:* = null) : void
      {
         ZLog.add("53037：放入箭支");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(53037,_loc2_);
      }
      
      public function send_53039(param1:* = null) : void
      {
         ZLog.add("53039：拿下箭支");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(uint(param1));
         NetWorkManager.sendMsg(53039,_loc2_);
      }
      
      public function send_53043(param1:* = null) : void
      {
         ZLog.add("53043：是否使用箭支");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(uint(param1));
         NetWorkManager.sendMsg(53043,_loc2_);
      }
      
      public function send_53045(param1:* = null) : void
      {
         ZLog.add("53045：查看别的弓箭信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(53045,_loc2_);
      }
      
      public function send_53049(param1:* = null) : void
      {
         ZLog.add("53049：请求激活弓箭隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53049,_loc2_);
      }
   }
}

