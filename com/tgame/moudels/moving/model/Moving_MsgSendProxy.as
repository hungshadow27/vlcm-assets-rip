package com.tgame.moudels.moving.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Moving_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Moving_MsgSendProxy";
      
      public function Moving_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_52051(param1:* = null) : void
      {
         ZLog.add("兔子活动请求奖品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.itmeArr.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.itmeArr.length)
         {
            _loc2_.writeShort(param1.itmeArr[_loc3_].position);
            _loc3_++;
         }
         NetWorkManager.sendMsg(52051,_loc2_);
      }
   }
}

