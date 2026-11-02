package com.tgame.moudels.fabao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fabao_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Fabao_MsgSendProxy";
      
      public function Fabao_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73631(param1:* = null) : void
      {
         ZLog.add("73631：请求法宝面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(73631,_loc2_);
      }
      
      public function send_73633(param1:* = null) : void
      {
         ZLog.add("73633：请求法宝列表翻页");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73633,_loc2_);
      }
      
      public function send_73635(param1:* = null) : void
      {
         ZLog.add("73635：请求是否显示法宝外观");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73635,_loc2_);
      }
      
      public function send_73637(param1:* = null) : void
      {
         ZLog.add("73637：请求法宝修炼面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73637,_loc2_);
      }
      
      public function send_73639(param1:* = null) : void
      {
         ZLog.add("73639：请求法宝修炼");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73639,_loc2_);
      }
      
      public function send_73641(param1:* = null) : void
      {
         ZLog.add("73641：请求灵力面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73641,_loc2_);
      }
      
      public function send_73643(param1:* = null) : void
      {
         ZLog.add("73643：请求凝结灵力丹");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73643,_loc2_);
      }
      
      public function send_73645(param1:* = null) : void
      {
         ZLog.add("73645：设置自动凝结灵力丹");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73645,_loc2_);
      }
   }
}

