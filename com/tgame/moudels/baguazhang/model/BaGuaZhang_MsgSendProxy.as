package com.tgame.moudels.baguazhang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaGuaZhang_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "BaGuaZhang_MsgSendProxy";
      
      public function BaGuaZhang_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_53901(param1:* = null) : void
      {
         ZLog.add("53901：请求指定角色当前炼体级别");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53901,_loc2_);
      }
      
      public function send_53903(param1:* = null) : void
      {
         ZLog.add("53903：请求主角提升炼体境界面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53903,_loc2_);
      }
      
      public function send_53905(param1:* = null) : void
      {
         ZLog.add("53905：请求提升炼体");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(53905,_loc2_);
      }
      
      public function send_53909(param1:* = null) : void
      {
         ZLog.add("53909：请求激活肉身隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53909,_loc2_);
      }
   }
}

