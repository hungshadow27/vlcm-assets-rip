package com.tgame.moudels.TianJiangXiangRui.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianJiangXiangRui_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TianJiangXiangRui_MsgSenderProxy";
      
      public function TianJiangXiangRui_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_61401(param1:* = null) : void
      {
         ZLog.add("61401\t\t请求天降祥瑞信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61401,_loc2_);
      }
      
      public function send_61403(param1:* = null) : void
      {
         ZLog.add("61403\t\t查看物品掉落信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61403,_loc2_);
      }
      
      public function send_61405(param1:* = null) : void
      {
         ZLog.add("61405\t\t请求进入地图");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(61405,_loc2_);
      }
   }
}

