package com.tgame.moudels.wuxingzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuXingZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WuXingZhen_MsgSenderProxy";
      
      public function WuXingZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_59301(param1:* = null) : void
      {
         ZLog.add("59301：五行阵 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(59301,_loc2_);
      }
      
      public function send_59303(param1:* = null) : void
      {
         ZLog.add("59303：请求五行阵突破面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(59303,_loc2_);
      }
      
      public function send_59305(param1:* = null) : void
      {
         ZLog.add("59305：请求突破五行阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(59305,_loc2_);
      }
   }
}

