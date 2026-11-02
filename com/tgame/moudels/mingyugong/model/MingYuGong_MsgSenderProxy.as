package com.tgame.moudels.mingyugong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MingYuGong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "MingYuGong_MsgSenderProxy";
      
      public function MingYuGong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_78601(param1:* = null) : void
      {
         ZLog.add("78601：明玉功 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(78601,_loc2_);
      }
      
      public function send_78603(param1:* = null) : void
      {
         ZLog.add("78603：明玉功 闯关查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(78603,_loc2_);
      }
      
      public function send_78605(param1:* = null) : void
      {
         ZLog.add("78605：明玉功 申请闯关");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(78605,_loc2_);
      }
   }
}

