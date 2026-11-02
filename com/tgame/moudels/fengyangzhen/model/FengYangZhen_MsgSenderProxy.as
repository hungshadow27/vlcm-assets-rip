package com.tgame.moudels.fengyangzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FengYangZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "FengYangZhen_MsgSenderProxy";
      
      public function FengYangZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71751(param1:* = null) : void
      {
         ZLog.add("71751\t\t请求玩家风扬阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71751,_loc2_);
      }
      
      public function send_71753(param1:* = null) : void
      {
         ZLog.add("71753\t\t玩家请求风扬阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71753,_loc2_);
      }
      
      public function send_71755(param1:* = null) : void
      {
         ZLog.add("71755\t\t请求突破风扬阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71755,_loc2_);
      }
      
      public function send_71757(param1:* = null) : void
      {
         ZLog.add("71757\t\t设置风扬阵是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71757,_loc2_);
      }
   }
}

