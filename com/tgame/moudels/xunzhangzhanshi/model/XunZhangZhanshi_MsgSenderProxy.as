package com.tgame.moudels.xunzhangzhanshi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangZhanshi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangZhanshi_MsgSenderProxy";
      
      public function XunZhangZhanshi_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_81609(param1:* = null) : void
      {
         ZLog.add("81609：请求勋章展示面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81609,_loc2_);
      }
      
      public function send_81611(param1:* = null) : void
      {
         ZLog.add("81611：请求翻页");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeInt(int(param1[2]));
         NetWorkManager.sendMsg(81611,_loc2_);
      }
   }
}

