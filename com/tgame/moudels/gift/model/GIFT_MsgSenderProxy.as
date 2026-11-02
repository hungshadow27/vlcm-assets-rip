package com.tgame.moudels.gift.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GIFT_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "GIFT_MsgSenderProxy";
      
      public function GIFT_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_50703(param1:* = null) : void
      {
         ZLog.add("50703:领取升级礼包内物品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.index);
         NetWorkManager.sendMsg(50703,_loc2_);
      }
      
      public function send_50711(param1:* = null) : void
      {
         ZLog.add("50711:升级有礼所有奖品查询");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50711,_loc2_);
      }
      
      public function send_50717(param1:* = null) : void
      {
         ZLog.add("50717:领取见面有礼礼品");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50717,_loc2_);
      }
      
      public function send_50721(param1:* = null) : void
      {
         ZLog.add("50721:见面有礼列表请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50721,_loc2_);
      }
      
      public function send_50731(param1:* = null) : void
      {
         ZLog.add("50731:邀请有礼");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50731,_loc2_);
      }
      
      public function send_50733(param1:* = null) : void
      {
         ZLog.add("50733:邀请有礼领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1 as int);
         NetWorkManager.sendMsg(50733,_loc2_);
      }
      
      public function send_50741(param1:* = null) : void
      {
         ZLog.add("50741:登录有礼列表请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50741,_loc2_);
      }
      
      public function send_50743(param1:* = null) : void
      {
         ZLog.add("50743:登录有礼领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1 as int);
         NetWorkManager.sendMsg(50743,_loc2_);
      }
      
      public function send_50751(param1:* = null) : void
      {
         ZLog.add("50751:在线有礼");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50751,_loc2_);
      }
      
      public function send_50753(param1:* = null) : void
      {
         ZLog.add("50753:在线有礼领取");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50753,_loc2_);
      }
      
      public function send_50755(param1:* = null) : void
      {
         ZLog.add("50755在线有礼已登录时间");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(50755,_loc2_);
      }
      
      public function send_50795(param1:* = null) : void
      {
         ZLog.add("50755新闻公告");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50795,_loc2_);
      }
      
      public function send_50757(param1:* = null) : void
      {
         ZLog.add("50757:请求领取");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50757,_loc2_);
      }
      
      public function send_50759(param1:* = null) : void
      {
         ZLog.add("50759:请求领取签到奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50759,_loc2_);
      }
      
      public function send_53061(param1:* = null) : void
      {
         ZLog.add("53061:请求所开启的活动");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53061,_loc2_);
      }
      
      public function send_52055(param1:* = null) : void
      {
         ZLog.add("52055:请求活动进度");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52055,_loc2_);
      }
      
      public function send_52053(param1:* = null) : void
      {
         ZLog.add("52053:请求领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         var _loc3_:Number = getTimer();
         _loc2_.writeDouble(_loc3_);
         var _loc4_:Number = _loc3_;
         var _loc5_:Number = _loc4_ % 1000;
         var _loc6_:Number = _loc4_ % 100;
         var _loc7_:Number = GameInstance.mainCharData.attributeInfo.random1 * GameInstance.mainCharData.attributeInfo.random1;
         _loc2_.writeDouble((_loc5_ * _loc5_ + _loc6_ * _loc6_ + _loc7_) % GameInstance.mainCharData.attributeInfo.random2);
         var _loc8_:String = GameInstance.mainCharData.attributeInfo.random3 + GameConfig.sever_time_with_10106 + _loc4_;
         var _loc9_:String = ZMD5.calculate(_loc8_);
         var _loc10_:String = ZMD5.calculate(_loc9_);
         var _loc11_:String = ZMD5.calculate(_loc10_);
         _loc2_.writeUTF(_loc11_);
         var _loc12_:String = _loc3_ + GameInstance.mainCharData.attributeInfo.random_str;
         var _loc13_:String = ZMD5.calculate(_loc12_);
         _loc2_.writeUTF(_loc13_);
         ZLog.add("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + (_loc5_ * _loc5_ + _loc6_ * _loc6_ + _loc7_) % GameInstance.mainCharData.attributeInfo.random2);
         NetWorkManager.sendMsg(52053,_loc2_);
      }
      
      public function send_40021(param1:* = null) : void
      {
         ZLog.add("40021：boss刷新");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40021,_loc2_);
      }
      
      public function send_40041(param1:* = null) : void
      {
         ZLog.add("40041：今日活动查询");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = param1 as Boolean == true ? 1 : 0;
         _loc2_.writeByte(_loc3_);
         NetWorkManager.sendMsg(40041,_loc2_);
      }
      
      public function send_40043(param1:* = null) : void
      {
         ZLog.add("40043：今日闯阵查询");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = param1 as Boolean == true ? 1 : 0;
         _loc2_.writeByte(_loc3_);
         NetWorkManager.sendMsg(40043,_loc2_);
      }
      
      public function send_53053(param1:* = null) : void
      {
         ZLog.add("53053：使用武功升级丹提升武功");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53053,_loc2_);
      }
      
      public function send_53055(param1:* = null) : void
      {
         ZLog.add("53055：使使用道具限时领取（例如：菩提优惠提取卡的10秒领取菩提丹）武功");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(53055,_loc2_);
      }
      
      public function send_53781(param1:* = null) : void
      {
         ZLog.add("53781：请求活跃度整体显示");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53781,_loc2_);
      }
      
      public function send_53783(param1:* = null) : void
      {
         ZLog.add("53783：请求活跃度整体显示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1 as int);
         NetWorkManager.sendMsg(53783,_loc2_);
      }
      
      public function send_53785(param1:* = null) : void
      {
         ZLog.add("53785：请求活跃度整体显示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1 as int);
         NetWorkManager.sendMsg(53785,_loc2_);
      }
      
      public function send_53093(param1:* = null) : void
      {
         ZLog.add("53093: 请求 进行装备回收");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.type);
         _loc2_.writeShort(param1.pos);
         _loc2_.writeInt(param1.id);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(53093,_loc2_);
      }
      
      public function send_53791(param1:* = null) : void
      {
         ZLog.add("53781：请求领取老玩家回馈奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(53791,_loc2_);
      }
      
      public function send_56031(param1:* = null) : void
      {
         ZLog.add("56031:请求累计登录面板数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(56031,_loc2_);
      }
      
      public function send_56033(param1:* = null) : void
      {
         ZLog.add("56033:领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         var _loc3_:Number = getTimer();
         _loc2_.writeDouble(_loc3_);
         var _loc4_:String = _loc3_ + GameInstance.mainCharData.attributeInfo.random_str;
         var _loc5_:String = ZMD5.calculate(_loc4_);
         _loc2_.writeUTF(_loc5_);
         NetWorkManager.sendMsg(56033,_loc2_);
      }
      
      public function send_58551(param1:int) : void
      {
         ZLog.add("58551：发出 请求活动列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(58551,_loc2_);
      }
      
      public function send_58553(param1:*) : void
      {
         ZLog.add("58553：请求翻页信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeByte(int(param1[2]));
         NetWorkManager.sendMsg(58553,_loc2_);
      }
      
      public function send_58555(param1:*) : void
      {
         ZLog.add("58555：请求活动挂机完成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeInt(int(param1[2]));
         NetWorkManager.sendMsg(58555,_loc2_);
      }
      
      public function send_58557(param1:*) : void
      {
         ZLog.add("58557：请求活动立即完成或领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(58557,_loc2_);
      }
      
      public function send_58559() : void
      {
         ZLog.add("58559：请求新增开启挂机栏");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(58559,_loc1_);
      }
      
      public function send_81421() : void
      {
         ZLog.add("81421：请求消费");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81421,_loc1_);
      }
      
      public function send_81423() : void
      {
         ZLog.add("81423：请求消费");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81423,_loc1_);
      }
      
      public function send_81461() : void
      {
         ZLog.add("81461：请求消费");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81461,_loc1_);
      }
      
      public function send_81463(param1:*) : void
      {
         ZLog.add("81463：请求消费领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeByte(param1.index);
         NetWorkManager.sendMsg(81463,_loc2_);
      }
      
      public function send_81521(param1:*) : void
      {
         ZLog.add("81521：请求武神战练面板  or 页数");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         NetWorkManager.sendMsg(81521,_loc2_);
      }
      
      public function send_81523(param1:* = null) : void
      {
         ZLog.add("81523：武神战练请求提交 ");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81523,_loc2_);
      }
      
      public function send_81525(param1:* = null) : void
      {
         ZLog.add("81525：请求武神战练领取 ");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81525,_loc2_);
      }
      
      public function send_81631(param1:* = null) : void
      {
         ZLog.add("81631：请求周期财禄面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81631,_loc2_);
      }
      
      public function send_81633(param1:* = null) : void
      {
         ZLog.add("81633：请求周期财禄领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(81633,_loc2_);
      }
      
      public function send_53095(param1:* = null) : void
      {
         ZLog.add("53095：请求领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53095,_loc2_);
      }
      
      public function send_81663(param1:* = null) : void
      {
         ZLog.add("81663：请求提交金钱树");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81663,_loc2_);
      }
      
      public function send_81665(param1:* = null) : void
      {
         ZLog.add("81665：请求领取奖励金钱树");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81665,_loc2_);
      }
      
      public function send_81711(param1:* = null) : void
      {
         ZLog.add("81711：请求开学排行榜");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81711,_loc2_);
      }
      
      public function send_81713(param1:* = null) : void
      {
         ZLog.add("81713：请求提交物品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81713,_loc2_);
      }
      
      public function send_81715(param1:* = null) : void
      {
         ZLog.add("81715：请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81715,_loc2_);
      }
      
      public function send_81741(param1:* = null) : void
      {
         ZLog.add("81741：请求开学排行榜");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81741,_loc2_);
      }
      
      public function send_81743(param1:* = null) : void
      {
         ZLog.add("81743：请求提交物品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81743,_loc2_);
      }
      
      public function send_81745(param1:* = null) : void
      {
         ZLog.add("81745：请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81745,_loc2_);
      }
      
      public function send_81751(param1:* = null) : void
      {
         ZLog.add("81751：请求返利");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81751,_loc2_);
      }
      
      public function send_81753(param1:* = null) : void
      {
         ZLog.add("81753：请求返利领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(81753,_loc2_);
      }
      
      public function send_81761(param1:* = null) : void
      {
         ZLog.add("81761：夫妻同心");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81761,_loc2_);
      }
      
      public function send_81763(param1:* = null) : void
      {
         ZLog.add("81763：夫妻同心兑换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81763,_loc2_);
      }
      
      public function send_81765(param1:* = null) : void
      {
         ZLog.add("81765：夫妻同心排行");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81765,_loc2_);
      }
      
      public function send_81767(param1:* = null) : void
      {
         ZLog.add("81767：夫妻同心排行奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81767,_loc2_);
      }
      
      public function send_81821(param1:* = null) : void
      {
         ZLog.add("81821：六派竞技");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81821,_loc2_);
      }
      
      public function send_81823(param1:* = null) : void
      {
         ZLog.add("81823：六派竞技提交物品");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81823,_loc2_);
      }
      
      public function send_81825(param1:* = null) : void
      {
         ZLog.add("81825：六派竞技领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81825,_loc2_);
      }
      
      public function send_81841(param1:* = null) : void
      {
         ZLog.add("81841：请求迎宾周礼面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81841,_loc2_);
      }
      
      public function send_81843(param1:* = null) : void
      {
         ZLog.add("81843：请求迎宾周礼领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81843,_loc2_);
      }
      
      public function send_81891(param1:* = null) : void
      {
         ZLog.add("81891：请求珍宝阁数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81891,_loc2_);
      }
      
      public function send_81893(param1:* = null) : void
      {
         ZLog.add("81893：请求珍宝阁购买");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81893,_loc2_);
      }
      
      public function send_82111(param1:* = null) : void
      {
         ZLog.add("82111：请求优惠周期数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82111,_loc2_);
      }
      
      public function send_82113(param1:* = null) : void
      {
         ZLog.add("82113：优惠周期领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82113,_loc2_);
      }
      
      public function send_82131(param1:* = null) : void
      {
         ZLog.add("82111：请求欧乐数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82131,_loc2_);
      }
      
      public function send_82133(param1:* = null) : void
      {
         ZLog.add("82113：欧乐领取");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82133,_loc2_);
      }
      
      public function send_82135(param1:* = null) : void
      {
         ZLog.add("82115：欧乐提交");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82135,_loc2_);
      }
      
      public function send_82141(param1:* = null) : void
      {
         ZLog.add("82141：请求英雄名称排行  数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82141,_loc2_);
      }
      
      public function send_82143(param1:* = null) : void
      {
         ZLog.add("82143：请求英雄名称领取");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82143,_loc2_);
      }
      
      public function send_82145(param1:* = null) : void
      {
         ZLog.add("82145：请求英雄名称提交");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(82145,_loc2_);
      }
      
      public function send_82147(param1:* = null) : void
      {
         ZLog.add("82147：请求巅峰周期");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82147,_loc2_);
      }
      
      public function send_82149(param1:* = null) : void
      {
         ZLog.add("82149：请求庆祝0606");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82149,_loc2_);
      }
      
      public function send_82151(param1:* = null) : void
      {
         ZLog.add("82151：请求神风");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82151,_loc2_);
      }
      
      public function send_82201(param1:* = null) : void
      {
         ZLog.add("82201：请求每天优惠");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82201,_loc2_);
      }
      
      public function send_82203(param1:* = null) : void
      {
         ZLog.add("82203：请求每天优惠领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82203,_loc2_);
      }
      
      public function send_82205(param1:* = null) : void
      {
         ZLog.add("82205：五毒圣阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82205,_loc2_);
      }
      
      public function send_82207(param1:* = null) : void
      {
         ZLog.add("82207：腾天羽");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82207,_loc2_);
      }
      
      public function send_82209(param1:* = null) : void
      {
         ZLog.add("82209：兑换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(82209,_loc2_);
      }
      
      public function send_82261(param1:* = null) : void
      {
         ZLog.add("82261：六月底");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82261,_loc2_);
      }
      
      public function send_82301(param1:* = null) : void
      {
         ZLog.add("82301：首充");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82301,_loc2_);
      }
      
      public function send_82303(param1:* = null) : void
      {
         ZLog.add("82303：首充领取");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82303,_loc2_);
      }
      
      public function send_82311(param1:* = null) : void
      {
         ZLog.add("82311：同乐飞升境界");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82311,_loc2_);
      }
      
      public function send_82361(param1:* = null) : void
      {
         ZLog.add("82361：欢迎维系");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82361,_loc2_);
      }
      
      public function send_82381(param1:* = null) : void
      {
         ZLog.add("82381：开学气球面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82381,_loc2_);
      }
      
      public function send_82383(param1:* = null) : void
      {
         ZLog.add("82383：请求提交");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(82383,_loc2_);
      }
      
      public function send_82385(param1:* = null) : void
      {
         ZLog.add("82385：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(82385,_loc2_);
      }
      
      public function send_82401(param1:* = null) : void
      {
         ZLog.add("82401：货真价实面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82401,_loc2_);
      }
      
      public function send_82431(param1:* = null) : void
      {
         ZLog.add("82431：王者活动面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82431,_loc2_);
      }
      
      public function send_82433(param1:* = null) : void
      {
         ZLog.add("82433：10月优惠周期");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82433,_loc2_);
      }
      
      public function send_82461(param1:* = null) : void
      {
         ZLog.add("82461：赠送女人面板刷新");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82461,_loc2_);
      }
      
      public function send_82463(param1:* = null) : void
      {
         ZLog.add("82463：赠送女人排行榜领奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82463,_loc2_);
      }
      
      public function send_20107(param1:* = null) : void
      {
         ZLog.add("20107：发送主角获取其他角色详细消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(20107,_loc2_);
      }
      
      public function send_82481(param1:* = null) : void
      {
         ZLog.add("82481：请求面板数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82481,_loc2_);
      }
      
      public function send_82483(param1:* = null) : void
      {
         ZLog.add("82483：请求某页信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82483,_loc2_);
      }
      
      public function send_82485(param1:* = null) : void
      {
         ZLog.add("82485：请求投票");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82485,_loc2_);
      }
      
      public function send_82487(param1:* = null) : void
      {
         ZLog.add("82487：请求参与");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82487,_loc2_);
      }
      
      public function send_82489(param1:* = null) : void
      {
         ZLog.add("82489：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82489,_loc2_);
      }
      
      public function send_82491(param1:* = null) : void
      {
         ZLog.add("82491：请求累计充值");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82491,_loc2_);
      }
      
      public function send_82521(param1:* = null) : void
      {
         ZLog.add("82521：请求内力盖世面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82521,_loc2_);
      }
      
      public function send_82523(param1:* = null) : void
      {
         ZLog.add("82523：领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(82523,_loc2_);
      }
      
      public function send_82525(param1:* = null) : void
      {
         ZLog.add("82525：提交");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82525,_loc2_);
      }
      
      public function send_82611(param1:* = null) : void
      {
         ZLog.add("82611：请求培养巅峰兽：面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82611,_loc2_);
      }
      
      public function send_82613(param1:* = null) : void
      {
         ZLog.add("826113：请求培养巅峰兽：喂养");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(82613,_loc2_);
      }
      
      public function send_82615(param1:* = null) : void
      {
         ZLog.add("82615：请求培养巅峰兽：领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(82615,_loc2_);
      }
      
      public function send_82715(param1:* = null) : void
      {
         ZLog.add("82715：请求版本优惠");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82715,_loc2_);
      }
      
      public function send_83023(param1:* = null) : void
      {
         ZLog.add("83023：请求水果累计次数");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83023,_loc2_);
      }
      
      public function send_83031(param1:* = null) : void
      {
         ZLog.add("83031：请求至尊称号争夺");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83031,_loc2_);
      }
      
      public function send_83041(param1:* = null) : void
      {
         ZLog.add("83041：请求争夺战活动");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83041,_loc2_);
      }
      
      public function send_83043(param1:* = null) : void
      {
         ZLog.add("83043：请求争夺战领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83043,_loc2_);
      }
      
      public function send_83071(param1:* = null) : void
      {
         ZLog.add("83071：请求美酒排行活动");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83071,_loc2_);
      }
      
      public function send_83073(param1:* = null) : void
      {
         ZLog.add("83073：请求美酒排行领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(83073,_loc2_);
      }
      
      public function send_83077(param1:* = null) : void
      {
         ZLog.add("83077：请求放烟花");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83077,_loc2_);
      }
      
      public function send_83091(param1:* = null) : void
      {
         ZLog.add("83091：请求周一快乐累计充值数量");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83091,_loc2_);
      }
      
      public function send_83093(param1:* = null) : void
      {
         ZLog.add("83093：请求周末热闹累计充值数量");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83093,_loc2_);
      }
      
      public function send_83097(param1:* = null) : void
      {
         ZLog.add("83097：请求特殊累计");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83097,_loc2_);
      }
      
      public function send_83181(param1:* = null) : void
      {
         ZLog.add("83181：请求升阶大回馈数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83181,_loc2_);
      }
      
      public function send_83183(param1:* = null) : void
      {
         ZLog.add("83183：请求升阶大回馈领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(83183,_loc2_);
      }
      
      public function send_83185(param1:* = null) : void
      {
         ZLog.add("83185：请求升阶大回馈礼包领取");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(83185,_loc2_);
      }
      
      public function send_83187(param1:* = null) : void
      {
         ZLog.add("83187：请求当前功法是否激活");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83187,_loc2_);
      }
      
      public function send_83229(param1:* = null) : void
      {
         ZLog.add("83229：请求立冬节");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(83229,_loc2_);
      }
   }
}

