package com.tgame.moudels.xuedaoxinfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XueDaoXinFa_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XueDaoXinFa_MsgSenderProxy";
      
      public function XueDaoXinFa_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_71351(param1:* = null) : void
      {
         ZLog.add("71351：请求玩家血刀心法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71351,_loc2_);
      }
      
      public function send_71353(param1:* = null) : void
      {
         ZLog.add("71353：请求血刀心法突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71353,_loc2_);
      }
      
      public function send_71355(param1:* = null) : void
      {
         ZLog.add("71355：请求玩家血刀心法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71355,_loc2_);
      }
   }
}

