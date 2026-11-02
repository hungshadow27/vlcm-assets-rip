package com.tgame.moudels.zhongzhixuanyuanjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhongZhiXuanYuanJian_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "ZhongZhiXuanYuanJian_MsgSendProxy";
      
      public function ZhongZhiXuanYuanJian_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73781(param1:* = null) : void
      {
         ZLog.add("73781：确认坐标");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73781,_loc2_);
      }
   }
}

