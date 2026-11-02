package com.tgame.moudels.ganjiangmoyezhuzao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GanJiangMoYeZhuZao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "GanJiangMoYeZhuZao_MsgSenderProxy";
      
      public function GanJiangMoYeZhuZao_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_61011(param1:* = null) : void
      {
         ZLog.add("61011:请求铸造干将莫邪");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61011,_loc2_);
      }
   }
}

