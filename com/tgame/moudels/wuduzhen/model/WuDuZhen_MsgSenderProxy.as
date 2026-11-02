package com.tgame.moudels.wuduzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuDuZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WuDuZhen_MsgSenderProxy";
      
      public function WuDuZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_72021(param1:* = null) : void
      {
         ZLog.add("72021：五毒阵 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(72021,_loc2_);
      }
      
      public function send_72023(param1:* = null) : void
      {
         ZLog.add("72023：请求五毒阵突破面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72023,_loc2_);
      }
      
      public function send_72025(param1:* = null) : void
      {
         ZLog.add("72025：请求突破五毒阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72025,_loc2_);
      }
   }
}

