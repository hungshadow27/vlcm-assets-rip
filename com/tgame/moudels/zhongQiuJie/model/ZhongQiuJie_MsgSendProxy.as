package com.tgame.moudels.zhongQiuJie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhongQiuJie_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "ZhongQiuJie_MsgSendProxy";
      
      public function ZhongQiuJie_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_77481(param1:* = null) : void
      {
         ZLog.add("77481\t\t请求中秋节活动信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(77481,_loc2_);
      }
      
      public function send_77491(param1:* = null) : void
      {
         ZLog.add("77491\t\t请求月饼排行榜信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(77491,_loc2_);
      }
      
      public function send_77483(param1:* = null) : void
      {
         ZLog.add("77483\t\t请求兑换月饼");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(77483,_loc2_);
      }
      
      public function send_77485(param1:* = null) : void
      {
         ZLog.add("77485\t\t请求提交月饼");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(77485,_loc2_);
      }
      
      public function send_77487(param1:* = null) : void
      {
         ZLog.add("77487\t\t请求领取月饼活跃度奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(77487,_loc2_);
      }
      
      public function send_77493(param1:* = null) : void
      {
         ZLog.add("77493\t\t请求领取月饼排行榜奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(77493,_loc2_);
      }
      
      public function send_77501(param1:* = null) : void
      {
         ZLog.add("77501\t\t请求月饼桌信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(77501,_loc2_);
      }
      
      public function send_77503(param1:* = null) : void
      {
         ZLog.add("77503\t\t玩家请求月饼桌");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(77503,_loc2_);
      }
      
      public function send_77511(param1:* = null) : void
      {
         ZLog.add("77511\t\t请求双人骑乘");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(77511,_loc2_);
      }
      
      public function send_77515(param1:* = null) : void
      {
         ZLog.add("77515\t\t玩家确认夫妻骑乘结果");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(77515,_loc2_);
      }
      
      public function send_77517(param1:* = null) : void
      {
         ZLog.add("77517\t\t玩家请求下退出骑乘状态");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(77517,_loc2_);
      }
      
      public function send_78955(param1:* = null) : void
      {
         ZLog.add("78955\t\t请求元宵节兑换神器");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(78955,_loc2_);
      }
      
      public function send_78951(param1:* = null) : void
      {
         ZLog.add("78951\t\t请求灯谜大赛获奖名单");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(78951,_loc2_);
      }
      
      public function send_78953(param1:* = null) : void
      {
         ZLog.add("78953\t\t请求领取灯谜大赛奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(78953,_loc2_);
      }
      
      public function send_78957(param1:* = null) : void
      {
         ZLog.add("78957\t\t请求元宵节抽奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(78957,_loc2_);
      }
      
      public function send_78959(param1:* = null) : void
      {
         ZLog.add("78959\t\t请求元宵节灯谜信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(78959,_loc2_);
      }
      
      public function send_78961(param1:* = null) : void
      {
         ZLog.add("78961\t\t玩家请求元宵节答题");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(78961,_loc2_);
      }
   }
}

