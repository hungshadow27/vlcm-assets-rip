package com.tgame.moudels.XiSuiJing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiSuiJing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XiSuiJing_MsgSenderProxy";
      
      public function XiSuiJing_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_51991(param1:* = null) : void
      {
         ZLog.add("51991：洗髓经 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(51991,_loc2_);
      }
      
      public function send_51993(param1:* = null) : void
      {
         ZLog.add("51993：洗髓经 领悟面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(51993,_loc2_);
      }
      
      public function send_51995(param1:* = null) : void
      {
         ZLog.add("51995：洗髓经 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.id);
         NetWorkManager.sendMsg(51995,_loc2_);
      }
      
      public function send_51997(param1:* = null) : void
      {
         ZLog.add("51997：洗髓经 他人面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(51997,_loc2_);
      }
   }
}

