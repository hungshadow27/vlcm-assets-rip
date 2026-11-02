package com.tgame.moudels.lingxiyizhi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LingXiYiZhi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LingXiYiZhi_MsgSenderProxy";
      
      public function LingXiYiZhi_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_74611(param1:* = null) : void
      {
         ZLog.add("74611：请求玩家灵犀一指详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74611,_loc2_);
      }
      
      public function send_74613(param1:* = null) : void
      {
         ZLog.add("74613：请求灵犀一指突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74613,_loc2_);
      }
      
      public function send_74615(param1:* = null) : void
      {
         ZLog.add("74615：请求玩家灵犀一指详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74615,_loc2_);
      }
   }
}

