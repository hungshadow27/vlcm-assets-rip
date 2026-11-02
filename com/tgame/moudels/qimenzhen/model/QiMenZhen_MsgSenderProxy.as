package com.tgame.moudels.qimenzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiMenZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QiMenZhen_MsgSenderProxy";
      
      public function QiMenZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_57701(param1:* = null) : void
      {
         ZLog.add("57701：奇门阵 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1.userID));
         _loc2_.writeByte(int(param1.skillID));
         NetWorkManager.sendMsg(57701,_loc2_);
      }
      
      public function send_57703(param1:* = null) : void
      {
         ZLog.add("57703：奇门阵 领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(57703,_loc2_);
      }
   }
}

