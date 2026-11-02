package com.tgame.moudels.bangpairongyutarget.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BangPaiRongYuTarget_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BangPaiRongYuTarget_MsgSenderProxy";
      
      public function BangPaiRongYuTarget_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71023(param1:* = null) : void
      {
         ZLog.add("71023：请求其他帮派荣誉城池列表信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71023,_loc2_);
      }
   }
}

