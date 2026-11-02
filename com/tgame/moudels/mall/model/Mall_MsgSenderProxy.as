package com.tgame.moudels.mall.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.info.TeamInfo;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Mall_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Mall_MsgSenderProxy";
      
      public function Mall_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      private function get myTeam() : TeamInfo
      {
         return GameInstance.mainCharData.teamInfo;
      }
      
      public function send_12101(param1:int) : void
      {
         ZLog.add("12101：发出 请求商城列表 类型=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(12101,_loc2_);
      }
      
      public function send_12103(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeInt(param1);
         _loc4_.writeInt(param2);
         _loc4_.writeInt(param3);
         NetWorkManager.sendMsg(12103,_loc4_);
         ZLog.add("12103： 请求购买商城物品, id=" + param1);
      }
      
      public function send_12107(param1:int, param2:int, param3:int) : void
      {
         ZLog.add("12107：获取商品属性" + param1);
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeInt(param1);
         _loc4_.writeByte(param2);
         _loc4_.writeInt(param3);
         NetWorkManager.sendMsg(12107,_loc4_);
      }
      
      public function send_12109() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(12109,_loc1_);
      }
      
      public function send_12113(param1:int) : void
      {
         ZLog.add("12113：发出 请求商城列表 类型=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(12113,_loc2_);
      }
      
      public function send_12115(param1:int, param2:int) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(param1);
         _loc3_.writeShort(param2);
         NetWorkManager.sendMsg(12115,_loc3_);
         ZLog.add("12115： 请求购买商城物品, id=" + param1);
      }
      
      public function send_53251(param1:* = null) : void
      {
         ZLog.add("53251：发出请求声望商品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(53251,_loc2_);
      }
      
      public function send_53253(param1:* = null) : void
      {
         ZLog.add("53253：发出购买商城道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(53253,_loc2_);
      }
      
      public function send_12117(param1:int, param2:int) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(param1);
         _loc3_.writeShort(param2);
         NetWorkManager.sendMsg(12117,_loc3_);
         ZLog.add("12117 用免费卡换取商城物品, id=" + param1);
      }
      
      public function send_12121(param1:int) : void
      {
         ZLog.add("12121：发出 请求商城列表 类型=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(12121,_loc2_);
      }
      
      public function send_12123(param1:int, param2:int) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(param1);
         _loc3_.writeShort(param2);
         NetWorkManager.sendMsg(12123,_loc3_);
         ZLog.add("12123： 请求购买商城物品, id=" + param1);
      }
      
      public function send_12127(param1:int, param2:int) : void
      {
         ZLog.add("12127：获取商品属性" + param1);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(param1);
         _loc3_.writeByte(param2);
         NetWorkManager.sendMsg(12127,_loc3_);
      }
   }
}

