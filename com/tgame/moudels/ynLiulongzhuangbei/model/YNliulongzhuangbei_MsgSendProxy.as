package com.tgame.moudels.ynLiulongzhuangbei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNliulongzhuangbei_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNliulongzhuangbei_MsgSendProxy";
      
      public function YNliulongzhuangbei_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_80481(param1:* = null) : void
      {
         ZLog.add("80481：请求是否显示世界杯面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(80481,_loc2_);
      }
      
      public function send_83191(param1:* = null) : void
      {
         ZLog.add("83191：请求是否显示精灵气旋");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83191,_loc2_);
      }
      
      public function send_83361(param1:* = null) : void
      {
         ZLog.add("83361：请求归魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83361,_loc2_);
      }
      
      public function send_83363(param1:* = null) : void
      {
         ZLog.add("83363：请求归魂升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83363,_loc2_);
      }
      
      public function send_83365(param1:* = null) : void
      {
         ZLog.add("83365：请求归魂突破");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83365,_loc2_);
      }
      
      public function send_83367(param1:* = null) : void
      {
         ZLog.add("83367：请求选中/取消技能激活显示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(83367,_loc2_);
      }
   }
}

