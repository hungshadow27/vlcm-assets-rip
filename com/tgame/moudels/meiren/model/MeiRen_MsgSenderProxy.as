package com.tgame.moudels.meiren.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MeiRen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:* = "MeiRen_MsgSenderProxy";
      
      public function MeiRen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_60051(param1:* = null) : void
      {
         ZLog.add("60051：请求美人界面");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60051,_loc2_);
      }
      
      public function send_60053(param1:* = null) : void
      {
         ZLog.add("60053：请求美人详情");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60053,_loc2_);
      }
      
      public function send_60055(param1:* = null) : void
      {
         ZLog.add("60055：请求美人出战/隐藏");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60055,_loc2_);
      }
      
      public function send_60059(param1:* = null) : void
      {
         ZLog.add("60059：请求钦点美人");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60059,_loc2_);
      }
      
      public function send_60061(param1:* = null) : void
      {
         ZLog.add("60061：请求美人缠绵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60061,_loc2_);
      }
      
      public function send_60087(param1:* = null) : void
      {
         ZLog.add("60087：请求美人技能列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60087,_loc2_);
      }
      
      public function send_60089(param1:* = null) : void
      {
         ZLog.add("60089：请求技能重置");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(60089,_loc2_);
      }
   }
}

