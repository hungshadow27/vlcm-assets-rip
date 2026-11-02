package com.tgame.moudels.heYiZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HeYiZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "HeYiZhen_MsgSenderProxy";
      
      public function HeYiZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70201(param1:* = null) : void
      {
         ZLog.add("70201\t\t请求玩家鹤翼阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70201,_loc2_);
      }
      
      public function send_70203(param1:* = null) : void
      {
         ZLog.add("70203\t\t玩家请求鹤翼阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70203,_loc2_);
      }
      
      public function send_70205(param1:* = null) : void
      {
         ZLog.add("70205\t\t请求突破鹤翼阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70205,_loc2_);
      }
      
      public function send_70207(param1:* = null) : void
      {
         ZLog.add("70207\t\t设置鹤翼阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70207,_loc2_);
      }
   }
}

