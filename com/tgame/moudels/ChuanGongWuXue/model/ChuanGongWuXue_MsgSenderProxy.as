package com.tgame.moudels.ChuanGongWuXue.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChuanGongWuXue_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ChuanGongWuXue_MsgSenderProxy";
      
      public function ChuanGongWuXue_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_72131(param1:* = null) : void
      {
         ZLog.add("72131：发出 请求弟子传功面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72131,_loc2_);
      }
      
      public function send_72133(param1:* = null) : void
      {
         ZLog.add("72133：发出 请求弟子武学信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72133,_loc2_);
      }
      
      public function send_72135(param1:* = null) : void
      {
         ZLog.add("72135：发出 请求弟子技能拖拽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(72135,_loc2_);
      }
   }
}

