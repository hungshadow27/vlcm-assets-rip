package com.tgame.moudels.xiantiangong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XianTianGong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XianTianGong_MsgSenderProxy";
      
      public function XianTianGong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_71201(param1:* = null) : void
      {
         ZLog.add("71201：请求玩家先天功详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71201,_loc2_);
      }
      
      public function send_71203(param1:* = null) : void
      {
         ZLog.add("71203：请求先天功突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71203,_loc2_);
      }
      
      public function send_71205(param1:* = null) : void
      {
         ZLog.add("71205：请求玩家先天功详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71205,_loc2_);
      }
   }
}

