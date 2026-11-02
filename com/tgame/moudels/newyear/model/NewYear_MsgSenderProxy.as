package com.tgame.moudels.newyear.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class NewYear_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "NewYear_MsgSenderProxy";
      
      public function NewYear_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_72601(param1:* = null) : void
      {
         ZLog.add("72601：请求春联送好礼界面");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72601,_loc2_);
      }
      
      public function send_72603(param1:* = null) : void
      {
         ZLog.add("72603：请求 领取活动勋章");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72603,_loc2_);
      }
      
      public function send_72605(param1:* = null) : void
      {
         ZLog.add("72605：请求 提交对联");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72605,_loc2_);
      }
      
      public function send_72607(param1:* = null) : void
      {
         ZLog.add("72607：请求 领取压岁钱");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72607,_loc2_);
      }
      
      public function send_72611(param1:* = null) : void
      {
         ZLog.add("72611：请求签到信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72611,_loc2_);
      }
      
      public function send_72615(param1:* = null) : void
      {
         ZLog.add("72615：请求抽奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72615,_loc2_);
      }
      
      public function send_72617(param1:* = null) : void
      {
         ZLog.add("72617：领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(72617,_loc2_);
      }
   }
}

