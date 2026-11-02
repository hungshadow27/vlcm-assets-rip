package com.tgame.moudels.twitchGift.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.shengwang.ShengWangGoodManager;
   import com.tgame.common.res.shengwang.ShengWangGoodRes;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.mall.model.vo.MallLunJianGoodsVO;
   import com.tgame.moudels.twitchGift.view.Baoxiang_Mediator;
   import com.tgame.moudels.twitchGift.view.BaseGoldSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.CardNumGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ExpGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.HuangJinBaoXiang_Mediator;
   import com.tgame.moudels.twitchGift.view.Liandanlu_Mediator;
   import com.tgame.moudels.twitchGift.view.MiJiGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.QianChuiBaiLian_Mediator;
   import com.tgame.moudels.twitchGift.view.QianKunGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ShouYuanGongFa_Mediator;
   import com.tgame.moudels.twitchGift.view.SquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.StoneGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.TenStarGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.TreasureMap_Advancefd_Mediator;
   import com.tgame.moudels.twitchGift.view.TreasureMap_Normal_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_ChengJiu_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_KongMingSuo_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_TianJiSuo_Mediator;
   import com.tgame.moudels.twitchGift.view.TwitchGift_WuLiangMiZang_Mediator;
   import com.tgame.moudels.twitchGift.view.XunZhanglu_Mediator;
   import com.tgame.moudels.twitchGift.view.YuanPanGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ZhenQiGoildSquirrelGift_Mediator;
   import com.tgame.moudels.twitchGift.view.ZuanShiBaoXing_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TwitchGift_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TwitchGift_MsgReceivedProxy";
      
      private var _twitchGift_tianJiSuo_Mediator:TwitchGift_TianJiSuo_Mediator;
      
      private var _twitchGift_kongMingSuo_Mediator:TwitchGift_KongMingSuo_Mediator;
      
      private var _twitchGift_WuLiangMiZang_Mediator:TwitchGift_WuLiangMiZang_Mediator;
      
      private var _twitchGift_HuangJinBaoXiang_Mediator:HuangJinBaoXiang_Mediator;
      
      private var _twitchGift_ZuanShiBaoXing_Mediator:ZuanShiBaoXing_Mediator;
      
      private var _twitchGift_chengJiu_Mediator:TwitchGift_ChengJiu_Mediator;
      
      private var _treasureMap_Normal_Mediator:TreasureMap_Normal_Mediator;
      
      private var _treasureMap_Advancefd_Mediator:TreasureMap_Advancefd_Mediator;
      
      private var _squirrelGift_Mediator:SquirrelGift_Mediator;
      
      private var _expGoldSquirrelGift_Mediator:ExpGoildSquirrelGift_Mediator;
      
      private var _stoneGoldSquirrelGift_Mediator:StoneGoildSquirrelGift_Mediator;
      
      private var _tenStarGoldSquirrelGift_Mediator:TenStarGoildSquirrelGift_Mediator;
      
      private var _mijiGoldSquirrelGift_Mediator:MiJiGoildSquirrelGift_Mediator;
      
      private var _zhenQiGoldSquirrelGift_Mediator:ZhenQiGoildSquirrelGift_Mediator;
      
      private var _cardNumGiftMediator:CardNumGift_Mediator;
      
      private var _qianChuiBaiLianMediator:QianChuiBaiLian_Mediator;
      
      private var _qianKunGift_Mediator:QianKunGift_Mediator;
      
      private var _liandanlu_Mediator:Liandanlu_Mediator;
      
      private var _baoxiang_Mediator:Baoxiang_Mediator;
      
      private var _xunzhanglu_Mediator:XunZhanglu_Mediator;
      
      private var _shouYuanGongFa_Mediator:ShouYuanGongFa_Mediator;
      
      private var _yuanPan_Mediator:YuanPanGift_Mediator;
      
      public function TwitchGift_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60102,60104,60108,60100,60112,60116,60118,60120,53102,53104,60122,53502,53504,53506,53508,53510,53512,53516,53518,60124,60126,60128,60130,60132,60134,60136,55002,55022,55016,60142,60144,60146,60148,60138],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60102,60104,60108,60100,60112,60116,60118,60120,53102,53104,60122,53502,53504,53506,53508,53510,53512,53516,53518,60124,60126,60128,60130,60132,60134,60136,55002,55022,55016,60142,60144,60146,60148,60138],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_60100(param1:ByteArray) : void
      {
         this.received_60102_and_60100(param1);
      }
      
      public function received_60102(param1:ByteArray) : void
      {
         this.received_60102_and_60100(param1);
      }
      
      private function received_60102_and_60100(param1:ByteArray) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:Goods = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Goods = null;
         var _loc20_:BaseGoldSquirrelGift_Mediator = null;
         ZLog.add("60102：奖池数据");
         if(param1.length == 0)
         {
            return;
         }
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,param1.readUTF());
         }
         else
         {
            _loc3_ = false;
            _loc4_ = [];
            _loc5_ = [];
            _loc6_ = param1.readByte();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc17_ = param1.readInt();
               _loc18_ = param1.readInt();
               _loc19_ = new Goods(_loc17_);
               if(_loc17_ == _loc18_ && _loc18_ == 0)
               {
                  _loc3_ = true;
               }
               _loc4_.push(_loc19_);
               _loc19_.roleID = -100;
               _loc19_.position = _loc18_;
               _loc19_.quality = param1.readInt();
               _loc19_.count = param1.readShort();
               _loc19_.isJiPin = param1.readByte();
               _loc5_.push(_loc18_);
               _loc7_++;
            }
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = param1.readInt();
            _loc11_ = param1.readShort();
            _loc12_ = param1.readByte();
            _loc13_ = _loc5_.indexOf(_loc9_) + 1;
            _loc14_ = param1.readInt();
            if(_loc14_ == SpecialGoodsID.TIAN_JI_SUO)
            {
               _loc15_ = LanResManager.getLanTextWords(this,"天机锁");
               this.twitchGift_tianJiSuo_Mediator.showPanel();
               this.twitchGift_tianJiSuo_Mediator.giftID = _loc14_;
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.twitchGift_tianJiSuo_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.twitchGift_tianJiSuo_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.KONG_MING_SUO)
            {
               _loc15_ = LanResManager.getLanTextWords(this,"孔明锁");
               this.twitchGift_kongMingSuo_Mediator.showPanel();
               this.twitchGift_kongMingSuo_Mediator.giftID = _loc14_;
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.twitchGift_kongMingSuo_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.twitchGift_kongMingSuo_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.WU_LIANG_MI_ZANG)
            {
               _loc15_ = LanResManager.getLanCommonTextWords("无量秘蔵");
               this.twitchGift_WuLiangMiZang_Mediator.setWuliangMizang();
               this.twitchGift_WuLiangMiZang_Mediator.showPanel();
               this.twitchGift_WuLiangMiZang_Mediator.giftID = _loc14_;
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.twitchGift_WuLiangMiZang_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.twitchGift_WuLiangMiZang_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.HUANGJINBAOXIANG)
            {
               _loc15_ = LanResManager.getLanCommonTextWords("紫金宝箱");
               this.twitchGift_HuangJinBaoXiang_Mediator.setWuliangMizang();
               this.twitchGift_HuangJinBaoXiang_Mediator.showPanel();
               this.twitchGift_HuangJinBaoXiang_Mediator.giftID = _loc14_;
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.twitchGift_HuangJinBaoXiang_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.twitchGift_HuangJinBaoXiang_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.ZUANSHIBAOXIANG)
            {
               _loc15_ = LanResManager.getLanCommonTextWords("钻石宝箱");
               this.twitchGift_ZuanShiBaoXing_Mediator.setWuliangMizang();
               this.twitchGift_ZuanShiBaoXing_Mediator.showPanel();
               this.twitchGift_ZuanShiBaoXing_Mediator.giftID = _loc14_;
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.twitchGift_ZuanShiBaoXing_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.twitchGift_ZuanShiBaoXing_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.CHENG_JIU_LI_HE)
            {
               _loc15_ = LanResManager.getLanTextWords(this,"成就礼盒");
               this.twitchGift_chengJiu_Mediator.showPanel();
               this.twitchGift_chengJiu_Mediator.giftID = _loc14_;
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.twitchGift_chengJiu_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.twitchGift_chengJiu_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.NORMAL_TREASURE_MAP)
            {
               _loc15_ = LanResManager.getLanCommonTextWords("普通");
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.treasureMap_Normal_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.treasureMap_Normal_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.ADVANCEFD_TREASURE_MAP)
            {
               _loc15_ = LanResManager.getLanCommonTextWords("珍稀");
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.treasureMap_Advancefd_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.treasureMap_Advancefd_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.PINE_NUTS_BLUE || _loc14_ == SpecialGoodsID.PINE_NUTS_GREEN || _loc14_ == SpecialGoodsID.PINE_NUTS_PURPLE)
            {
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_BLUE)
               {
                  _loc15_ = LanResManager.getLanCommonTextWords("蓝榛子");
               }
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_GREEN)
               {
                  _loc15_ = LanResManager.getLanCommonTextWords("绿榛子");
               }
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_PURPLE)
               {
                  _loc15_ = LanResManager.getLanCommonTextWords("紫榛子");
               }
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.squirrelGift_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.squirrelGift_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == SpecialGoodsID.PINE_NUTS_EXP_GOLD || _loc14_ == SpecialGoodsID.PINE_NUTS_MIJI_GOLD || _loc14_ == SpecialGoodsID.PINE_NUTS_STONE_GOLD || _loc14_ == SpecialGoodsID.PINE_NUTS_ZHENQI_GOLD || _loc14_ == SpecialGoodsID.PINE_NUTS_TEN_STAR_GOLD)
            {
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_EXP_GOLD)
               {
                  _loc15_ = LanResManager.getLanTextWords(this,"经验金松果");
                  _loc20_ = this.expGoldSquirrelGift_Mediator;
               }
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_MIJI_GOLD)
               {
                  _loc15_ = LanResManager.getLanTextWords(this,"秘籍金松果");
                  _loc20_ = this.mijiGoldSquirrelGift_Mediator;
               }
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_STONE_GOLD)
               {
                  _loc15_ = LanResManager.getLanTextWords(this,"宝石金松果");
                  _loc20_ = this.stoneGoldSquirrelGift_Mediator;
               }
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_ZHENQI_GOLD)
               {
                  _loc15_ = LanResManager.getLanTextWords(this,"真气金松果");
                  _loc20_ = this.zhenQiGoldSquirrelGift_Mediator;
               }
               if(_loc14_ == SpecialGoodsID.PINE_NUTS_TEN_STAR_GOLD)
               {
                  _loc15_ = LanResManager.getLanTextWords(this,"十星紫装金松果");
                  _loc20_ = this.tenStarGoldSquirrelGift_Mediator;
               }
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  _loc20_.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               _loc20_.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
            if(_loc14_ == 3301 || _loc14_ == 3302)
            {
               _loc14_ = 3301;
               _loc15_ = LanResManager.getLanCommonTextWords("兽元武学");
               this.shouYuanGongFa_Mediator.showPanel(true);
               this.shouYuanGongFa_Mediator.giftID = _loc14_;
               this.shouYuanGongFa_Mediator.setShouYuanGongFa();
               if(_loc3_)
               {
                  _loc16_ = new Goods(_loc8_);
                  _loc16_.position = _loc9_;
                  _loc16_.roleID = -100;
                  _loc16_.quality = _loc10_;
                  _loc16_.count = _loc11_;
                  _loc16_.isJiPin = _loc12_;
                  this.shouYuanGongFa_Mediator.getLostGift(_loc16_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
                  return;
               }
               this.shouYuanGongFa_Mediator.getGift(_loc4_,_loc13_,_loc2_ == 1 ? false : true,_loc14_,_loc15_);
            }
         }
      }
      
      public function received_60104(param1:ByteArray) : void
      {
         ZLog.add("60104：开始转圈");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         if(this.twitchGift_tianJiSuo_Mediator.giftID == _loc3_)
         {
            this.twitchGift_tianJiSuo_Mediator.startTwitchGiftPlayer(_loc2_);
         }
         if(this.twitchGift_kongMingSuo_Mediator.giftID == _loc3_)
         {
            this.twitchGift_kongMingSuo_Mediator.startTwitchGiftPlayer(_loc2_);
         }
         if(this.twitchGift_chengJiu_Mediator.giftID == _loc3_)
         {
            this.twitchGift_chengJiu_Mediator.startTwitchGiftPlayer(_loc2_);
         }
         if(this.twitchGift_WuLiangMiZang_Mediator.giftID == _loc3_)
         {
            this.twitchGift_WuLiangMiZang_Mediator.startTwitchGiftPlayer(_loc2_);
         }
         if(this.twitchGift_HuangJinBaoXiang_Mediator.giftID == _loc3_)
         {
            this.twitchGift_HuangJinBaoXiang_Mediator.startTwitchGiftPlayer(_loc2_);
         }
         if(this.twitchGift_ZuanShiBaoXing_Mediator.giftID == _loc3_)
         {
            this.twitchGift_ZuanShiBaoXing_Mediator.startTwitchGiftPlayer(_loc2_);
         }
         if(this.shouYuanGongFa_Mediator.giftType == _loc3_)
         {
            this.shouYuanGongFa_Mediator.startTwitchGiftPlayer(_loc2_);
         }
      }
      
      public function received_60108(param1:ByteArray) : void
      {
         ZLog.add("60108：不能再次抽奖");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         if(_loc2_ == 0 && this.twitchGift_tianJiSuo_Mediator.giftID == _loc3_)
         {
            this.twitchGift_tianJiSuo_Mediator.nought();
         }
         if(_loc2_ == 0 && this.twitchGift_WuLiangMiZang_Mediator.giftID == _loc3_)
         {
            this.twitchGift_WuLiangMiZang_Mediator.nought();
         }
         if(_loc2_ == 0 && this.twitchGift_HuangJinBaoXiang_Mediator.giftID == _loc3_)
         {
            this.twitchGift_HuangJinBaoXiang_Mediator.nought();
         }
         if(_loc2_ == 0 && this.twitchGift_ZuanShiBaoXing_Mediator.giftID == _loc3_)
         {
            this.twitchGift_ZuanShiBaoXing_Mediator.nought();
         }
         if(_loc2_ == 0 && this.twitchGift_kongMingSuo_Mediator.giftID == _loc3_)
         {
            this.twitchGift_kongMingSuo_Mediator.nought();
         }
         if(_loc2_ == 0 && this.twitchGift_chengJiu_Mediator.giftID == _loc3_)
         {
            this.twitchGift_chengJiu_Mediator.nought();
         }
         if(_loc2_ == 0 && this.treasureMap_Normal_Mediator.giftID == _loc3_)
         {
            this.treasureMap_Normal_Mediator.nought();
         }
         if(_loc2_ == 0 && this.treasureMap_Advancefd_Mediator.giftID == _loc3_)
         {
            this.treasureMap_Advancefd_Mediator.nought();
         }
         if(_loc2_ == 0 && _loc3_ == SpecialGoodsID.PINE_NUTS_BLUE || _loc3_ == SpecialGoodsID.PINE_NUTS_GREEN || _loc3_ == SpecialGoodsID.PINE_NUTS_PURPLE)
         {
            this.squirrelGift_Mediator.nought();
         }
         if(_loc2_ == 0 && _loc3_ == SpecialGoodsID.PINE_NUTS_EXP_GOLD)
         {
            this.expGoldSquirrelGift_Mediator.nought();
         }
         if(_loc2_ == 0 && _loc3_ == SpecialGoodsID.PINE_NUTS_MIJI_GOLD)
         {
            this.zhenQiGoldSquirrelGift_Mediator.nought();
         }
         if(_loc2_ == 0 && _loc3_ == SpecialGoodsID.PINE_NUTS_STONE_GOLD)
         {
            this.mijiGoldSquirrelGift_Mediator.nought();
         }
         if(_loc2_ == 0 && _loc3_ == SpecialGoodsID.PINE_NUTS_ZHENQI_GOLD)
         {
            this.stoneGoldSquirrelGift_Mediator.nought();
         }
         if(_loc2_ == 0 && _loc3_ == SpecialGoodsID.PINE_NUTS_TEN_STAR_GOLD)
         {
            this.tenStarGoldSquirrelGift_Mediator.nought();
         }
      }
      
      public function received_60112(param1:ByteArray) : void
      {
         ZLog.add("60112：得到铲子数");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         if(_loc3_ == SpecialGoodsID.NORMAL_TREASURE_MAP)
         {
            this.treasureMap_Normal_Mediator.giftID = _loc3_;
            this.treasureMap_Normal_Mediator.setShove(_loc2_,LanResManager.getLanCommonTextWords("普通"));
            this.treasureMap_Normal_Mediator.showPanel();
         }
         if(_loc3_ == SpecialGoodsID.ADVANCEFD_TREASURE_MAP)
         {
            this.treasureMap_Advancefd_Mediator.giftID = _loc3_;
            this.treasureMap_Advancefd_Mediator.setShove(_loc2_,LanResManager.getLanCommonTextWords("珍稀"));
            this.treasureMap_Advancefd_Mediator.showPanel();
         }
         if(_loc3_ == SpecialGoodsID.PINE_NUTS_BLUE || _loc3_ == SpecialGoodsID.PINE_NUTS_GREEN || _loc3_ == SpecialGoodsID.PINE_NUTS_PURPLE)
         {
            this.squirrelGift_Mediator.setSongZi(true,false,_loc3_);
         }
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc3_,true);
         if(_loc3_ == SpecialGoodsID.PINE_NUTS_EXP_GOLD)
         {
            this.expGoldSquirrelGift_Mediator.setSongZi(true,true,_loc4_);
         }
         if(_loc3_ == SpecialGoodsID.PINE_NUTS_MIJI_GOLD)
         {
            this.zhenQiGoldSquirrelGift_Mediator.setSongZi(true,true,_loc4_);
         }
         if(_loc3_ == SpecialGoodsID.PINE_NUTS_STONE_GOLD)
         {
            this.mijiGoldSquirrelGift_Mediator.setSongZi(true,true,_loc4_);
         }
         if(_loc3_ == SpecialGoodsID.PINE_NUTS_ZHENQI_GOLD)
         {
            this.stoneGoldSquirrelGift_Mediator.setSongZi(true,true,_loc4_);
         }
         if(_loc3_ == SpecialGoodsID.PINE_NUTS_TEN_STAR_GOLD)
         {
            this.tenStarGoldSquirrelGift_Mediator.setSongZi(true,true,_loc4_);
         }
      }
      
      public function received_60118(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("60112：友好度返回");
         var _loc2_:int = param1.readInt();
         _loc3_ = param1.readShort();
         _loc4_ = param1.readShort();
         _loc5_ = param1.readShort();
         _loc6_ = param1.readShort();
         _loc7_ = param1.readShort();
         this.squirrelGift_Mediator.setFriendVilue([_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_]);
      }
      
      public function received_60116(param1:ByteArray) : void
      {
         ZLog.add("60112：得到祝福值");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readShort();
         _loc3_ = _loc3_ > 3000 ? 3000 : _loc3_;
         this.squirrelGift_Mediator.setZhuFuNum(_loc2_,_loc3_);
      }
      
      public function received_60120(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("60120：服务器端收到使用物品为进松果后返回");
         var _loc2_:int = param1.readShort();
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc2_);
         if(_loc3_.id == SpecialGoodsID.PINE_NUTS_EXP_GOLD)
         {
            _loc4_ = LanResManager.getLanTextWords(this,"经验金松果");
            this.expGoldSquirrelGift_Mediator.showPanel(_loc3_,_loc4_);
         }
         if(_loc3_.id == SpecialGoodsID.PINE_NUTS_ZHENQI_GOLD)
         {
            _loc4_ = LanResManager.getLanTextWords(this,"真气金松果");
            this.zhenQiGoldSquirrelGift_Mediator.showPanel(_loc3_,_loc4_);
         }
         if(_loc3_.id == SpecialGoodsID.PINE_NUTS_MIJI_GOLD)
         {
            _loc4_ = LanResManager.getLanTextWords(this,"秘籍金松果");
            this.mijiGoldSquirrelGift_Mediator.showPanel(_loc3_,_loc4_);
         }
         if(_loc3_.id == SpecialGoodsID.PINE_NUTS_STONE_GOLD)
         {
            _loc4_ = LanResManager.getLanTextWords(this,"宝石金松果");
            this.stoneGoldSquirrelGift_Mediator.showPanel(_loc3_,_loc4_);
         }
         if(_loc3_.id == SpecialGoodsID.PINE_NUTS_TEN_STAR_GOLD)
         {
            _loc4_ = LanResManager.getLanTextWords(this,"十星紫装金松果");
            this.tenStarGoldSquirrelGift_Mediator.showPanel(_loc3_,_loc4_);
         }
      }
      
      public function received_60122(param1:ByteArray) : void
      {
         ZLog.add("60122：返回是否有未领取的奖品");
         var _loc2_:int = param1.readInt();
         if(_loc2_ == 0)
         {
            return;
         }
         if(_loc2_ == SpecialGoodsID.XUANZHUANSHI || _loc2_ == SpecialGoodsID.XUANZHUANSHI2 || _loc2_ == SpecialGoodsID.QUANXIN_XUANZHUANSHI2)
         {
            if(!Fun.isVisible(GameInstance.uiInstance._yuanPanGiftPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_YUANPAN_PANEL,_loc2_);
            }
            return;
         }
         if(_loc2_ == SpecialGoodsID.WU_LIANG_MI_ZANG)
         {
            this.twitchGift_WuLiangMiZang_Mediator.setNewPlayerGuide(_loc2_);
            return;
         }
         if(_loc2_ == SpecialGoodsID.HUANGJINBAOXIANG)
         {
            this.twitchGift_HuangJinBaoXiang_Mediator.setNewPlayerGuide(_loc2_);
            return;
         }
         if(_loc2_ == SpecialGoodsID.ZUANSHIBAOXIANG)
         {
            this.twitchGift_ZuanShiBaoXing_Mediator.setNewPlayerGuide(_loc2_);
            return;
         }
         if(_loc2_ == SpecialGoodsID.KONG_MING_SUO)
         {
            this.twitchGift_WuLiangMiZang_Mediator.setNewPlayerGuide(_loc2_);
            return;
         }
         this.squirrelGift_Mediator.setNewPlayerGuide(_loc2_);
      }
      
      private function get twitchGift_tianJiSuo_Mediator() : TwitchGift_TianJiSuo_Mediator
      {
         if(!this._twitchGift_tianJiSuo_Mediator)
         {
            this._twitchGift_tianJiSuo_Mediator = facade.retrieveMediator(TwitchGift_TianJiSuo_Mediator.NAME) as TwitchGift_TianJiSuo_Mediator;
         }
         return this._twitchGift_tianJiSuo_Mediator;
      }
      
      private function get twitchGift_kongMingSuo_Mediator() : TwitchGift_KongMingSuo_Mediator
      {
         if(!this._twitchGift_kongMingSuo_Mediator)
         {
            this._twitchGift_kongMingSuo_Mediator = facade.retrieveMediator(TwitchGift_KongMingSuo_Mediator.NAME) as TwitchGift_KongMingSuo_Mediator;
         }
         return this._twitchGift_kongMingSuo_Mediator;
      }
      
      private function get twitchGift_WuLiangMiZang_Mediator() : TwitchGift_WuLiangMiZang_Mediator
      {
         if(!this._twitchGift_WuLiangMiZang_Mediator)
         {
            this._twitchGift_WuLiangMiZang_Mediator = facade.retrieveMediator(TwitchGift_WuLiangMiZang_Mediator.NAME) as TwitchGift_WuLiangMiZang_Mediator;
         }
         return this._twitchGift_WuLiangMiZang_Mediator;
      }
      
      private function get twitchGift_HuangJinBaoXiang_Mediator() : HuangJinBaoXiang_Mediator
      {
         if(!this._twitchGift_HuangJinBaoXiang_Mediator)
         {
            this._twitchGift_HuangJinBaoXiang_Mediator = facade.retrieveMediator(HuangJinBaoXiang_Mediator.NAME) as HuangJinBaoXiang_Mediator;
         }
         return this._twitchGift_HuangJinBaoXiang_Mediator;
      }
      
      private function get twitchGift_ZuanShiBaoXing_Mediator() : ZuanShiBaoXing_Mediator
      {
         if(!this._twitchGift_ZuanShiBaoXing_Mediator)
         {
            this._twitchGift_ZuanShiBaoXing_Mediator = facade.retrieveMediator(ZuanShiBaoXing_Mediator.NAME) as ZuanShiBaoXing_Mediator;
         }
         return this._twitchGift_ZuanShiBaoXing_Mediator;
      }
      
      private function get twitchGift_chengJiu_Mediator() : TwitchGift_ChengJiu_Mediator
      {
         if(!this._twitchGift_chengJiu_Mediator)
         {
            this._twitchGift_chengJiu_Mediator = facade.retrieveMediator(TwitchGift_ChengJiu_Mediator.NAME) as TwitchGift_ChengJiu_Mediator;
         }
         return this._twitchGift_chengJiu_Mediator;
      }
      
      private function get treasureMap_Normal_Mediator() : TreasureMap_Normal_Mediator
      {
         if(!this._treasureMap_Normal_Mediator)
         {
            this._treasureMap_Normal_Mediator = facade.retrieveMediator(TreasureMap_Normal_Mediator.NAME) as TreasureMap_Normal_Mediator;
         }
         return this._treasureMap_Normal_Mediator;
      }
      
      private function get treasureMap_Advancefd_Mediator() : TreasureMap_Advancefd_Mediator
      {
         if(!this._treasureMap_Advancefd_Mediator)
         {
            this._treasureMap_Advancefd_Mediator = facade.retrieveMediator(TreasureMap_Advancefd_Mediator.NAME) as TreasureMap_Advancefd_Mediator;
         }
         return this._treasureMap_Advancefd_Mediator;
      }
      
      private function get squirrelGift_Mediator() : SquirrelGift_Mediator
      {
         if(!this._squirrelGift_Mediator)
         {
            this._squirrelGift_Mediator = facade.retrieveMediator(SquirrelGift_Mediator.NAME) as SquirrelGift_Mediator;
         }
         return this._squirrelGift_Mediator;
      }
      
      private function get expGoldSquirrelGift_Mediator() : ExpGoildSquirrelGift_Mediator
      {
         if(!this._expGoldSquirrelGift_Mediator)
         {
            this._expGoldSquirrelGift_Mediator = facade.retrieveMediator(ExpGoildSquirrelGift_Mediator.NAME) as ExpGoildSquirrelGift_Mediator;
         }
         return this._expGoldSquirrelGift_Mediator;
      }
      
      private function get stoneGoldSquirrelGift_Mediator() : StoneGoildSquirrelGift_Mediator
      {
         if(!this._stoneGoldSquirrelGift_Mediator)
         {
            this._stoneGoldSquirrelGift_Mediator = facade.retrieveMediator(StoneGoildSquirrelGift_Mediator.NAME) as StoneGoildSquirrelGift_Mediator;
         }
         return this._stoneGoldSquirrelGift_Mediator;
      }
      
      private function get tenStarGoldSquirrelGift_Mediator() : TenStarGoildSquirrelGift_Mediator
      {
         if(!this._tenStarGoldSquirrelGift_Mediator)
         {
            this._tenStarGoldSquirrelGift_Mediator = facade.retrieveMediator(TenStarGoildSquirrelGift_Mediator.NAME) as TenStarGoildSquirrelGift_Mediator;
         }
         return this._tenStarGoldSquirrelGift_Mediator;
      }
      
      private function get mijiGoldSquirrelGift_Mediator() : MiJiGoildSquirrelGift_Mediator
      {
         if(!this._mijiGoldSquirrelGift_Mediator)
         {
            this._mijiGoldSquirrelGift_Mediator = facade.retrieveMediator(MiJiGoildSquirrelGift_Mediator.NAME) as MiJiGoildSquirrelGift_Mediator;
         }
         return this._mijiGoldSquirrelGift_Mediator;
      }
      
      private function get zhenQiGoldSquirrelGift_Mediator() : ZhenQiGoildSquirrelGift_Mediator
      {
         if(!this._zhenQiGoldSquirrelGift_Mediator)
         {
            this._zhenQiGoldSquirrelGift_Mediator = facade.retrieveMediator(ZhenQiGoildSquirrelGift_Mediator.NAME) as ZhenQiGoildSquirrelGift_Mediator;
         }
         return this._zhenQiGoldSquirrelGift_Mediator;
      }
      
      private function get cardNumGiftMediator() : CardNumGift_Mediator
      {
         if(!this._cardNumGiftMediator)
         {
            this._cardNumGiftMediator = facade.retrieveMediator(CardNumGift_Mediator.NAME) as CardNumGift_Mediator;
         }
         return this._cardNumGiftMediator;
      }
      
      private function get qianChuiBaiLianMediator() : QianChuiBaiLian_Mediator
      {
         if(!this._qianChuiBaiLianMediator)
         {
            this._qianChuiBaiLianMediator = facade.retrieveMediator(QianChuiBaiLian_Mediator.NAME) as QianChuiBaiLian_Mediator;
         }
         return this._qianChuiBaiLianMediator;
      }
      
      private function get qianKunGift_Mediator() : QianKunGift_Mediator
      {
         if(!this._qianKunGift_Mediator)
         {
            this._qianKunGift_Mediator = facade.retrieveMediator(QianKunGift_Mediator.NAME) as QianKunGift_Mediator;
         }
         return this._qianKunGift_Mediator;
      }
      
      private function get liandanlu_Mediator() : Liandanlu_Mediator
      {
         if(!this._liandanlu_Mediator)
         {
            this._liandanlu_Mediator = facade.retrieveMediator(Liandanlu_Mediator.NAME) as Liandanlu_Mediator;
         }
         return this._liandanlu_Mediator;
      }
      
      private function get baoxiang_Mediator() : Baoxiang_Mediator
      {
         if(!this._baoxiang_Mediator)
         {
            this._baoxiang_Mediator = facade.retrieveMediator(Baoxiang_Mediator.NAME) as Baoxiang_Mediator;
         }
         return this._baoxiang_Mediator;
      }
      
      private function get xunzhanglu_Mediator() : XunZhanglu_Mediator
      {
         if(!this._xunzhanglu_Mediator)
         {
            this._xunzhanglu_Mediator = facade.retrieveMediator(XunZhanglu_Mediator.NAME) as XunZhanglu_Mediator;
         }
         return this._xunzhanglu_Mediator;
      }
      
      private function get shouYuanGongFa_Mediator() : ShouYuanGongFa_Mediator
      {
         if(!this._shouYuanGongFa_Mediator)
         {
            this._shouYuanGongFa_Mediator = facade.retrieveMediator(ShouYuanGongFa_Mediator.NAME) as ShouYuanGongFa_Mediator;
         }
         return this._shouYuanGongFa_Mediator;
      }
      
      public function received_53102(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         ZLog.add("53102：得到兑换礼品信息");
         var _loc2_:Object = new Object();
         _loc2_.copper = param1.readInt();
         _loc2_.lijin = param1.readInt();
         _loc2_.yuanbao = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc5_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readShort();
            _loc8_ = new Goods(_loc6_);
            _loc8_.count = _loc7_;
            _loc5_.push(_loc8_);
            _loc4_++;
         }
         _loc2_.goodsArr = _loc5_;
         this.cardNumGiftMediator.setGiftInfo(_loc2_);
      }
      
      public function received_53104(param1:ByteArray) : void
      {
         ZLog.add("53104：兑换礼品成功信息");
         this.cardNumGiftMediator.reset();
      }
      
      public function received_53502(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Goods = null;
         ZLog.add("53502：铅垂百炼打开面板查询状态返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         if(_loc2_ != 0)
         {
            if(_loc2_ != 1)
            {
               _loc6_ = param1.readByte();
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc9_ = param1.readInt();
                  _loc10_ = param1.readInt();
                  _loc11_ = new Goods(_loc9_);
                  _loc3_.push(_loc11_);
                  _loc11_.roleID = -100;
                  _loc11_.position = _loc10_;
                  _loc11_.quality = param1.readInt();
                  _loc11_.isJiPin = param1.readByte();
                  _loc4_.push(_loc10_);
                  _loc7_++;
               }
               param1.readInt();
               _loc8_ = param1.readInt();
               _loc5_ = _loc4_.indexOf(_loc8_) + 1;
            }
         }
         this.qianChuiBaiLianMediator.setPanelOpenStatus(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_53504(param1:ByteArray) : void
      {
         ZLog.add("53504：千锤百炼装备规则查询返回");
         var _loc2_:int = param1.readShort();
         var _loc3_:String = param1.readUTF();
         this.qianChuiBaiLianMediator.setGaiLv(_loc2_,_loc3_);
      }
      
      public function received_53506(param1:ByteArray) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Goods = null;
         ZLog.add("53506：千锤百炼装备合成返回");
         var _loc2_:int = param1.readByte();
         _loc3_ = [];
         _loc4_ = [];
         if(_loc2_ == 0)
         {
            this.qianChuiBaiLianMediator.isEquipUpDataOk(-1,_loc7_,_loc3_,_loc5_);
            return;
         }
         _loc6_ = param1.readByte();
         if(_loc6_ == 1)
         {
            _loc7_ = param1.readShort();
         }
         if(this.qianChuiBaiLianMediator.getUseChuiZiColor() == 3003)
         {
            this.qianChuiBaiLianMediator.isEquipUpDataOk(_loc6_,_loc7_,null,0);
            return;
         }
         this.qianChuiBaiLianMediator.isEquipUpDataOk(_loc6_,_loc7_,null,0);
      }
      
      public function received_53508(param1:ByteArray) : void
      {
         ZLog.add("53508：千垂百炼领取实物奖励返回");
         var _loc2_:int = param1.readByte();
         this.qianChuiBaiLianMediator.upDataAndGiftComplete(_loc2_);
      }
      
      public function received_53510(param1:ByteArray) : void
      {
         ZLog.add("53510：千垂百炼领取实物奖励返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:Number = param1.readDouble();
         this.qianChuiBaiLianMediator.setGiftNum(_loc2_,_loc3_);
      }
      
      public function received_53512(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("53512：千锤百炼返回历练值");
         var _loc2_:int = param1.readInt();
         _loc3_ = param1.readShort();
         _loc4_ = param1.readShort();
         _loc5_ = param1.readShort();
         _loc6_ = param1.readShort();
         _loc7_ = param1.readShort();
         this.qianChuiBaiLianMediator.setFriendVilue([_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_]);
      }
      
      public function received_53516(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("53516：锤子奖励查询返回");
         _loc2_ = param1.readInt();
         _loc3_ = param1.readDouble();
         _loc4_ = param1.readUTF();
         _loc5_ = param1.readInt();
         _loc6_ = param1.readInt();
         _loc7_ = param1.readShort();
         _loc8_ = param1.readShort();
         this.qianChuiBaiLianMediator.setGiftNum(_loc2_,_loc3_);
         this.qianChuiBaiLianMediator.setGift(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_53518(param1:ByteArray) : void
      {
         ZLog.add("53518：声望商店购买查询");
         var _loc2_:MallLunJianGoodsVO = new MallLunJianGoodsVO();
         _loc2_.mallID = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Goods = new Goods(_loc3_);
         _loc2_.goods = _loc4_;
         _loc2_.shengWangType = param1.readByte();
         _loc2_.shengWang = param1.readInt();
         var _loc5_:ShengWangGoodRes = ShengWangGoodManager.getShengWangGoods(_loc2_.mallID);
         if(_loc5_)
         {
            _loc2_.desc = _loc5_.desc;
            _loc2_.use_desc = _loc5_.use_desc;
         }
         else
         {
            _loc2_.desc = "";
         }
         this.qianChuiBaiLianMediator.setMallLunJianGoodsVO(_loc2_);
      }
      
      public function received_60124(param1:ByteArray) : void
      {
         ZLog.add("60124：知客户端弹出乾坤卡牌模式选择界面");
         var _loc2_:int = param1.readInt();
         this.qianKunGift_Mediator.reveived_openSelectPanel(_loc2_);
      }
      
      public function received_60126(param1:ByteArray) : void
      {
         var _loc11_:Goods = null;
         var _loc12_:int = 0;
         ZLog.add("60126：乾坤卡牌奖池数据返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc11_ = new Goods(param1.readInt());
            _loc11_.roleID = -111;
            _loc11_.count = param1.readShort();
            _loc11_.quality = param1.readByte();
            _loc11_.isJiPin = param1.readByte();
            _loc11_.position = param1.readInt();
            _loc12_ = param1.readByte();
            _loc5_[_loc5_.length] = {
               "goods":_loc11_,
               "color":_loc12_
            };
            _loc6_++;
         }
         var _loc7_:int = param1.readByte();
         var _loc8_:String = param1.readUTF();
         var _loc9_:int = param1.readByte();
         var _loc10_:int = param1.readByte();
         this.qianKunGift_Mediator.reveived_AllGiftData(_loc2_,_loc3_,_loc5_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_60128(param1:ByteArray) : void
      {
         ZLog.add("60128：翻牌结果");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Goods = new Goods(param1.readInt());
         _loc5_.roleID = -111;
         _loc5_.count = param1.readShort();
         _loc5_.quality = param1.readByte();
         _loc5_.isJiPin = param1.readByte();
         _loc5_.position = param1.readInt();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readByte();
         var _loc9_:int = param1.readShort();
         var _loc10_:Boolean = param1.readByte() == 0 ? false : true;
         this.qianKunGift_Mediator.receive_GiftResult(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_60130(param1:ByteArray) : void
      {
         var _loc8_:Goods = null;
         var _loc9_:int = 0;
         ZLog.add("60130：返回剩余奖池数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc8_ = new Goods(param1.readInt());
            _loc8_.roleID = -111;
            _loc8_.count = param1.readShort();
            _loc8_.quality = param1.readByte();
            _loc8_.isJiPin = param1.readByte();
            _loc8_.position = param1.readInt();
            _loc9_ = param1.readByte();
            _loc5_[_loc5_.length] = {
               "goods":_loc8_,
               "color":_loc9_
            };
            _loc6_++;
         }
         var _loc7_:int = param1.readByte();
         this.qianKunGift_Mediator.reveived_OverGiftResult(_loc2_,_loc3_,_loc5_,_loc7_);
      }
      
      public function received_60132(param1:ByteArray) : void
      {
         var _loc9_:Goods = null;
         var _loc10_:int = 0;
         ZLog.add("60132：返回各种幻境奖池数据及中奖结果");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc9_ = new Goods(param1.readInt());
            _loc9_.roleID = -111;
            _loc9_.count = param1.readShort();
            _loc9_.quality = param1.readByte();
            _loc9_.isJiPin = param1.readByte();
            _loc9_.position = param1.readInt();
            _loc10_ = param1.readByte();
            _loc5_[_loc5_.length] = {
               "goods":_loc9_,
               "color":_loc10_
            };
            _loc6_++;
         }
         var _loc7_:Goods = new Goods(param1.readInt());
         _loc7_.roleID = -111;
         _loc7_.quality = param1.readByte();
         _loc7_.isJiPin = param1.readByte();
         _loc7_.position = param1.readInt();
         var _loc8_:int = param1.readByte();
         this.qianKunGift_Mediator.received_OtherGiftResult(_loc2_,_loc3_,_loc5_,_loc7_,_loc8_);
      }
      
      public function received_60136(param1:ByteArray) : void
      {
         var _loc7_:Goods = null;
         var _loc8_:int = 0;
         ZLog.add("60136：返回有未领取的奖励");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new Goods(param1.readInt());
            _loc7_.roleID = -111;
            _loc7_.count = param1.readShort();
            _loc7_.quality = param1.readByte();
            _loc7_.isJiPin = param1.readByte();
            _loc7_.position = param1.readInt();
            _loc8_ = param1.readByte();
            _loc5_[_loc5_.length] = {
               "goods":_loc7_,
               "color":_loc8_
            };
            _loc6_++;
         }
         this.qianKunGift_Mediator.received_hasWeiLingGoods(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_60134(param1:ByteArray) : void
      {
         ZLog.add("60134：领取乾坤一掷奖品返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readByte();
         this.qianKunGift_Mediator.received_OtherGetGiftComplete(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_55002(param1:ByteArray) : void
      {
         ZLog.add("55002：返回打开炼丹炉");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         this.liandanlu_Mediator.setData(_loc3_,_loc4_);
      }
      
      public function received_55022(param1:ByteArray) : void
      {
         ZLog.add("55022：返回打开宝箱");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.baoxiang_Mediator.setData(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_55016(param1:* = null) : void
      {
         ZLog.add("55016：返回打开最终勋章炉");
         var _loc2_:int = int(param1.readInt());
         this.xunzhanglu_Mediator.showPanel(_loc2_);
      }
      
      private function get yuanPan_Mediator() : YuanPanGift_Mediator
      {
         if(!this._yuanPan_Mediator)
         {
            this._yuanPan_Mediator = facade.retrieveMediator(YuanPanGift_Mediator.NAME) as YuanPanGift_Mediator;
         }
         return this._yuanPan_Mediator;
      }
      
      public function received_60142(param1:* = null) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Object = null;
         ZLog.add("60142：返回转盘面板初始化消息");
         var _loc2_:int = int(param1.readInt());
         var _loc3_:int = int(param1.readInt());
         var _loc4_:Array = new Array();
         var _loc5_:* = 0;
         while(_loc5_ < _loc3_)
         {
            _loc9_ = new Object();
            _loc9_.goodId = param1.readInt();
            _loc9_.id = param1.readInt();
            _loc4_.push(_loc9_);
            _loc5_++;
         }
         var _loc6_:Boolean = param1.readByte() == 1 ? true : false;
         if(_loc6_)
         {
            _loc7_ = int(param1.readInt());
            _loc8_ = int(param1.readInt());
         }
         this.yuanPan_Mediator.setData(_loc2_,_loc4_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_60144(param1:* = null) : void
      {
         ZLog.add("60144：转盘旋转请求返回");
         var _loc2_:int = int(param1.readInt());
         var _loc3_:* = param1.readInt();
         var _loc4_:int = int(param1.readInt());
         this.yuanPan_Mediator.setResult(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_60146(param1:* = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         ZLog.add("60146：转盘领取奖励返回");
         var _loc2_:Boolean = param1.readInt() == 1;
         if(_loc2_)
         {
            _loc3_ = int(param1.readInt());
            _loc4_ = int(param1.readInt());
            this.yuanPan_Mediator.getGoods(_loc3_,_loc4_);
         }
      }
      
      public function received_60148(param1:ByteArray = null) : void
      {
         ZLog.add("60148：返回对应龙元id的幸运值");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         this.shouYuanGongFa_Mediator.setXingYunZhi(_loc3_,_loc4_);
      }
      
      public function received_60138(param1:ByteArray = null) : void
      {
         ZLog.add("60138：龙元领奖返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         if(_loc4_ == 3)
         {
            this.shouYuanGongFa_Mediator.showPanel(false);
            PipeManager.sendMsg(PipeConstants.SHOW_SHOUYUAN_SKILL,[_loc2_,_loc3_]);
         }
         else if(_loc4_ == 4)
         {
            this.shouYuanGongFa_Mediator.showPanel(true);
            this.shouYuanGongFa_Mediator.giftID = 3301;
            this.shouYuanGongFa_Mediator.setShouYuanGongFa();
            this.shouYuanGongFa_Mediator.qingKongPanel();
         }
      }
   }
}

