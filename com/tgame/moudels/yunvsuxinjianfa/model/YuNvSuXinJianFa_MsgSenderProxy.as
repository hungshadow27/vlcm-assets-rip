package com.tgame.moudels.yunvsuxinjianfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YuNvSuXinJianFa_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YuNvSuXinJianFa_MsgSenderProxy";
      
      public function YuNvSuXinJianFa_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73681(param1:* = null) : void
      {
         ZLog.add("73681：请求玩家玉女素心剑法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73681,_loc2_);
      }
      
      public function send_73683(param1:* = null) : void
      {
         ZLog.add("73683：请求玉女素心剑法突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73683,_loc2_);
      }
      
      public function send_73685(param1:* = null) : void
      {
         ZLog.add("73685：请求玩家玉女素心剑法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73685,_loc2_);
      }
   }
}

