package com.tgame.moudels.jiuyinzhenjing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiuYinZhenJing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JiuYinZhenJing_MsgSenderProxy";
      
      public function JiuYinZhenJing_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_54101(param1:* = null) : void
      {
         ZLog.add("54101：九阴真经 悟道信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(54101,_loc2_);
      }
      
      public function send_54103(param1:* = null) : void
      {
         ZLog.add("54103：九阴真经悟道查询请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54103,_loc2_);
      }
      
      public function send_54105(param1:* = null) : void
      {
         ZLog.add("54105：九阴真经领悟请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54105,_loc2_);
      }
      
      public function send_54107(param1:* = null) : void
      {
         ZLog.add("54107：查看其它人九阴真经信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(54107,_loc2_);
      }
      
      public function send_54109(param1:* = null) : void
      {
         ZLog.add("54109：主角选定的打坐光环");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54109,_loc2_);
      }
   }
}

