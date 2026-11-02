package com.tgame.moudels.menpaineifa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MenPaiNeiFa_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "MenPaiNeiFa_MsgSendProxy";
      
      public function MenPaiNeiFa_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_81441(param1:* = null) : void
      {
         ZLog.add("81441  \t请求面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(81441,_loc2_);
      }
      
      public function send_81443(param1:* = null) : void
      {
         ZLog.add("81443\t    请求门派绝学技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81443,_loc2_);
      }
      
      public function send_81445(param1:* = null) : void
      {
         ZLog.add("81445    请求门派绝学升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81445,_loc2_);
      }
   }
}

