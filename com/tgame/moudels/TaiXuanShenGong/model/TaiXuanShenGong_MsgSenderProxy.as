package com.tgame.moudels.TaiXuanShenGong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TaiXuanShenGong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TaiXuanShenGong_MsgSenderProxy";
      
      public function TaiXuanShenGong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_52191(param1:* = null) : void
      {
         ZLog.add("52191：太玄神功 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(52191,_loc2_);
      }
      
      public function send_52193(param1:* = null) : void
      {
         ZLog.add("52193：太玄神功 领悟面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(52193,_loc2_);
      }
      
      public function send_52195(param1:* = null) : void
      {
         ZLog.add("52195：太玄神功 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.id);
         NetWorkManager.sendMsg(52195,_loc2_);
      }
      
      public function send_52197(param1:* = null) : void
      {
         ZLog.add("52197：太玄神功 他人面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(52197,_loc2_);
      }
   }
}

