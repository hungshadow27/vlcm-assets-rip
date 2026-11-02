package com.tgame.moudels.xiuwei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiuWei_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XiuWei_MsgSenderProxy";
      
      public function XiuWei_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_55701(param1:* = null) : void
      {
         ZLog.add("55701：修为 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1.userID));
         _loc2_.writeByte(int(param1.skillID));
         NetWorkManager.sendMsg(55701,_loc2_);
      }
      
      public function send_55703(param1:* = null) : void
      {
         ZLog.add("55703：修为 领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(55703,_loc2_);
      }
   }
}

