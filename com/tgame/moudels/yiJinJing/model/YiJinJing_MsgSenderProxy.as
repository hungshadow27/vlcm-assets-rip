package com.tgame.moudels.yiJinJing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YiJinJing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YiJinJing_MsgSenderProxy";
      
      public function YiJinJing_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_51951(param1:* = null) : void
      {
         ZLog.add("51951：易筋经 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(51951,_loc2_);
      }
      
      public function send_51953(param1:* = null) : void
      {
         ZLog.add("51953：易筋经 领悟面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(51953,_loc2_);
      }
      
      public function send_51955(param1:* = null) : void
      {
         ZLog.add("51955：易筋经 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.id);
         _loc2_.writeByte(param1.isNow);
         NetWorkManager.sendMsg(51955,_loc2_);
      }
      
      public function send_51957(param1:* = null) : void
      {
         ZLog.add("51957：易筋经 他人面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(51957,_loc2_);
      }
   }
}

