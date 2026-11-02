package com.tgame.moudels.dugujiujian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Dugujiujian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Dugujiujian_MsgSenderProxy";
      
      public function Dugujiujian_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53261(param1:* = null) : void
      {
         ZLog.add("53261：独孤悟道信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53261,_loc2_);
      }
      
      public function send_53263(param1:* = null) : void
      {
         ZLog.add("53263：悟道查询请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53263,_loc2_);
      }
      
      public function send_53265(param1:* = null) : void
      {
         ZLog.add("53265：领悟请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53265,_loc2_);
      }
      
      public function send_53267(param1:* = null) : void
      {
         ZLog.add("53267：查看其它人悟道信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53267,_loc2_);
      }
      
      public function send_53269(param1:* = null) : void
      {
         ZLog.add("53269：请求激活独孤九剑隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53269,_loc2_);
      }
   }
}

