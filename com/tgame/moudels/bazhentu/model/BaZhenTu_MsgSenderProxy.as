package com.tgame.moudels.bazhentu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaZhenTu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BaZhenTu_MsgSenderProxy";
      
      public function BaZhenTu_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_73061(param1:* = null) : void
      {
         ZLog.add("73061：请求玩家八阵图详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73061,_loc2_);
      }
      
      public function send_73063(param1:* = null) : void
      {
         ZLog.add("73063：请求八阵图突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73063,_loc2_);
      }
      
      public function send_73065(param1:* = null) : void
      {
         ZLog.add("73065：请求玩家八阵图详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73065,_loc2_);
      }
   }
}

