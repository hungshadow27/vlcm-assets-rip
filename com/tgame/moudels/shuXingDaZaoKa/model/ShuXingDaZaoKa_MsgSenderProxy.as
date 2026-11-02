package com.tgame.moudels.shuXingDaZaoKa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShuXingDaZaoKa_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ShuXingDaZaoKa_MsgSenderProxy";
      
      public function ShuXingDaZaoKa_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53021(param1:* = null) : void
      {
         ZLog.add("53021：属性打造卡开始");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.index);
         NetWorkManager.sendMsg(53021,_loc2_);
      }
   }
}

