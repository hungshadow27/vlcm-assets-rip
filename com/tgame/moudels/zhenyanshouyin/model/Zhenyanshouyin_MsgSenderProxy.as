package com.tgame.moudels.zhenyanshouyin.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Zhenyanshouyin_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Zhenyanshouyin_MsgSenderProxy";
      
      public function Zhenyanshouyin_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73301(param1:* = null) : void
      {
         ZLog.add("73301：真言手印 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(73301,_loc2_);
      }
      
      public function send_73303(param1:* = null) : void
      {
         ZLog.add("73303：真言手印 领悟请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73303,_loc2_);
      }
   }
}

