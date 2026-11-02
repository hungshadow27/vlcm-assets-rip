package com.tgame.moudels.qishangquan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiShangQuan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QiShangQuan_MsgSenderProxy";
      
      public function QiShangQuan_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_57261(param1:* = null) : void
      {
         ZLog.add("57261：七伤拳 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1.userID));
         _loc2_.writeByte(int(param1.skillID));
         NetWorkManager.sendMsg(57261,_loc2_);
      }
      
      public function send_57263(param1:* = null) : void
      {
         ZLog.add("57263：七伤拳 领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(57263,_loc2_);
      }
   }
}

