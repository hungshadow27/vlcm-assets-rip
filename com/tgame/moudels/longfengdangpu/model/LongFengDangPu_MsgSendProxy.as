package com.tgame.moudels.longfengdangpu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LongFengDangPu_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "LongFengChaLou_MsgSendProxy";
      
      public function LongFengDangPu_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_79421(param1:* = null) : void
      {
         ZLog.add("79421：打开龙凤茶楼面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79421,_loc2_);
      }
      
      public function send_79423(param1:* = null) : void
      {
         ZLog.add("79423：请求当铺");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(79423,_loc2_);
      }
      
      public function send_79425(param1:* = null) : void
      {
         ZLog.add("79425：请求搜索商品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(79425,_loc2_);
      }
      
      public function send_79427(param1:* = null) : void
      {
         ZLog.add("79427：请求购买商品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(79427,_loc2_);
      }
   }
}

