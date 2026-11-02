package com.tgame.moudels.xingxiuzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XingXiuZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XingXiuZhen_MsgSenderProxy";
      
      public function XingXiuZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_74701(param1:* = null) : void
      {
         ZLog.add("74701：请求玩家二十八星宿阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74701,_loc2_);
      }
      
      public function send_74703(param1:* = null) : void
      {
         ZLog.add("74703：请求二十八星宿阵突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74703,_loc2_);
      }
      
      public function send_74705(param1:* = null) : void
      {
         ZLog.add("74705：请求玩家二十八星宿阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74705,_loc2_);
      }
   }
}

