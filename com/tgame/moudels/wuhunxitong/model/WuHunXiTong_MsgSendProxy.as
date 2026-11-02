package com.tgame.moudels.wuhunxitong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuHunXiTong_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "WuHunXiTong_MsgSendProxy";
      
      public function WuHunXiTong_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_79661(param1:* = null) : void
      {
         ZLog.add("79661：打开武魂面板面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79661,_loc2_);
      }
      
      public function send_79663(param1:* = null) : void
      {
         ZLog.add("79663：请求武魂查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79663,_loc2_);
      }
      
      public function send_79665(param1:* = null) : void
      {
         ZLog.add("79665：注入灵魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(79665,_loc2_);
      }
      
      public function send_79667(param1:* = null) : void
      {
         ZLog.add("79667：请求出站收回");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(79667,_loc2_);
      }
      
      public function send_79671(param1:* = null) : void
      {
         ZLog.add("79671：请求注入灵魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79671,_loc2_);
      }
      
      public function send_83211(param1:* = null) : void
      {
         ZLog.add("83211：请求乐透面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83211,_loc2_);
      }
      
      public function send_83213(param1:* = null) : void
      {
         ZLog.add("83213：乐透领取彩票");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83213,_loc2_);
      }
      
      public function send_83215(param1:* = null) : void
      {
         ZLog.add("83215：乐透领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83215,_loc2_);
      }
   }
}

