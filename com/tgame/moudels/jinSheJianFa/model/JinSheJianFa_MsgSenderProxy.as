package com.tgame.moudels.jinSheJianFa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JinSheJianFa_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JinSheJianFa_MsgSenderProxy";
      
      public function JinSheJianFa_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_74671(param1:* = null) : void
      {
         ZLog.add("74671 \t金蛇剑法请求信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74671,_loc2_);
      }
      
      public function send_74673(param1:* = null) : void
      {
         ZLog.add("74673\t\t金蛇剑法领悟查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74673,_loc2_);
      }
      
      public function send_74675(param1:* = null) : void
      {
         ZLog.add("74675\t\t金蛇剑法申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74675,_loc2_);
      }
   }
}

