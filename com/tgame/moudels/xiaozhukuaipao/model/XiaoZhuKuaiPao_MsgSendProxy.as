package com.tgame.moudels.xiaozhukuaipao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiaoZhuKuaiPao_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "XiaoZhuKuaiPao_MsgSendProxy";
      
      public function XiaoZhuKuaiPao_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_79561(param1:* = null) : void
      {
         ZLog.add("79561：打开小猪快跑面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79561,_loc2_);
      }
      
      public function send_79563(param1:* = null) : void
      {
         ZLog.add("79563：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(79563,_loc2_);
      }
   }
}

