package com.tgame.moudels.biwudahui.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Biwudahui_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Biwudahui_MsgSenderProxy";
      
      public function Biwudahui_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_53861(param1:* = null) : void
      {
         ZLog.add("53861：請求對陣圖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53861,_loc2_);
      }
   }
}

