package com.tgame.moudels.zixiashengong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZiXia_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ZiXia_MsgSenderProxy";
      
      public function ZiXia_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_57381(param1:* = null) : void
      {
         ZLog.add("57381：紫霞神功 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(57381,_loc2_);
      }
      
      public function send_57383(param1:* = null) : void
      {
         ZLog.add("57383：紫霞悟道查询请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57383,_loc2_);
      }
      
      public function send_57385(param1:* = null) : void
      {
         ZLog.add("57385：紫霞领悟请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57385,_loc2_);
      }
      
      public function send_57387(param1:* = null) : void
      {
         ZLog.add("57387：查看其它人紫霞悟道信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(57387,_loc2_);
      }
   }
}

