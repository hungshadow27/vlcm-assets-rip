package com.tgame.moudels.menpaijuexue.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MenPaiJueXue_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "MenPaiJueXue_MsgSendProxy";
      
      public function MenPaiJueXue_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_81201(param1:* = null) : void
      {
         ZLog.add("81201  \t请求面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(81201,_loc2_);
      }
      
      public function send_81203(param1:* = null) : void
      {
         ZLog.add("81203\t    请求门派绝学技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81203,_loc2_);
      }
      
      public function send_81205(param1:* = null) : void
      {
         ZLog.add("81205    请求门派绝学升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81205,_loc2_);
      }
   }
}

