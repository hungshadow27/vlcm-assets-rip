package com.tgame.moudels.doudizhu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DouDiZhu_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "DouDiZhu_MsgSendProxy";
      
      public function DouDiZhu_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73461(param1:* = null) : void
      {
         ZLog.add("73461：打开斗地主面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73461,_loc2_);
      }
      
      public function send_73463(param1:int) : void
      {
         ZLog.add("73463：请求斗地主排行榜数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73463,_loc2_);
      }
      
      public function send_73465(param1:* = null) : void
      {
         ZLog.add("73465：领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73465,_loc2_);
      }
      
      public function send_73467(param1:* = null) : void
      {
         ZLog.add("73467：领取大红花");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73467,_loc2_);
      }
   }
}

