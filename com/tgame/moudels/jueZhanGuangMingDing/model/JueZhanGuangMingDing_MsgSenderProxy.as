package com.tgame.moudels.jueZhanGuangMingDing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JueZhanGuangMingDing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JueZhanGuangMingDing_MsgSenderProxy";
      
      public function JueZhanGuangMingDing_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70701(param1:* = null) : void
      {
         ZLog.add("70701\t\t请求玩家决战光明顶");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(70701,_loc2_);
      }
   }
}

