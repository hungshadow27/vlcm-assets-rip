package com.tgame.moudels.duanwujie2015.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuanWuJie2015_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "DuanWuJie2015_MsgSendProxy";
      
      public function DuanWuJie2015_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_79461(param1:* = null) : void
      {
         ZLog.add("79461：打开端午节面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79461,_loc2_);
      }
      
      public function send_79463(param1:* = null) : void
      {
         ZLog.add("79463：请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79463,_loc2_);
      }
      
      public function send_79465(param1:* = null) : void
      {
         ZLog.add("79465：请求排行榜");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(79465,_loc2_);
      }
      
      public function send_79467(param1:* = null) : void
      {
         ZLog.add("79467：请求领取排行榜奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79467,_loc2_);
      }
      
      public function send_79469(param1:* = null) : void
      {
         ZLog.add("79469：请求提交粽子");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(79469,_loc2_);
      }
   }
}

