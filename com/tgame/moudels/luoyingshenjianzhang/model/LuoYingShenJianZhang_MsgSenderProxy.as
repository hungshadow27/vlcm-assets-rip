package com.tgame.moudels.luoyingshenjianzhang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LuoYingShenJianZhang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LuoYingShenJianZhang_MsgSenderProxy";
      
      public function LuoYingShenJianZhang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_72951(param1:* = null) : void
      {
         ZLog.add("72951：请求玩家落英神剑掌详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72951,_loc2_);
      }
      
      public function send_72953(param1:* = null) : void
      {
         ZLog.add("72953：请求落英神剑掌突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72953,_loc2_);
      }
      
      public function send_72955(param1:* = null) : void
      {
         ZLog.add("72955：请求玩家落英神剑掌详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(72955,_loc2_);
      }
   }
}

