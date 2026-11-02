package com.tgame.moudels.wedding.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.character.info.data.PersonData;
   import com.tgame.common.vo.character.info.data.PersonShortData;
   import com.tgame.common.vo.character.info.data.SpouseData;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.wedding.view.WeddingLaunchProposal_Mediator;
   import com.tgame.moudels.wedding.view.WeddingMarriageSuccess_Mediator;
   import com.tgame.moudels.wedding.view.WeddingProposalAffirm_Mediator;
   import com.tgame.moudels.wedding.view.WeddingTaKungFu_Mediator;
   import com.tgame.moudels.wedding.view.WeddingTeam_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wedding_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgReceivedProxy";
      
      private var _feastMeditor:WeddingLaunchProposal_Mediator;
      
      private var _launchProposal:WeddingProposalAffirm_Mediator;
      
      private var _marriageSuccess:WeddingMarriageSuccess_Mediator;
      
      private var _peiou:WeddingTeam_Mediator;
      
      private var _taKungFu:WeddingTaKungFu_Mediator;
      
      public function Wedding_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get launch() : WeddingLaunchProposal_Mediator
      {
         if(!this._feastMeditor)
         {
            this._feastMeditor = facade.retrieveMediator(WeddingLaunchProposal_Mediator.NAME) as WeddingLaunchProposal_Mediator;
         }
         return this._feastMeditor;
      }
      
      private function get launchProposal() : WeddingProposalAffirm_Mediator
      {
         if(!this._launchProposal)
         {
            this._launchProposal = facade.retrieveMediator(WeddingProposalAffirm_Mediator.NAME) as WeddingProposalAffirm_Mediator;
         }
         return this._launchProposal;
      }
      
      private function get marriageSuccess() : WeddingMarriageSuccess_Mediator
      {
         if(!this._marriageSuccess)
         {
            this._marriageSuccess = facade.retrieveMediator(WeddingMarriageSuccess_Mediator.NAME) as WeddingMarriageSuccess_Mediator;
         }
         return this._marriageSuccess;
      }
      
      private function get peiou() : WeddingTeam_Mediator
      {
         if(!this._peiou)
         {
            this._peiou = facade.retrieveMediator(WeddingTeam_Mediator.NAME) as WeddingTeam_Mediator;
         }
         return this._peiou;
      }
      
      private function get taKungFu() : WeddingTaKungFu_Mediator
      {
         if(!this._taKungFu)
         {
            this._taKungFu = facade.retrieveMediator(WeddingTaKungFu_Mediator.NAME) as WeddingTaKungFu_Mediator;
         }
         return this._taKungFu;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([52202,52206,52208,52210,52214,52216,52218,52220,52222,52224,52226,52228,52230,52232,52234,52238,52304,52236,52242,52306,52240,52308,52362,52372,52374],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([52202,52206,52208,52210,52214,52216,52218,52220,52222,52224,52226,52228,52230,52232,52234,52238,52304,52236,52242,52306,52240,52308,52362,52372,52374],NAME);
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
      
      public function received_52202(param1:ByteArray) : void
      {
         ZLog.add("52202：接收个人资料查询消息");
         var _loc2_:PersonData = new PersonData();
         _loc2_.nickName = param1.readUTF();
         _loc2_.birthYear = param1.readShort();
         _loc2_.birthMoon = param1.readByte();
         _loc2_.birthDay = param1.readByte();
         _loc2_.sex = param1.readByte();
         _loc2_.blood = param1.readByte();
         _loc2_.shengFen = param1.readUTF();
         _loc2_.city = param1.readUTF();
         _loc2_.job = param1.readUTF();
         _loc2_.school = param1.readUTF();
         _loc2_.mail = param1.readUTF();
         _loc2_.http = param1.readUTF();
         _loc2_.qq = param1.readUTF();
         _loc2_.phone = param1.readUTF();
         _loc2_.openType = param1.readByte();
      }
      
      public function received_52206(param1:ByteArray) : void
      {
         ZLog.add("52206：接收其他玩家资料查询消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:PersonData = new PersonData();
         _loc3_.nickName = param1.readUTF();
         _loc3_.birthYear = param1.readShort();
         _loc3_.birthMoon = param1.readByte();
         _loc3_.birthDay = param1.readByte();
         _loc3_.sex = param1.readByte();
         _loc3_.blood = param1.readByte();
         _loc3_.shengFen = param1.readUTF();
         _loc3_.city = param1.readUTF();
         _loc3_.job = param1.readUTF();
         _loc3_.school = param1.readUTF();
         _loc3_.mail = param1.readUTF();
         _loc3_.http = param1.readUTF();
         _loc3_.qq = param1.readUTF();
         _loc3_.phone = param1.readUTF();
         _loc3_.openType = param1.readByte();
      }
      
      public function received_52208(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:PersonShortData = null;
         ZLog.add("52208：接收个人资料列表分页查询消息");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readShort();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = new PersonShortData();
            _loc7_.head = param1.readByte();
            _loc7_.nickName = param1.readUTF();
            _loc7_.sex = param1.readByte();
            _loc7_.age = param1.readByte();
            _loc7_.shengFen = param1.readUTF();
            _loc7_.city = param1.readUTF();
            _loc7_.flowerCount = param1.readInt();
            _loc7_.face = param1.readUTF();
            _loc7_.text = param1.readUTF();
            _loc7_.photoURL = param1.readUTF();
            _loc5_++;
         }
      }
      
      public function received_52210(param1:ByteArray) : void
      {
         ZLog.add("52210：接收检查自己是否填写完整消息");
         var _loc2_:int = param1.readByte();
         if(!_loc2_)
         {
         }
      }
      
      public function received_52214(param1:ByteArray) : void
      {
         ZLog.add("52214：接收求婚界面显示消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readShort();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readByte();
         this.launch.setInit(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_52216(param1:ByteArray) : void
      {
         ZLog.add("52216：接收放入玉佩消息");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readInt();
         var _loc4_:Goods = new Goods(_loc3_);
         var _loc5_:int = param1.readInt();
         var _loc6_:Skill = new Skill(_loc5_);
         var _loc7_:int = param1.readInt();
         var _loc8_:Skill = new Skill(_loc7_);
         var _loc9_:int = param1.readInt();
         var _loc10_:Goods = new Goods(_loc9_);
         var _loc11_:int = param1.readInt();
         var _loc12_:Goods = new Goods(_loc11_);
         _loc2_.push(_loc4_,_loc6_,_loc8_,_loc10_,_loc12_);
         this.launch.setYuPei(_loc2_);
      }
      
      public function received_52218(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:GoodsRes = null;
         ZLog.add("52218：接收购买玉佩列表消息");
         var _loc2_:int = param1.readByte();
         var _loc4_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = param1.readInt();
            _loc11_ = param1.readInt();
            _loc12_ = GoodsResManager.getGoodsRes(_loc6_);
            _loc5_ = new Object();
            _loc5_.id = _loc6_;
            _loc5_.name = _loc12_.name;
            _loc5_.price = _loc7_;
            _loc5_.tubiaoMath = ResPathManager.getBigICOPath(_loc12_.id_ico_big);
            _loc5_.nengli1 = new Skill(_loc8_);
            _loc5_.nengli2 = new Skill(_loc9_);
            _loc5_.xiaoguo1 = new Goods(_loc10_);
            _loc5_.xiaoguo2 = new Goods(_loc11_);
            _loc4_.push(_loc5_);
            _loc3_++;
         }
         _loc4_.sortOn(["id"],Array.NUMERIC);
         this.launch.setYuPeiList(_loc4_);
      }
      
      public function received_52220(param1:ByteArray) : void
      {
         ZLog.add("52player收购买玉佩消息");
      }
      
      public function received_52222(param1:ByteArray) : void
      {
         ZLog.add("52222：接收求婚消息");
      }
      
      public function received_52224(param1:ByteArray) : void
      {
         ZLog.add("52224：接收被求婚者接收求婚信息消息");
         var _loc2_:int = param1.readInt();
      }
      
      public function received_52226(param1:ByteArray) : void
      {
         ZLog.add("52226：接收被求婚者点开求婚面板消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readShort();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         this.launchProposal.setInit(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
      }
      
      public function received_52228(param1:ByteArray) : void
      {
         ZLog.add("52228：接收结婚成功消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:String = param1.readUTF();
         this.launch.close();
         this.launchProposal.close();
         this.peiou.updatePeiouPanel();
         HighEffectManager.snow_start(30);
         FightManager.screen_shake(4,50);
         this.marriageSuccess.setInit(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_52230(param1:ByteArray) : void
      {
         var fullYupeiID:int;
         var tag:int;
         var targetID:int = 0;
         var pPlayer:PurePlayer = null;
         var attrInfo:AttributeInfo = null;
         var avatarInfo:AvatarInfo = null;
         var banghuiInfo:BanghuiInfo = null;
         var goodsNum:int = 0;
         var goodsArr:Array = null;
         var goods:Goods = null;
         var i:int = 0;
         var isOnMount:Boolean = false;
         var spouseData:SpouseData = null;
         var curWeaponID:int = 0;
         var goodsID:int = 0;
         var goodsP:int = 0;
         var goodsRes:GoodsRes = null;
         var mountID:int = 0;
         var mountRes:MountRes = null;
         var $data:ByteArray = param1;
         ZLog.add("52230：接收配偶属性消息");
         fullYupeiID = $data.readInt();
         this.peiou.setFullYupeiID(fullYupeiID);
         tag = $data.readByte();
         if(tag == 0)
         {
            this.peiou.setInit(tag,null);
         }
         else if(tag == 1)
         {
            this.peiou.setInit(tag,null);
         }
         else if(tag == 2)
         {
            targetID = $data.readInt();
            GameInstance.peioPlayerID = targetID;
            pPlayer = GameInstance.peioPlayerData;
            attrInfo = pPlayer.attributeInfo;
            avatarInfo = pPlayer.avatarInfo;
            banghuiInfo = pPlayer.banghuiInfo;
            avatarInfo.clear();
            pPlayer.id = targetID;
            pPlayer.name = $data.readUTF();
            attrInfo.lv = $data.readShort();
            attrInfo.partyID = $data.readByte();
            attrInfo.prestige_chengzhan = $data.readInt();
            attrInfo.prestige_lunjian = $data.readInt();
            attrInfo.prestige_fuqijingji = $data.readInt();
            banghuiInfo.banghuiName = $data.readUTF();
            banghuiInfo.bangqiImgID = $data.readByte();
            banghuiInfo.bangqiImgColor = $data.readUTF().split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            attrInfo.spouseName = $data.readUTF();
            attrInfo.expNow = $data.readDouble();
            attrInfo.expMax = $data.readDouble();
            attrInfo.gqNow = $data.readInt();
            attrInfo.hpNow = $data.readDouble();
            attrInfo.hpMax = $data.readDouble();
            attrInfo.mpNow = $data.readDouble();
            attrInfo.mpMax = $data.readDouble();
            attrInfo.ppNow = $data.readDouble();
            attrInfo.ppMax = $data.readDouble();
            attrInfo.ap = $data.readDouble();
            attrInfo.dp = $data.readDouble();
            attrInfo.cp = $data.readDouble();
            attrInfo.ev = $data.readDouble();
            attrInfo.adx = $data.readInt();
            attrInfo.mdx = $data.readInt();
            attrInfo.kfNow = $data.readDouble();
            attrInfo.kfMax = $data.readDouble();
            attrInfo.jmNow = $data.readShort();
            attrInfo.jmMax = $data.readShort();
            attrInfo.cjNow = $data.readShort();
            attrInfo.cjMax = $data.readShort();
            goodsNum = $data.readInt();
            goodsArr = [];
            i = 0;
            while(i < goodsNum)
            {
               goodsID = $data.readInt();
               goodsP = $data.readShort();
               goods = new Goods(goodsID,goodsP);
               goods.roleID = targetID;
               goods.strengthen_grade = $data.readByte();
               goods.quality = $data.readByte();
               goods.bind = $data.readByte();
               goods.isFullStar = $data.readByte();
               goods.strengthen_total = $data.readByte();
               goods.isTuteng = $data.readByte();
               goods.isBaoshiTOP = $data.readByte();
               goods.isNiuBi = $data.readByte();
               goods.isFullTianshen = $data.readByte();
               goods.isSiShengShou = $data.readByte();
               goods.isFullStone = $data.readByte();
               goodsArr.push(goods);
               goodsRes = GoodsResManager.getGoodsRes(goodsID);
               if(goodsRes != null)
               {
                  AvatarManager.dressAvatarData(avatarInfo,goodsRes.position,goodsRes.id_m,attrInfo.getSex());
                  if(SpecialGoodsID.getSpecialAvatarType(goodsID) > 0)
                  {
                     avatarInfo.usingFashion = SpecialGoodsID.getSpecialAvatarType(goodsID);
                  }
               }
               i++;
            }
            pPlayer.goodsInfo.goodsBagArr = goodsArr;
            pPlayer.avatarInfo.useAvatarType = $data.readInt();
            isOnMount = $data.readByte() == 1;
            pPlayer.isOnMount = isOnMount;
            if(isOnMount)
            {
               mountID = $data.readInt();
               if(avatarInfo.usingFashion == 1)
               {
                  avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
               }
               else if(avatarInfo.useAvatarType > 0)
               {
                  avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(avatarInfo.useAvatarType)),AvatarPartType.MOUNT);
               }
               else
               {
                  mountRes = MountResManager.getMountRes(mountID);
                  if(mountRes != null)
                  {
                     pPlayer.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,mountRes.id_m),AvatarPartType.MOUNT);
                  }
               }
               avatarInfo.lastMountId = mountID;
            }
            spouseData = pPlayer.spouseData;
            spouseData.pointJinGong = $data.readDouble();
            spouseData.pointFangYu = $data.readDouble();
            spouseData.pointQingShen = $data.readDouble();
            spouseData.pointJianTi = $data.readDouble();
            spouseData.pointQianNeng = $data.readDouble();
            spouseData.yupeiID = $data.readInt();
            attrInfo.spouseName = $data.readUTF();
            attrInfo.dugu_baoji_jianmian = $data.readDouble();
            attrInfo.dugu_anqi_jianmian = $data.readDouble();
            attrInfo.dugu_anqi_dikang = $data.readDouble();
            attrInfo.dugu_gongjian_dikang = $data.readDouble();
            attrInfo.dugu_dantian_dikang = $data.readDouble();
            attrInfo.isJiHuoXianTianWuJing = $data.readByte();
            attrInfo.isJiHuoRoutiJinshen = $data.readByte() == 1;
            attrInfo.useWuhundanCount = $data.readShort();
            attrInfo.add2_bj = $data.readInt();
            attrInfo.add2_aq = $data.readInt();
            attrInfo.add2_daq = $data.readInt();
            attrInfo.add2_dgj = $data.readInt();
            attrInfo.add2_ddt = $data.readInt();
            attrInfo.useTianShengNeiliCount = $data.readShort();
            attrInfo.isHuXinYaoJiHuo = $data.readShort() == 1;
            attrInfo.isWuHunShengJiDanJiHuo = $data.readShort() == 1;
            attrInfo.starSta = $data.readShort();
            attrInfo.shenNongBaiChaoDanSta = $data.readShort();
            attrInfo.statusString = $data.readUTF();
            attrInfo.niXiStatus = $data.readShort() == 1;
            attrInfo.qianNengXinFaSta = $data.readInt();
            curWeaponID = $data.readInt();
            avatarInfo.useIng_Weapon_id = curWeaponID;
            attrInfo.taoZhuang = $data.readByte() == 1;
            avatarInfo.isFeixing = $data.readByte() == 1;
            avatarInfo.isFeixing_huanzhuang_Id = $data.readByte();
            avatarInfo.isFeixing_wuhun_Id = $data.readInt();
            attrInfo.fengHuang = $data.readByte() == 1;
            attrInfo.isHuoHunDanJiHuo = $data.readByte() == 1;
            attrInfo.wuHunShenDan = $data.readInt();
            attrInfo.isLongHunWuPoJiHuo = $data.readByte() == 1;
            attrInfo.longHunShenDan = $data.readInt();
            attrInfo.isShenFuMiJi = $data.readByte() == 1;
            attrInfo.isNeitishenqi = $data.readInt() == 1;
            attrInfo.neitishenqi = $data.readInt();
            attrInfo.prestige_zhizungongxun = $data.readInt();
            attrInfo.prestige_shenshengzhandouli = $data.readInt();
            pPlayer.isZhuanSheng = $data.readByte() == 1;
            this.peiou.setInit(tag,pPlayer);
         }
      }
      
      public function received_52232(param1:ByteArray) : void
      {
         ZLog.add("52232：接收检查是否可以新增耳语消息");
         this.peiou.setAddPrivateTalk();
      }
      
      public function received_52234(param1:ByteArray) : void
      {
         ZLog.add("52234：接收新增耳语提示消息");
         var _loc2_:Object = new Object();
         var _loc3_:Number = param1.readDouble();
         var _loc4_:Date = new Date();
         _loc4_.setTime(_loc3_);
         _loc2_.time = _loc4_.getMonth() + 1 + LanResManager.getLanCommonTextWords("月") + _loc4_.getDate() + LanResManager.getLanCommonTextWords("日") + _loc4_.getHours() + LanResManager.getLanCommonTextWords("点") + _loc4_.getMinutes() + LanResManager.getLanCommonTextWords("分");
         _loc2_.color = param1.readByte();
         _loc2_.id = param1.readInt();
         _loc2_.content = param1.readUTF();
         this.peiou.addPrivateTalk(_loc2_);
      }
      
      public function received_52238(param1:ByteArray) : void
      {
         ZLog.add("52238：接收打开玉佩更换界面消息");
         var _loc2_:Array = [];
         var _loc3_:Goods = new Goods(param1.readInt());
         _loc3_.roleID = GameInstance.mainChar.id;
         _loc3_.position = _loc3_.res.position;
         _loc2_.push(_loc3_);
         _loc2_.push(new Skill(param1.readInt()));
         _loc2_.push(new Skill(param1.readInt()));
         _loc2_.push(new Goods(param1.readInt()));
         _loc2_.push(new Goods(param1.readInt()));
         this.peiou.setSwitchYupeiCurrent(_loc2_);
      }
      
      public function received_52240(param1:ByteArray) : void
      {
         ZLog.add("52240：接收高级玉佩信息消息");
         var _loc2_:Array = [];
         _loc2_.push(new Goods(param1.readInt()));
         _loc2_.push(new Skill(param1.readInt()));
         _loc2_.push(new Skill(param1.readInt()));
         _loc2_.push(new Goods(param1.readInt()));
         _loc2_.push(new Goods(param1.readInt()));
         this.peiou.setSwitchYupeiGaoji(_loc2_);
      }
      
      public function received_52304(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Number = NaN;
         var _loc8_:Date = null;
         ZLog.add("52304：接收第一次请求耳语全部内容消息");
         var _loc2_:SpouseData = new SpouseData();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc6_ = new Object();
            _loc7_ = param1.readDouble();
            _loc8_ = new Date();
            _loc8_.setTime(_loc7_);
            _loc6_.time = _loc8_.getDate() + 1 + "-" + _loc8_.getMonth() + "-" + _loc8_.getFullYear() + "  " + _loc8_.getHours() + ":" + (_loc8_.getMinutes() < 10 ? "0" + _loc8_.getMinutes() : _loc8_.getMinutes());
            _loc6_.color = param1.readByte();
            _loc6_.id = param1.readInt();
            _loc6_.content = param1.readUTF();
            _loc5_.push(_loc6_);
            _loc3_++;
         }
         this.peiou.initPrivateTalk(_loc5_);
      }
      
      public function received_52236(param1:ByteArray) : void
      {
         ZLog.add("52236：接收删除耳语消息");
         var _loc2_:int = param1.readInt();
         this.peiou.removePrivateTalk(_loc2_);
      }
      
      public function received_52242(param1:ByteArray) : void
      {
         ZLog.add("52242：接收开始更换玉佩消息");
         this.peiou.updateCurrentYupei();
         GameInstance.mainCharData.attributeInfo.yupeiID = param1.readInt();
         PipeManager.sendMsg(PipeConstants.UPDATE_MAINCHAR_YUPEI);
      }
      
      public function received_52306(param1:ByteArray) : void
      {
         ZLog.add("52306：接收离婚成功消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte() == 1);
         this.peiou.close(_loc3_);
         GameInstance.mainCharData.attributeInfo.yupeiID = 0;
         GameInstance.mainCharData.attributeInfo.spouseID = 0;
         GameInstance.mainCharData.attributeInfo.showYuPeiGoodsId = 0;
         GameInstance.mainCharData.attributeInfo.yuPeiGoodsIDArr = [];
         PipeManager.sendMsg(PipeConstants.UPDATE_MAINCHAR_YUPEI);
         PipeManager.sendMsg(PipeConstants.LIHUN_SUCCESS);
         PipeManager.sendMsg(PipeConstants.ITEMTIP_CLEAR);
      }
      
      public function received_52308(param1:ByteArray) : void
      {
         ZLog.add("52308：接收对方协议离婚消息");
         this.peiou.xieYiLiHun();
      }
      
      public function received_52362(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Skill = null;
         var _loc8_:SkillRes = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         ZLog.add("接收52362:TA的武功 ");
         var _loc2_:Number = param1.readDouble();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc9_:PurePlayer = GameInstance.peioPlayerData;
         if(!_loc9_)
         {
            return;
         }
         _loc9_.attributeInfo.gqNow = _loc3_;
         _loc9_.skillInfo.skillLevel = _loc2_;
         var _loc10_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc15_ = 0;
            _loc16_ = 0;
            _loc17_ = 0;
            _loc18_ = 0;
            _loc19_ = 0;
            _loc20_ = 0;
            _loc22_ = 0;
            _loc23_ = param1.readInt();
            _loc6_ = param1.readByte();
            if(_loc6_ == 1)
            {
               _loc15_ = param1.readInt();
               _loc24_ = param1.readInt();
               _loc18_ = param1.readInt();
               _loc16_ = param1.readInt();
               _loc20_ = param1.readInt();
               _loc22_ = param1.readInt();
               _loc19_ = _loc18_ - _loc20_;
            }
            _loc17_ = param1.readInt();
            _loc21_ = param1.readByte();
            _loc8_ = SkillResManager.getSkillRes(_loc23_);
            _loc7_ = new Skill(_loc23_,_loc8_.position,_loc24_,_loc22_,_loc15_,_loc19_,_loc6_);
            _loc7_.copper = _loc16_;
            _loc7_.studyLevel = _loc17_;
            _loc7_.shulianCurrent = _loc20_;
            _loc7_.shulianTotal = _loc18_;
            _loc7_.isPingJingSkill = _loc21_;
            if(_loc7_.level == _loc7_.res.grade_limit)
            {
               _loc7_.isTop = 1;
            }
            else
            {
               _loc7_.isTop = 0;
            }
            _loc9_.skillInfo.addSkill(_loc7_);
            _loc10_.push(_loc7_);
            _loc5_++;
         }
         var _loc11_:Array = [];
         var _loc12_:int = param1.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc12_)
         {
            _loc25_ = param1.readInt();
            _loc6_ = param1.readByte();
            _loc26_ = 0;
            _loc27_ = 0;
            if(_loc6_ == 1)
            {
               _loc27_ = param1.readInt();
               _loc18_ = param1.readInt();
               _loc16_ = param1.readInt();
               _loc20_ = param1.readInt();
               _loc19_ = _loc18_ - _loc20_;
            }
            _loc17_ = param1.readInt();
            _loc21_ = param1.readByte();
            _loc8_ = SkillResManager.getSkillRes(_loc25_);
            _loc7_ = new Skill(_loc25_,_loc8_.position,0,_loc8_.coolingtime,_loc27_,_loc19_,_loc6_);
            _loc7_.copper = _loc16_;
            _loc7_.studyLevel = _loc17_;
            _loc7_.shulianCurrent = _loc20_;
            _loc7_.shulianTotal = _loc18_;
            _loc7_.isPingJingSkill = _loc21_;
            if(_loc7_.level == _loc7_.res.grade_limit)
            {
               _loc7_.isTop = 1;
            }
            else
            {
               _loc7_.isTop = 0;
            }
            _loc9_.skillInfo.addSkill(_loc7_);
            _loc11_.push(_loc7_);
            _loc5_++;
         }
         var _loc13_:Array = [];
         var _loc14_:int = param1.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc14_)
         {
            _loc28_ = param1.readInt();
            _loc24_ = param1.readInt();
            _loc8_ = SkillResManager.getSkillRes(_loc25_);
            _loc7_ = new Skill(_loc28_,_loc8_.position,_loc24_);
            _loc7_.isLearn = 1;
            _loc9_.skillInfo.addSkill(_loc7_);
            _loc13_.push(_loc7_);
            _loc5_++;
         }
         param1.readInt();
         this.taKungFu.updateTaKungFu();
      }
      
      public function received_52372(param1:ByteArray) : void
      {
         ZLog.add("52372：接收动TA一下消息");
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的TA动了您一下"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您的TA动了您一下"),false);
      }
      
      public function received_52374(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Skill = null;
         ZLog.add("52374:武功等级加成更新消息");
         var _loc2_:int = param1.readShort();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readDouble();
            _loc5_ = param1.readDouble();
            if(_loc4_ != 0)
            {
               _loc6_ = GameInstance.peioPlayerData.skillInfo.getSkillByID(_loc4_);
               _loc6_.levelAppend = _loc5_;
            }
            _loc3_++;
         }
         this.taKungFu.updateTaKungFu();
      }
   }
}

