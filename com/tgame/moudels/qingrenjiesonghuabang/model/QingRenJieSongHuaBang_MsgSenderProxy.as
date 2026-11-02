package com.tgame.moudels.qingrenjiesonghuabang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingRenJieSongHuaBang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QingRenJieSongHuaBang_MsgSenderProxy";
      
      public function QingRenJieSongHuaBang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_72707(param1:* = null) : void
      {
         ZLog.add("72707：发出 请求送花榜信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(72707,_loc2_);
      }
      
      public function send_72709(param1:* = null) : void
      {
         ZLog.add("72709：发出 请求变身");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72709,_loc2_);
      }
   }
}

