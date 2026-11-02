package com.tgame.moudels.jinzhongzhao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Jinzhongzhao_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Jinzhongzhao_MsgSenderProxy";
      
      public function Jinzhongzhao_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_55601(param1:* = null) : void
      {
         ZLog.add("55601：金钟罩 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1.userID));
         _loc2_.writeByte(int(param1.skillID));
         NetWorkManager.sendMsg(55601,_loc2_);
      }
      
      public function send_55603(param1:* = null) : void
      {
         ZLog.add("55603：金钟罩 领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(55603,_loc2_);
      }
      
      public function send_55605(param1:* = null) : void
      {
         ZLog.add("55605：金钟罩 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(55605,_loc2_);
      }
      
      public function send_55609(param1:* = null) : void
      {
         ZLog.add("55605：金钟罩 申请强化");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55609,_loc2_);
      }
   }
}

