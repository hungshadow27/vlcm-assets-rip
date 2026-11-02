package com.tgame.moudels.changSheZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChangSheZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ChangSheZhen_MsgSenderProxy";
      
      public function ChangSheZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70401(param1:* = null) : void
      {
         ZLog.add("70401\t\t请求玩家长蛇阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70401,_loc2_);
      }
      
      public function send_70403(param1:* = null) : void
      {
         ZLog.add("70403\t\t玩家请求长蛇阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70403,_loc2_);
      }
      
      public function send_70405(param1:* = null) : void
      {
         ZLog.add("70405\t\t请求突破长蛇阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70405,_loc2_);
      }
      
      public function send_70407(param1:* = null) : void
      {
         ZLog.add("70407\t\t设置长蛇阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70407,_loc2_);
      }
   }
}

