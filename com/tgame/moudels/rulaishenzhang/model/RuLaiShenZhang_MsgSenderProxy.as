package com.tgame.moudels.rulaishenzhang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class RuLaiShenZhang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "RuLaiShenZhang_MsgSenderProxy";
      
      public function RuLaiShenZhang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_72821(param1:* = null) : void
      {
         ZLog.add("72821：如来神掌 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72821,_loc2_);
      }
      
      public function send_72823(param1:* = null) : void
      {
         ZLog.add("72823：请求如来神掌突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72823,_loc2_);
      }
      
      public function send_72825(param1:* = null) : void
      {
         ZLog.add("72825：请求玩家如来神掌详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(72825,_loc2_);
      }
   }
}

