package com.tgame.moudels.xianmowudaji.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XianMoWuDaJi_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "XianMoWuDaJi_MsgSendProxy";
      
      public function XianMoWuDaJi_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_80951(param1:* = null) : void
      {
         ZLog.add("80951：请求仙魔五大技");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80951,_loc2_);
      }
      
      public function send_80953(param1:* = null) : void
      {
         ZLog.add("80953：仙魔五大技升级技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80953,_loc2_);
      }
      
      public function send_80955(param1:* = null) : void
      {
         ZLog.add("80955：仙魔五大技洗点");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80955,_loc2_);
      }
   }
}

