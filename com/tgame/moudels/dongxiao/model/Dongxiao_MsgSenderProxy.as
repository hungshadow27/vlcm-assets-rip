package com.tgame.moudels.dongxiao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Dongxiao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Dongxiao_MsgSenderProxy";
      
      public function Dongxiao_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53801(param1:* = null) : void
      {
         ZLog.add("53801：请求洞箫整体信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(53801,_loc2_);
      }
      
      public function send_53803(param1:* = null) : void
      {
         ZLog.add("53803：请求洞箫修炼");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53803,_loc2_);
      }
      
      public function send_53805(param1:* = null) : void
      {
         ZLog.add("53805：请求洞箫突破");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53805,_loc2_);
      }
      
      public function send_53807(param1:* = null) : void
      {
         ZLog.add("53807：是否开启洞箫");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53807,_loc2_);
      }
      
      public function send_53809(param1:* = null) : void
      {
         ZLog.add("53809：显示弓箭或洞箫外观");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53809,_loc2_);
      }
   }
}

