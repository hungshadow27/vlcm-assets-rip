package com.tgame.moudels.biwuCrossP.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BiwuCrossP_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BiwuCrossP_MsgSenderProxy";
      
      public function BiwuCrossP_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_55555(param1:* = null) : void
      {
         ZLog.add("55555：助威");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeUTF(param1[2]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(55555,_loc2_);
      }
      
      public function send_55557(param1:* = null) : void
      {
         ZLog.add("55557：领奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55557,_loc2_);
      }
      
      public function send_55559(param1:* = null) : void
      {
         ZLog.add("55559：传入比赛地图");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55559,_loc2_);
      }
      
      public function send_55551(param1:* = null) : void
      {
         ZLog.add("55551：请求32强列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         _loc2_.writeUTF("");
         NetWorkManager.sendMsg(55551,_loc2_);
      }
      
      public function send_55561(param1:* = null) : void
      {
         ZLog.add("55561：請求對陣圖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55561,_loc2_);
      }
      
      public function send_55563(param1:* = null) : void
      {
         ZLog.add("55563：请求比赛日期");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55563,_loc2_);
      }
      
      public function send_55565(param1:* = null) : void
      {
         ZLog.add("55565：比武大会报名");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55565,_loc2_);
      }
      
      public function send_55567(param1:* = null) : void
      {
         ZLog.add("55567：比武大会观战");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeUTF(param1[2]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(55567,_loc2_);
      }
      
      public function send_55579(param1:* = null, param2:int = 0) : void
      {
         ZLog.add("55579：比武大会历史战况");
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         _loc3_.writeByte(param2);
         _loc3_.writeUTF("");
         NetWorkManager.sendMsg(55579,_loc3_);
      }
      
      public function send_55581(param1:* = null, param2:int = 0) : void
      {
         ZLog.add("55581：越南请求 襄阳战场排行榜 信息");
         var _loc3_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55581,_loc3_);
      }
      
      public function send_55583(param1:* = null, param2:int = 0) : void
      {
         ZLog.add("55583：越南请求 襄阳战场排行榜 领奖");
         var _loc3_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55583,_loc3_);
      }
   }
}

