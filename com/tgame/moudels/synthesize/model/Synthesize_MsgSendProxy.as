package com.tgame.moudels.synthesize.model
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Synthesize_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Synthesize_MsgSendProxy";
      
      public function Synthesize_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_50117(param1:* = null) : void
      {
         ZLog.add("50117:装备合成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.zhenXingFuNum);
         _loc2_.writeByte(param1.zhenHunFuNum);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50117,_loc2_);
      }
      
      public function send_50119(param1:* = null) : void
      {
         ZLog.add("50119:宝石材料合成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeInt(param1.item1);
         _loc2_.writeInt(param1.item2);
         _loc2_.writeInt(param1.item3);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50119,_loc2_);
      }
      
      public function send_50175(param1:* = null) : void
      {
         ZLog.add("50175:梦幻属性查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeInt(param1.id);
         NetWorkManager.sendMsg(50175,_loc2_);
      }
      
      public function send_50185(param1:* = null) : void
      {
         ZLog.add("50185:梦幻属性提升");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeByte(param1.updataTypeNum);
         NetWorkManager.sendMsg(50185,_loc2_);
      }
      
      public function send_50125(param1:* = null) : void
      {
         PipeManager.sendMsg(PipeConstants.EQUIP_STONE_SEND_50125,param1);
      }
      
      public function send_53525(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         NetWorkManager.sendMsg(53525,_loc2_);
      }
      
      public function send_53527(param1:* = null) : void
      {
         ZLog.add("53527:虎翼开光查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53527,_loc2_);
      }
      
      public function send_53529(param1:* = null) : void
      {
         ZLog.add("53529:虎翼开光");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53529,_loc2_);
      }
      
      public function send_53531(param1:* = null) : void
      {
         ZLog.add("53531:虎翼灵化查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53531,_loc2_);
      }
      
      public function send_53533(param1:* = null) : void
      {
         ZLog.add("53533:虎翼灵化");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53533,_loc2_);
      }
      
      public function send_53535(param1:* = null) : void
      {
         ZLog.add("53535:虎翼洗炼查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53535,_loc2_);
      }
      
      public function send_53537(param1:* = null) : void
      {
         ZLog.add("53537:虎翼洗炼");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53537,_loc2_);
      }
      
      public function send_53545(param1:* = null) : void
      {
         ZLog.add("53545:龙吟开光查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53545,_loc2_);
      }
      
      public function send_53547(param1:* = null) : void
      {
         ZLog.add("53547:龙吟开光");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53547,_loc2_);
      }
      
      public function send_53549(param1:* = null) : void
      {
         ZLog.add("53549:装备激活查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53549,_loc2_);
      }
      
      public function send_53551(param1:* = null) : void
      {
         ZLog.add("53547:装备激活");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53551,_loc2_);
      }
      
      public function send_53553(param1:* = null) : void
      {
         ZLog.add("53553:龙牙开光 通用装备开光 查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53553,_loc2_);
      }
      
      public function send_53555(param1:* = null) : void
      {
         ZLog.add("53553:龙牙开光 通用装备开光 确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53555,_loc2_);
      }
      
      public function send_53557(param1:* = null) : void
      {
         ZLog.add("53557:神龙护身符洗炼查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0] as int);
         _loc2_.writeByte(param1[1] as int);
         NetWorkManager.sendMsg(53557,_loc2_);
      }
      
      public function send_53559(param1:* = null) : void
      {
         ZLog.add("53559:神龙护身符洗炼+type" + param1.type);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(53559,_loc2_);
      }
      
      public function send_53571(param1:* = null) : void
      {
         ZLog.add("53571:史诗开封 查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53571,_loc2_);
      }
      
      public function send_53573(param1:* = null) : void
      {
         ZLog.add("53573:史诗开封 确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53573,_loc2_);
      }
      
      public function send_57351(param1:* = null) : void
      {
         ZLog.add("57351:护心药提升面板请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(57351,_loc2_);
      }
      
      public function send_57353(param1:* = null) : void
      {
         ZLog.add("57353:护心药提升请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(57353,_loc2_);
      }
      
      public function send_58953(param1:* = null) : void
      {
         ZLog.add("58953:勋章请求拖入");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         var _loc3_:Array = param1[2];
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_.writeShort(_loc3_[_loc4_]);
            _loc4_++;
         }
         _loc2_.writeShort(param1[3]);
         NetWorkManager.sendMsg(58953,_loc2_);
      }
      
      public function send_58955(param1:* = null) : void
      {
         ZLog.add("58955:勋章请求合成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1] as int);
         var _loc3_:Array = param1[2];
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_.writeShort(_loc3_[_loc4_]);
            _loc4_++;
         }
         NetWorkManager.sendMsg(58955,_loc2_);
      }
   }
}

