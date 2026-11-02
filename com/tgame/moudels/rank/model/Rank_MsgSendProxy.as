package com.tgame.moudels.rank.model
{
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Rank_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Rank_MsgSendProxy";
      
      public const jiangHuRankMsgNumArr:Array = [undefined,50303,50305,50309,50317,50321,50313,50329,50325,50333,50341,50355,50353,undefined,undefined,40039,50359,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,50361,undefined,undefined,50365,undefined,50367];
      
      public const otherRankMsgNumArr:Array = [undefined,undefined,50307,50311,50319,50323,50315,50331,50327,50335,50343,50351,50357,undefined,50369];
      
      public function Rank_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_50301(param1:* = null) : void
      {
         ZLog.add("50301:排行榜崇拜/鄙视");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeInt(param1.id);
         _loc2_.writeByte(param1.action);
         NetWorkManager.sendMsg(50301,_loc2_);
      }
      
      public function sendMsg(param1:* = null) : void
      {
         ZLog.add(param1.msgNum + ":请求排行：" + param1.msgNum + " 页数：" + param1.pageNum);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.pageNum);
         _loc2_.writeUTF(param1.searchName);
         if(param1.msgNum == 50361)
         {
            _loc2_.writeByte(0);
         }
         else if(param1.msgNum == 50365)
         {
            param1.msgNum = 50361;
            _loc2_.writeByte(1);
         }
         else if(param1.msgNum == 50367)
         {
            param1.msgNum = 50361;
            _loc2_.writeByte(2);
         }
         NetWorkManager.sendMsg(param1.msgNum,_loc2_);
      }
      
      public function send_50337(param1:* = null) : void
      {
         ZLog.add("50337:请求装备详细信息,id:" + param1.id);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeByte(param1.index);
         if(param1.index == OtherConst.RANK_KUAFU_ID || param1.index == OtherConst.RANK_KUAFU_BIWUDAHUI || param1.index == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            _loc2_.writeUTF(param1.qufu);
         }
         if(param1.index == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            _loc2_.writeUTF(param1.pingtai);
         }
         NetWorkManager.sendMsg(50337,_loc2_);
      }
      
      public function send_50339(param1:* = null) : void
      {
         ZLog.add("50339:请求坐骑详细信息,id:" + param1.id);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeInt(param1.mountID);
         _loc2_.writeByte(param1.index);
         NetWorkManager.sendMsg(50339,_loc2_);
      }
      
      public function send_50345(param1:* = null) : void
      {
         ZLog.add("50345:请求副本排行,id:" + param1.id);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.pageNum);
         _loc2_.writeByte(param1.index);
         _loc2_.writeByte(param1.dataNum);
         _loc2_.writeUTF(param1.scearchName);
         NetWorkManager.sendMsg(50345,_loc2_);
      }
      
      public function send_50399(param1:* = null) : void
      {
         ZLog.add("50399:请求排行统计");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.panelType);
         NetWorkManager.sendMsg(50399,_loc2_);
      }
      
      public function send_40029(param1:* = null) : void
      {
         ZLog.add("40029:请求战斗力详情");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(40029,_loc2_);
      }
      
      public function send_72981(param1:* = null) : void
      {
         ZLog.add("72981:越南  请求新服排行榜");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(72981,_loc2_);
      }
      
      public function send_72983(param1:* = null) : void
      {
         ZLog.add("72983:越南  请求领取新服排行榜奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72983,_loc2_);
      }
   }
}

