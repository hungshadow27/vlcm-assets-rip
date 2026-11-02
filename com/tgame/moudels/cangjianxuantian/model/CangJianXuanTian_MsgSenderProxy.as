package com.tgame.moudels.cangjianxuantian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CangJianXuanTian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "CangJianXuanTian_MsgSenderProxy";
      
      public function CangJianXuanTian_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_79621(param1:* = null) : void
      {
         ZLog.add("79621 \t藏剑玄天请求信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(79621,_loc2_);
      }
      
      public function send_79623(param1:* = null) : void
      {
         ZLog.add("79623\t\t藏剑玄天领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79623,_loc2_);
      }
      
      public function send_79625(param1:* = null) : void
      {
         ZLog.add("79625\t\t藏剑玄天申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79625,_loc2_);
      }
   }
}

