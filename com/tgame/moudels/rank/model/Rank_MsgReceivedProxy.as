package com.tgame.moudels.rank.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MountSkill;
   import com.tgame.common.vo.rankAttack.RankAttackVO;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.rank.view.Rank_AttackPanelMediator;
   import com.tgame.moudels.rank.view.Rank_FBRankMediator;
   import com.tgame.moudels.rank.view.Rank_RankMediator;
   import com.tgame.moudels.rank.view.Rank_YNMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Rank_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Rank_MsgReceivedProxy";
      
      private var _rankYNMediator:Rank_YNMediator;
      
      private var _rankMediator:Rank_RankMediator;
      
      private var _rankFBMediator:Rank_FBRankMediator;
      
      private var _rankAttackMediator:Rank_AttackPanelMediator;
      
      private var vo:RankAttackVO;
      
      public function Rank_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50302,50304,50306,50310,50314,50318,50320,50326,50328,50334,50338,50340,50342,50346,50348,50352,50356,50398,40040,40028,50358,72982,72984,50362],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50302,50304,50306,50310,50314,50318,50320,50326,50328,50334,50338,50340,50342,50346,50348,50352,50356,50398,40040,40028,50358,72982,72984,50362],NAME);
      }
      
      private function get rankYNMediator() : Rank_YNMediator
      {
         if(this._rankYNMediator == null)
         {
            this._rankYNMediator = facade.retrieveMediator(Rank_YNMediator.NAME) as Rank_YNMediator;
         }
         return this._rankYNMediator;
      }
      
      private function get rankMediator() : Rank_RankMediator
      {
         if(this._rankMediator == null)
         {
            this._rankMediator = facade.retrieveMediator(Rank_RankMediator.NAME) as Rank_RankMediator;
         }
         return this._rankMediator;
      }
      
      private function get rankFBMediator() : Rank_FBRankMediator
      {
         if(this._rankFBMediator == null)
         {
            this._rankFBMediator = facade.retrieveMediator(Rank_FBRankMediator.NAME) as Rank_FBRankMediator;
         }
         return this._rankFBMediator;
      }
      
      private function get rankAttackMediator() : Rank_AttackPanelMediator
      {
         if(this._rankAttackMediator == null)
         {
            this._rankAttackMediator = facade.retrieveMediator(Rank_AttackPanelMediator.NAME) as Rank_AttackPanelMediator;
         }
         return this._rankAttackMediator;
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
      
      public function received_50302(param1:ByteArray) : void
      {
         ZLog.add("50302:反回鄙视或崇拜结果");
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         var _loc3_:String = "";
         var _loc4_:int = param1.readByte();
         if(!_loc2_)
         {
            _loc3_ = NetWorkManager.readGILMsg(param1);
         }
         var _loc5_:int = -1;
         var _loc6_:int = -1;
         if(_loc2_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            PipeManager.sendMsg(PipeConstants.RANK_CHONGBAI_BISHI_DATA,[_loc5_,_loc6_,_loc4_]);
         }
         this.rankMediator.biShiHuoChongBai(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
         this.rankFBMediator.biShiHuoChongBai(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_50304(param1:ByteArray) : void
      {
         ZLog.add("50304:返回人物等级排行");
         this.receivedMsg(param1);
      }
      
      public function received_50306(param1:ByteArray) : void
      {
         ZLog.add("50306:返回人物金钱排行");
         this.receivedMsg_50306(param1);
      }
      
      public function received_50310(param1:ByteArray) : void
      {
         ZLog.add("50310:返回人物坐骑排行");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push([param1.readInt(),param1.readUTF(),param1.readInt(),param1.readInt(),param1.readShort()]);
            _loc6_++;
         }
         this.rankMediator.viewRank(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_50314(param1:ByteArray) : void
      {
         ZLog.add("50314:返回人物战场声望排行");
         this.receivedMsg(param1);
      }
      
      public function received_50318(param1:ByteArray) : void
      {
         ZLog.add("50318:返回人物连斩排行");
         this.receivedMsg(param1);
      }
      
      public function received_50320(param1:ByteArray) : void
      {
         ZLog.add("50320:返回人物boss排行");
         this.receivedMsg(param1);
      }
      
      public function received_50326(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         ZLog.add("50326:返回人物经脉排行");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = param1.readInt();
            _loc8_ = param1.readUTF();
            _loc9_ = param1.readInt();
            _loc5_.push([_loc7_,_loc8_,_loc9_,undefined,param1.readShort()]);
            _loc6_++;
         }
         this.rankMediator.viewRank(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_50328(param1:ByteArray) : void
      {
         ZLog.add("50328:返回人物武功境界排行");
         this.receivedMsg(param1);
      }
      
      public function received_50334(param1:ByteArray) : void
      {
         ZLog.add("50334:返回人物成就排行");
         this.receivedMsg(param1);
      }
      
      public function received_50342(param1:ByteArray) : void
      {
         ZLog.add("50342:返回人物暗器排行");
         this.receivedMsg1(param1);
      }
      
      public function received_50348(param1:ByteArray) : void
      {
         ZLog.add("50348:返回人物神器传闻");
         this.receivedMsg(param1);
      }
      
      public function received_50352(param1:ByteArray) : void
      {
         ZLog.add("50352:返回城战排行");
         this.receivedMsg(param1);
      }
      
      public function received_50356(param1:ByteArray) : void
      {
         ZLog.add("50356:返回论剑排行");
         this.receivedMsg(param1);
      }
      
      public function received_40040(param1:ByteArray) : void
      {
         ZLog.add("40040:返回人物金钱排行");
         this.receivedMsg(param1);
      }
      
      public function received_50346(param1:ByteArray) : void
      {
         ZLog.add("50346:返回副本排行");
         this.receiveFBMsg(param1);
      }
      
      public function received_50398(param1:ByteArray) : void
      {
         ZLog.add("50398:统计数据返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         var _loc4_:Array = _loc3_.split(",");
         var _loc5_:Array = _loc4_.splice(0,20);
         if(_loc2_ == 0)
         {
            this.rankMediator.setStatisticsData(_loc5_,_loc4_);
         }
         if(_loc2_ == 1)
         {
            this.rankFBMediator.setStatisticsData(_loc5_,_loc4_);
         }
      }
      
      public function received_50338(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         var _loc9_:Goods = null;
         ZLog.add("50338:返回人物显示");
         var _loc2_:Object = {};
         var _loc3_:int = param1.readByte();
         if(_loc3_ != 100 && _loc3_ != 120 && _loc3_ != 125)
         {
            _loc2_.congbaiCount = param1.readInt();
            if(_loc2_.congbaiCount == -1)
            {
               if(_loc3_ == 0)
               {
                  this.rankMediator.setPlayerEquipOrRide(true,null);
               }
               if(_loc3_ == 1)
               {
                  this.rankFBMediator.setPlayerEquipOrRide(true,null);
               }
               if(_loc3_ == 101)
               {
                  PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_RECEIVED,[true,null,_loc3_]);
               }
               return;
            }
            _loc2_.bishiCount = param1.readInt();
            _loc4_ = param1.readInt();
            _loc2_.equipArr = [];
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = param1.readInt();
               _loc7_ = param1.readShort();
               _loc8_ = new Goods(_loc6_,_loc7_);
               _loc8_.quality = param1.readInt();
               _loc8_.isFullStar = param1.readByte();
               _loc8_.strengthen_grade = param1.readByte();
               _loc8_.isTuteng = param1.readByte();
               _loc8_.isBaoshiTOP = param1.readByte();
               _loc8_.isNiuBi = param1.readByte();
               _loc8_.isFullTianshen = param1.readByte();
               _loc8_.isSiShengShou = param1.readByte();
               _loc8_.isFullStone = param1.readByte();
               _loc2_.equipArr.push(_loc8_);
               if(SpecialGoodsID.getSpecialAvatarType(_loc6_) > 0)
               {
                  _loc2_.usingFashion = SpecialGoodsID.getSpecialAvatarType(_loc6_);
               }
               _loc5_++;
            }
            _loc2_.chenghao = param1.readUTF();
            _loc2_.id = param1.readInt();
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc9_ = _loc2_.equipArr[_loc5_];
               _loc9_.roleID = _loc2_.id;
               _loc5_++;
            }
            _loc2_.isOnMount = param1.readByte() == 0 ? false : true;
            _loc2_.partyID = param1.readInt();
            if(_loc2_.isOnMount)
            {
               _loc2_.mountID = param1.readInt();
            }
            else
            {
               param1.readInt();
            }
            _loc2_.yupeiID = param1.readInt();
            _loc2_.useIng_Weapon_id = param1.readInt();
            _loc2_.isXTWJ = param1.readByte() == 0 ? false : true;
            _loc2_.isRTJS = param1.readByte() == 0 ? false : true;
            _loc2_.wuhun = param1.readShort();
            _loc2_.TSNL = param1.readShort();
            _loc2_.HuXinYao = param1.readShort() == 0 ? false : true;
            _loc2_.wuHunShengJiDan = param1.readShort() == 0 ? false : true;
            _loc2_.ShenNongBaiChaoDanSta = param1.readShort();
            _loc2_.niXiStatus = param1.readShort() == 1;
            _loc2_.qianNengXinFaSta = param1.readInt();
            _loc2_.useAvatarType = param1.readInt();
            _loc2_.taoZhuang = param1.readByte() == 1;
            _loc2_.isFeixing = param1.readByte() == 1;
            _loc2_.isFeixing_huanzhuang_Id = param1.readByte();
            _loc2_.isFeixing_wuhun_Id = param1.readInt();
            _loc2_.fengHuang = param1.readByte() == 1;
            _loc2_.huohundan = param1.readByte() == 1;
            _loc2_.wuhunshendan = param1.readInt();
            _loc2_.longhunwupo = param1.readByte() == 1;
            _loc2_.longhunshendan = param1.readInt();
            _loc2_.shenfumiji = param1.readByte() == 1;
            _loc2_.gushengmiji = false;
            if(_loc3_ == 0)
            {
               this.rankMediator.setPlayerEquipOrRide(true,_loc2_);
            }
            if(_loc3_ == 1)
            {
               this.rankFBMediator.setPlayerEquipOrRide(true,_loc2_);
            }
            if(_loc3_ == OtherConst.RANK_KUAFU_3V3)
            {
               PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_RECEIVED,[true,_loc2_,_loc3_]);
            }
            if(_loc3_ == 102)
            {
               this.rankAttackMediator.setRankAttackPlayerAdv(_loc2_);
            }
         }
         else
         {
            _loc2_.congbaiCount = param1.readInt();
            if(_loc2_.congbaiCount == -1)
            {
               PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_RECEIVED,[true,null,_loc3_]);
               return;
            }
            _loc2_.bishiCount = param1.readInt();
            _loc4_ = param1.readInt();
            _loc2_.equipArr = [];
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = param1.readInt();
               _loc7_ = param1.readShort();
               _loc8_ = new Goods(_loc6_,_loc7_);
               _loc8_.quality = param1.readInt();
               _loc8_.isFullStar = param1.readByte();
               _loc8_.strengthen_grade = param1.readByte();
               _loc8_.isTuteng = param1.readByte();
               _loc8_.isBaoshiTOP = param1.readByte();
               _loc8_.isNiuBi = param1.readByte();
               _loc8_.isFullTianshen = param1.readByte();
               _loc8_.isSiShengShou = param1.readByte();
               _loc8_.isFullStone = param1.readByte();
               _loc2_.equipArr.push(_loc8_);
               if(SpecialGoodsID.getSpecialAvatarType(_loc6_) > 0)
               {
                  _loc2_.usingFashion = SpecialGoodsID.getSpecialAvatarType(_loc6_);
               }
               _loc5_++;
            }
            _loc2_.chenghao = param1.readUTF();
            _loc2_.id = param1.readInt();
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc9_ = _loc2_.equipArr[_loc5_];
               _loc9_.roleID = _loc2_.id;
               _loc5_++;
            }
            _loc2_.isOnMount = param1.readByte() == 0 ? false : true;
            _loc2_.partyID = param1.readInt();
            if(_loc2_.isOnMount)
            {
               _loc2_.mountID = param1.readInt();
            }
            else
            {
               param1.readInt();
            }
            _loc2_.yupeiID = param1.readInt();
            _loc2_.useIng_Weapon_id = param1.readInt();
            _loc2_.isXTWJ = param1.readByte() == 0 ? false : true;
            _loc2_.isRTJS = param1.readByte() == 0 ? false : true;
            _loc2_.wuhun = param1.readShort();
            _loc2_.TSNL = param1.readShort();
            _loc2_.HuXinYao = param1.readShort() == 0 ? false : true;
            _loc2_.wuHunShengJiDan = param1.readShort() == 0 ? false : true;
            _loc2_.ShenNongBaiChaoDanSta = param1.readShort();
            _loc2_.niXiStatus = param1.readShort() == 1;
            _loc2_.qianNengXinFaSta = param1.readInt();
            _loc2_.useAvatarType = param1.readInt();
            _loc2_.taoZhuang = param1.readByte() == 1;
            _loc2_.isFeixing = param1.readByte() == 1;
            _loc2_.isFeixing_huanzhuang_Id = param1.readByte();
            _loc2_.isFeixing_wuhun_Id = param1.readInt();
            _loc2_.fengHuang = param1.readByte() == 1;
            _loc2_.huohundan = param1.readByte() == 1;
            _loc2_.wuhunshendan = param1.readInt();
            _loc2_.longhunwupo = param1.readByte() == 1;
            _loc2_.longhunshendan = param1.readInt();
            _loc2_.shenfumiji = param1.readByte() == 1;
            PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_RECEIVED,[true,_loc2_,_loc3_]);
         }
      }
      
      public function received_50340(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:MountSkill = null;
         ZLog.add("50340:返回坐骑显示");
         var _loc2_:Object = {};
         var _loc3_:int = param1.readByte();
         _loc2_.modelID = param1.readInt();
         if(_loc2_.modelID == -1)
         {
            this.rankMediator.setPlayerEquipOrRide(false,null);
            return;
         }
         _loc2_.id = param1.readInt();
         _loc2_.name = param1.readUTF();
         _loc2_.menghuan = param1.readInt() / 10000;
         _loc2_.menghuan_wuxing = param1.readInt() / 10000;
         _loc2_.menghuan_jineng = param1.readInt() / 10000;
         _loc2_.menghuan_qianli = param1.readInt() / 10000;
         _loc2_.menghuan_mhd = param1.readInt();
         _loc2_.quality = param1.readByte();
         _loc2_.savvy = param1.readInt();
         _loc2_.attackNow = param1.readInt();
         _loc2_.attackMax = param1.readInt();
         _loc2_.attackFujia = param1.readInt();
         _loc2_.recoveryNow = param1.readInt();
         _loc2_.recoveryMax = param1.readInt();
         _loc2_.recoveryFujia = param1.readInt();
         _loc2_.healthNow = param1.readInt();
         _loc2_.healthMax = param1.readInt();
         _loc2_.healthFujia = param1.readInt();
         _loc2_.lightNow = param1.readInt();
         _loc2_.lightMax = param1.readInt();
         _loc2_.lightFujia = param1.readInt();
         var _loc4_:int = param1.readInt();
         _loc2_.equips = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new Goods(param1.readInt(),param1.readShort());
            _loc6_.quality = param1.readInt();
            _loc6_.isFullStar = param1.readByte();
            _loc6_.strengthen_grade = param1.readByte();
            _loc6_.roleID = 0;
            _loc2_.equips.push(_loc6_);
            _loc5_++;
         }
         _loc4_ = param1.readByte();
         _loc2_.skills = {};
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new MountSkill(param1.readInt(),_loc5_ + 1);
            _loc7_.lv = param1.readShort();
            _loc7_.nowLvJianChengStr = param1.readUTF();
            _loc7_.nextLvUpUseZhenQi = param1.readShort();
            _loc7_.nextLvUpUseCopper = param1.readInt();
            _loc7_.nextLvJianChengStr = param1.readUTF();
            _loc7_.isOther = 1;
            _loc2_.skills[_loc7_.id] = _loc7_;
            _loc5_++;
         }
         _loc2_.chenghao = param1.readUTF();
         _loc2_.partyID = param1.readInt();
         _loc2_.menghuanShendanJihuo = param1.readByte();
         _loc2_.isFeixing = param1.readByte() == 1;
         _loc2_.isFeixing_huanzhuang_Id = param1.readByte();
         _loc2_.isFeixing_wuhun_Id = param1.readInt();
         _loc2_.chaojizuoqiQianNengDan = param1.readInt();
         _loc2_.zhongjizuoqiQianNengDan = param1.readInt();
         _loc2_.shoushenDan = param1.readInt();
         _loc2_.dianfengqiannengDan = param1.readInt();
         _loc2_.huohundan = param1.readByte() == 1;
         _loc2_.wuhunshendan = param1.readInt();
         _loc2_.longhunwupo = param1.readByte() == 1;
         _loc2_.longhunshendan = param1.readInt();
         _loc2_.shenfumiji = param1.readByte() == 1;
         if(_loc3_ == 0)
         {
            this.rankMediator.setPlayerEquipOrRide(false,_loc2_);
         }
         if(_loc3_ == 1)
         {
            this.rankFBMediator.setPlayerEquipOrRide(false,_loc2_);
         }
      }
      
      public function received_40028(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc7_:Object = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         if(_loc3_ == 0)
         {
            return;
         }
         this.vo = new RankAttackVO();
         this.vo.playerID = _loc3_;
         this.vo.headStr = HeadResChange.headResChangeToString(param1.readInt());
         this.vo.playerName = param1.readUTF();
         this.vo.lv = param1.readShort();
         this.vo.party = param1.readUTF();
         this.vo.spousePlayerName = param1.readUTF();
         this.vo.allActNum = param1.readDouble();
         this.vo.rank = param1.readInt();
         this.vo.playerActNum = param1.readInt();
         this.vo.pact_LvNum = param1.readInt();
         this.vo.pact_SpouseNum = param1.readInt();
         this.vo.pact_PointNum = param1.readDouble();
         this.vo.pact_XueLingDanNum = param1.readInt();
         this.vo.pact_XueHunDanNum = param1.readInt();
         this.vo.pact_WuHunDanNum = param1.readInt();
         this.vo.pact_ChangShengDanNum = param1.readInt();
         this.vo.pact_LongXuDanNum = param1.readInt();
         this.vo.pact_YunChengNum = param1.readInt();
         this.vo.basicsActNum = param1.readInt();
         this.vo.nact_RouShen = param1.readInt();
         this.vo.nact_DanTian = param1.readInt();
         this.vo.nact_JingMai = param1.readInt();
         this.vo.nact_SiLingZhen = param1.readInt();
         this.vo.nact_DongXiao = param1.readInt();
         this.vo.nact_AnQi = param1.readInt();
         this.vo.nact_GongJian = param1.readInt();
         this.vo.nact_DuGuJiuJian = param1.readInt();
         this.vo.nact_BaGuaZhang = param1.readInt();
         this.vo.nact_JiuYang = param1.readInt();
         this.vo.nact_XiangLongShiBaZhang = param1.readInt();
         this.vo.nact_YiJinJing = param1.readInt();
         this.vo.nact_CangJingGe = param1.readInt();
         this.vo.nact_XiSuiJing = param1.readInt();
         this.vo.nact_FeiLongTanYunShou = param1.readInt();
         this.vo.nact_JiuYinZhenJing = param1.readInt();
         this.vo.wuxue_WuXingQuanNum = param1.readInt();
         this.vo.wuxue_ShiBaTongRenNum = param1.readInt();
         this.vo.wuxue_LiuMaiShenJianNum = param1.readInt();
         this.vo.nact_WuXingZhiRen = param1.readInt();
         this.vo.nact_XiuWei = param1.readInt();
         this.vo.wuxue_JinZhongZhaoNum = param1.readInt();
         this.vo.wuxue_BeiMingShenGongNum = param1.readInt();
         this.vo.wuxue_TaiXuanShenGongNum = param1.readInt();
         this.vo.wuxue_ShenZhaoJingNum = param1.readInt();
         this.vo.equipActNum = param1.readInt();
         this.vo.equip_LvNum = param1.readInt();
         this.vo.equip_StarNum = param1.readInt();
         this.vo.equip_ShuXingNum = param1.readInt();
         this.vo.equip_TeShuWuQiNum = param1.readInt();
         this.vo.equip_HuShenFuNum = param1.readInt();
         this.vo.equip_EquipColorNum = param1.readInt();
         this.vo.equip_StongNum = param1.readDouble();
         this.vo.equip_ZhanWenNum = param1.readInt();
         this.vo.equip_YuPei = param1.readInt();
         this.vo.equip_HuiZhang = param1.readInt();
         this.vo.equip_XunZhang = param1.readInt();
         this.vo.equip_ZhanQi = param1.readInt();
         this.vo.mountActNum = param1.readInt();
         this.vo.mount_LvNum = param1.readInt();
         this.vo.mount_PinJiNum = param1.readInt();
         this.vo.mount_WuXingNum = param1.readInt();
         this.vo.mount_QianNengDanNum = param1.readInt();
         this.vo.mount_JieDuanNum = param1.readInt();
         this.vo.mount_SkillNum = param1.readInt();
         this.vo.mount_MengHuanDuNum = param1.readInt();
         this.vo.mount_PointNum = param1.readInt();
         this.vo.mount_ShenDanNum = param1.readInt();
         this.vo.skillActNum = param1.readInt();
         this.vo.skill_PartyNum = param1.readInt();
         this.vo.skill_otherNum = param1.readInt();
         this.vo.skill_JiangHuNum = param1.readInt();
         this.vo.skillActNum = this.vo.skill_JiangHuNum + this.vo.skill_otherNum + this.vo.skill_PartyNum;
         this.vo.nact_QiMenZhen = param1.readInt();
         this.vo.wuxue_QiShangQuanNum = param1.readInt();
         this.vo.wuxue_ZiXiaShenGongNum = param1.readInt();
         this.vo.wuxue_jinchangongfaNum = param1.readInt();
         this.vo.wuxue_chixuemozhenNum = param1.readInt();
         this.vo.wuxue_tianshizhiyiNum = param1.readInt();
         this.vo.wuxue_bihaichaoshengNum = param1.readInt();
         this.vo.wuxue_qixingzhenfaNum = param1.readInt();
         this.vo.wuxue_jiuquhuangheNum = param1.readInt();
         this.vo.wuxue_zhenwuqijieNum = param1.readInt();
         this.vo.wuxue_jingangfumoquanNum = param1.readInt();
         this.vo.wuxue_xiaoyaoyufengNum = param1.readInt();
         this.vo.wuxue_qinlonggongNum = param1.readInt();
         this.vo.wuxue_tianmenzhenNum = param1.readInt();
         this.vo.wuxue_jianghunNum = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new Object();
            _loc7_.id = param1.readInt();
            _loc7_.value = param1.readInt();
            if(_loc7_.id != 0)
            {
               this.vo.xunzhangArr.push(_loc7_);
               this.vo.xunzhangNum += _loc7_.value;
            }
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = new Object();
            _loc7_.id = param1.readInt();
            _loc7_.value = param1.readInt();
            if(_loc7_.id != 0)
            {
               this.vo.shenbingArr.push(_loc7_);
               this.vo.shenbingNum += _loc7_.value;
            }
            _loc5_++;
         }
         this.vo.check1 = Boolean(param1.readByte());
         this.vo.mountActNum = this.vo.mount_LvNum + this.vo.mount_JieDuanNum + this.vo.mount_MengHuanDuNum + this.vo.mount_PinJiNum + this.vo.mount_PointNum + this.vo.mount_QianNengDanNum + this.vo.mount_ShenDanNum + this.vo.mount_SkillNum + this.vo.mount_WuXingNum;
         this.vo.equipActNum = this.vo.equip_EquipColorNum + this.vo.equip_HuiZhang + this.vo.equip_HuShenFuNum + this.vo.equip_LvNum + this.vo.equip_ShuXingNum + this.vo.equip_StarNum + this.vo.equip_StongNum + this.vo.equip_TeShuWuQiNum + this.vo.equip_XunZhang + this.vo.equip_YuPei + this.vo.equip_ZhanWenNum + this.vo.equip_ZhanQi;
         this.vo.playerActNum = this.vo.pact_ChangShengDanNum + this.vo.pact_LongXuDanNum + this.vo.pact_LvNum + this.vo.pact_PointNum + this.vo.pact_SpouseNum + this.vo.pact_WuHunDanNum + this.vo.pact_XueHunDanNum + this.vo.pact_XueLingDanNum + this.vo.pact_YunChengNum + this.vo.wuxue_jianghunNum;
         this.vo.basicsActNum = this.vo.wuxue_ShiBaTongRenNum + this.vo.nact_RouShen + this.vo.nact_DanTian + this.vo.nact_JingMai + this.vo.nact_SiLingZhen + this.vo.nact_DongXiao + this.vo.nact_AnQi + this.vo.nact_GongJian + this.vo.nact_CangJingGe + this.vo.nact_WuXingZhiRen + this.vo.nact_XiuWei + this.vo.nact_QiMenZhen;
         this.vo.WuxueActNum = this.vo.wuxue_WuXingQuanNum + this.vo.nact_BaGuaZhang + this.vo.nact_XiangLongShiBaZhang + this.vo.nact_XiSuiJing + this.vo.nact_DuGuJiuJian + this.vo.nact_JiuYinZhenJing + this.vo.nact_JiuYang + this.vo.nact_YiJinJing + this.vo.nact_FeiLongTanYunShou + this.vo.wuxue_LiuMaiShenJianNum + this.vo.wuxue_JinZhongZhaoNum + this.vo.wuxue_BeiMingShenGongNum + this.vo.wuxue_TaiXuanShenGongNum + this.vo.wuxue_ShenZhaoJingNum + this.vo.wuxue_QiShangQuanNum + this.vo.wuxue_ZiXiaShenGongNum;
         this.vo.WuxueActNum = this.vo.WuxueActNum + this.vo.wuxue_wuxingNum + this.vo.wuxue_jinchangongfaNum + this.vo.wuxue_chixuemozhenNum + this.vo.wuxue_tianshizhiyiNum + this.vo.wuxue_bihaichaoshengNum + this.vo.wuxue_qixingzhenfaNum + this.vo.wuxue_jiuquhuangheNum;
         this.vo.WuxueActNum = this.vo.WuxueActNum + this.vo.wuxue_zhenwuqijieNum + this.vo.wuxue_jingangfumoquanNum + this.vo.wuxue_xiaoyaoyufengNum + this.vo.wuxue_qinlonggongNum + this.vo.wuxue_tianmenzhenNum;
         this.vo.playerActNum += this.vo.skillActNum;
         this.rankAttackMediator.setLookAttackPlayer(_loc3_,this.vo,_loc2_);
      }
      
      public function received_50358(param1:ByteArray) : void
      {
         this.receivedMsg(param1);
         ZLog.add("50358: 返回跨服战斗排行");
      }
      
      public function received_50362(param1:ByteArray) : void
      {
         this.receivedMsg(param1);
         ZLog.add("50362: 返回夺宝奇兵排行");
      }
      
      private function receivedMsg(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push([param1.readInt(),param1.readUTF(),param1.readDouble(),undefined,param1.readShort()]);
            _loc6_++;
         }
         this.rankMediator.viewRank(_loc2_,_loc3_,_loc5_);
      }
      
      private function receivedMsg_50306(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push([param1.readInt(),param1.readUTF(),param1.readDouble(),undefined,param1.readShort()]);
            _loc6_++;
         }
         this.rankMediator.viewRank(_loc2_,_loc3_,_loc5_);
      }
      
      private function receiveFBMsg(param1:ByteArray) : void
      {
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = [param1.readInt(),param1.readUTF()];
            _loc8_ = param1.readInt();
            _loc9_ = _loc8_ % 60 < 10 ? "0" + _loc8_ % 60 : "" + _loc8_ % 60;
            _loc10_ = int(_loc8_ / 60) < 10 ? "0" + int(_loc8_ / 60) : String(int(_loc8_ / 60));
            _loc11_ = _loc10_ + LanResManager.getLanTextWords(this,"分") + _loc9_ + LanResManager.getLanTextWords(this,"秒");
            _loc7_.push(_loc11_,param1.readShort());
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.rankFBMediator.viewRank(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_72982(param1:ByteArray) : void
      {
         var _loc11_:Object = null;
         ZLog.add("72982:返回越南新服排行榜信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc11_ = new Object();
            _loc11_.no = param1.readInt();
            _loc11_.id = param1.readInt();
            _loc11_.name = param1.readUTF();
            _loc11_.data = param1.readDouble();
            _loc7_.push(_loc11_);
            _loc8_++;
         }
         var _loc9_:Boolean = param1.readByte() == 1 ? true : false;
         var _loc10_:int = param1.readInt();
         if(!Fun.isVisible(GameInstance.uiInstance.rankYNPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YUENANRANKING_PANEL);
         }
         this.rankYNMediator.setListData(_loc2_,_loc3_,_loc4_,_loc5_,_loc9_,_loc10_,_loc7_);
      }
      
      public function received_72984(param1:ByteArray) : void
      {
         ZLog.add("72984:返回越南新服排行榜领取奖励结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.rankYNMediator.requestPanel();
         }
      }
      
      private function receivedMsg1(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push([param1.readInt(),param1.readUTF(),param1.readDouble(),undefined,param1.readShort()]);
            _loc6_++;
         }
         this.rankMediator.viewRank(_loc2_,_loc3_,_loc5_);
      }
   }
}

