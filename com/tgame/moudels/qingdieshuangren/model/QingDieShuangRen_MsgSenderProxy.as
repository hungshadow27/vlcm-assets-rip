package com.tgame.moudels.qingdieshuangren.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingDieShuangRen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QingDieShuangRen_MsgSenderProxy";
      
      public function QingDieShuangRen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_79531(param1:* = null) : void
      {
         ZLog.add("79531 \t青蝶双刃请求信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(79531,_loc2_);
      }
      
      public function send_79533(param1:* = null) : void
      {
         ZLog.add("79533\t\t青蝶双刃领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79533,_loc2_);
      }
      
      public function send_79535(param1:* = null) : void
      {
         ZLog.add("79535\t\t青蝶双刃申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79535,_loc2_);
      }
      
      public function send_79189(param1:* = null) : void
      {
         ZLog.add("79189\t\t五行宝甲申请换装");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(79189,_loc2_);
      }
   }
}

