package com.tgame.moudels.qishazhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiShaZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QiShaZhen_MsgSenderProxy";
      
      public function QiShaZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_74801(param1:* = null) : void
      {
         ZLog.add("74801：请求玩家七杀阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74801,_loc2_);
      }
      
      public function send_74803(param1:* = null) : void
      {
         ZLog.add("74803：请求七杀阵突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74803,_loc2_);
      }
      
      public function send_74805(param1:* = null) : void
      {
         ZLog.add("74805：请求玩家七杀阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74805,_loc2_);
      }
   }
}

