package com.tgame.moudels.xiangyangzhizhan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiangYangZhiZhan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XiangYangZhiZhan_MsgSenderProxy";
      
      public function XiangYangZhiZhan_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_79171(param1:* = null) : void
      {
         ZLog.add("79171：请求襄阳之战面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(79171,_loc2_);
      }
      
      public function send_79173(param1:* = null) : void
      {
         ZLog.add("79173：请求领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79173,_loc2_);
      }
      
      public function send_79175(param1:* = null) : void
      {
         ZLog.add("79175：请求领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79175,_loc2_);
      }
   }
}

