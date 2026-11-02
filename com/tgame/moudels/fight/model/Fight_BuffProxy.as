package com.tgame.moudels.fight.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.utils.FilterUtil;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BuffInfo;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.manager.AutoFlyManager;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.CustomFaceManager;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.CDFaceManager;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fight_BuffProxy extends Proxy
   {
      
      public static const NAME:String = "Fight_BuffProxy";
      
      private var BUFF_P:String = "BUFF";
      
      private var apd:AvatarParamData;
      
      private var _fightProxy:Fight_proxy;
      
      private var _senderProxy:Fight_MsgSenderProxy;
      
      public function Fight_BuffProxy()
      {
         super(NAME);
      }
      
      private function get fightProxy() : Fight_proxy
      {
         if(this._fightProxy == null)
         {
            this._fightProxy = facade.retrieveProxy(Fight_proxy.NAME) as Fight_proxy;
         }
         return this._fightProxy;
      }
      
      public function get senderProxy() : Fight_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fight_MsgSenderProxy.NAME) as Fight_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function onRegister() : void
      {
      }
      
      private function showSiShengShowTips(param1:SceneCharacter, param2:int) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         switch(param2)
         {
            case OtherConst.SISHENSHOU_70012:
               _loc3_ = LanResManager.getLanTextWords(this,"朱雀战纹聚");
               break;
            case OtherConst.SISHENSHOU_70013:
               _loc3_ = LanResManager.getLanTextWords(this,"白虎战纹聚");
               break;
            case OtherConst.SISHENSHOU_70014:
               _loc3_ = LanResManager.getLanTextWords(this,"青龙战纹聚");
               break;
            case OtherConst.SISHENSHOU_70015:
               _loc3_ = LanResManager.getLanTextWords(this,"玄武战纹聚");
         }
         if(_loc3_ != null)
         {
            param1.setHeadFaceTalkText(_loc3_);
            NoticeManager.notify(NoticeManager.FOOT,_loc3_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc3_);
         }
         switch(param2)
         {
            case OtherConst.SISHENSHOU_200111:
               _loc4_ = LanResManager.getLanTextWords(this,"朱雀战纹聚30");
               break;
            case OtherConst.SISHENSHOU_200110:
               _loc4_ = LanResManager.getLanTextWords(this,"白虎战纹聚");
               break;
            case OtherConst.SISHENSHOU_200109:
               _loc4_ = LanResManager.getLanTextWords(this,"青龙战纹聚");
               break;
            case OtherConst.SISHENSHOU_200112:
               _loc4_ = LanResManager.getLanTextWords(this,"玄武战纹聚30");
         }
         if(_loc4_ != null)
         {
            param1.setHeadFaceTalkText(_loc4_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
         }
      }
      
      public function r_trigBuff(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Number, param7:int, param8:Number, param9:int, param10:String = "") : void
      {
         var buffInfo:BuffInfo;
         var cdTotal:int;
         var yinCangPlayer:Function;
         var yinchangLianzhanGuanghuan:Function;
         var sc:SceneCharacter = null;
         var buff:Buff = null;
         var apd:AvatarParamData = null;
         var date:Date = null;
         var arr:Array = null;
         var arr3:Array = null;
         var i:int = 0;
         var arr2:Array = null;
         var $buffID:int = param1;
         var $roleType:int = param2;
         var $roleID:int = param3;
         var $cdNow:int = param4;
         var $cdTotal:int = param5;
         var $chuliang:Number = param6;
         var $extraTime:int = param7;
         var $jiezhiTime:Number = param8;
         var $isShow:int = param9;
         var miaoShu:String = param10;
         this.r_cancelBuff($buffID,$roleType,$roleID,$isShow);
         sc = GameInstance.scene.getCharByID($roleID,$roleType);
         if(!sc)
         {
            return;
         }
         this.showSiShengShowTips(sc,$buffID);
         buffInfo = (sc.data as BaseCharacter).buffInfo;
         buff = new Buff($buffID);
         cdTotal = $cdTotal;
         buff.leavingCoolingtime = cdTotal - $cdNow;
         buff.currentCDTotal = cdTotal;
         buff.chuliang = $chuliang;
         buff.extraTime = $extraTime;
         buff.miaoShu = miaoShu;
         if($jiezhiTime > 0)
         {
            date = new Date();
            date.setTime($jiezhiTime);
            buff.vipTime = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear() + "  " + date.getHours() + ":" + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes());
         }
         buffInfo.addBuff(buff);
         if(buff.res.buff_flag == 0)
         {
            if(sc.isMainChar())
            {
               if($buffID == OtherConst.WEIZHENSHANHE_BUFF_ID)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = true;
               }
               else if($buffID == OtherConst.YNSHENJIANGJI_BUFF_ID)
               {
                  (sc.data as BaseCharacter).avatarInfo.isShenjiangji = true;
                  AvatarManager.updateMainAvatar(sc);
               }
               if(buff.res.type == 168)
               {
                  GameInstance.mainCharData.isShuShenShu = true;
               }
               else if(buff.res.type == 192)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = true;
               }
               if($buffID != 80200736)
               {
                  GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
                  CDFaceManager.cdPlay(buff.getID(),buff.getCoolingtime(),$cdNow,0,0,[]);
                  this.showTip(buff,$isShow);
               }
            }
         }
         else if(buff.res.buff_flag == 1)
         {
            if($buffID == OtherConst.SHUFUJUZHEN_BUFF_ID || $buffID == OtherConst.QIANKUNJUZHEN_BUFF_ID)
            {
               if(sc.isMainChar())
               {
                  GameInstance.mainCharData.isShuFuJuZhen = true;
               }
            }
            else if($buffID == OtherConst.PROTECT_BUFF_ID)
            {
               (sc.data as BaseCharacter).isInProtect = true;
               HeadFaceManager.updatePlayersName([sc.id]);
               if(sc.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
                  CDFaceManager.cdPlay(buff.getID(),buff.getCoolingtime(),$cdNow,0,0,[]);
               }
            }
            else if(OtherConst.ZHUMOZHANG_BUFF_ARR.indexOf($buffID) != -1)
            {
               (sc.data as BaseCharacter).avatarInfo.isZhumozhang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.SIWANGSHALOU_BUFF_ID)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_XUEWEI_DELAY),AvatarPartType.MAGIC);
               apd.id = SpeciaAvatarPartID.XUEWEI_DELAY;
               sc.loadAvatarPart(apd);
            }
            else if($buffID == OtherConst.RONGYAOZHIGUANG_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isQiLinAvatar = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.HUXIAOSHANLIN_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isHuXiaoShanLin = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.DAGOUBANG_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isDagoubang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.LINGHUHUANHUA_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isLingHu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.TUNTIANMIEDI_BUFF_ID)
            {
               FightManager.be_blackWhite(GameInstance.mainChar,false,"ui.darken");
            }
            else if($buffID == OtherConst.XIDUNIZHUANJIUYIN_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isLvHaMa = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == 80200779 || $buffID == 80200857)
            {
               (sc.data as BaseCharacter).avatarInfo.is255 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == 80200789)
            {
               (sc.data as BaseCharacter).avatarInfo.is256 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == 80200848)
            {
               (sc.data as BaseCharacter).avatarInfo.is257 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.ZHENGGUZHIXIN_BUFF_ID)
            {
               if(sc.id == GameInstance.mainChar.id)
               {
                  GameInstance.uiInstance.mainUI.showZhengGu();
               }
               if(sc.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
                  CDFaceManager.cdPlay(buff.getID(),buff.getCoolingtime(),$cdNow,0,0,[]);
               }
            }
            if(buff.res.type == 233)
            {
               (sc.data as BaseCharacter).avatarInfo.isShanZei = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 238)
            {
               (sc.data as BaseCharacter).avatarInfo.isQiuQianCHi = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 333)
            {
               (sc.data as BaseCharacter).avatarInfo.isMoLingZhiYuan = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 346)
            {
               (sc.data as BaseCharacter).avatarInfo.isKunShou = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 301)
            {
               (sc.data as BaseCharacter).avatarInfo.isYanMoNuPu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 294)
            {
               (sc.data as BaseCharacter).avatarInfo.isJinJiaZhanChe = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 250)
            {
               (sc.data as BaseCharacter).avatarInfo.isJianTiFengYin = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 253)
            {
               (sc.data as BaseCharacter).avatarInfo.isDiLu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 234)
            {
               (sc.data as BaseCharacter).avatarInfo.isXinShouHuanZhuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 317)
            {
               (sc.data as BaseCharacter).avatarInfo.isYuFeng = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 267)
            {
               (sc.data as BaseCharacter).avatarInfo.isChangE = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(sc.isMainChar())
            {
               if(buff.res.type == 160)
               {
                  GameInstance.mainCharData.isQiongLongShenYu = true;
               }
               if(buff.res.type == 144)
               {
                  FightManager.be_soft(GameInstance.mainChar,false);
               }
               this.showTip(buff,$isShow);
            }
            this.buffLvjing(1,sc,buff);
         }
         else if(buff.res.buff_flag == 2)
         {
            if($buffID == OtherConst.SHOUHU_BUFF_ID)
            {
               (sc.data as BaseCharacter).isShouhu = true;
               HeadFaceManager.updatePlayersName([sc.id]);
            }
            else if($buffID == 710707)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC_RING);
               apd.id = "bianpao";
               apd.depth = AvatarPartType.getDefaultDepth(AvatarPartType.MAGIC_RING);
               apd.offsetX = 40;
               sc.loadAvatarPart(apd);
            }
            else if($buffID == OtherConst.YNTIANWANG_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isTianwang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.YNYINGXIONG_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isYingxiong = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == 80200568)
            {
               (sc.data as BaseCharacter).avatarInfo.isYingxiong1 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == 80200708)
            {
               (sc.data as BaseCharacter).avatarInfo.isWANSHI = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.YNTIANMAJIAN_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isTianmajian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.YNXIONGJIJIAN_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isXiongjijian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.YNXUANBINGBIANXUEREN_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isXuanbingjian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == 80200554)
            {
               (sc.data as BaseCharacter).avatarInfo.isWuLinMengZhu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == 80200234)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC_RING);
               apd.id = "shuanglong";
               apd.depth = AvatarPartType.getDefaultDepth(AvatarPartType.MAGIC_RING);
               sc.loadAvatarPart(apd);
            }
            else if($buffID == OtherConst.YNBAILONGJIANG_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isBailongjiang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.QICAICHUANQI_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isQiCaiChuanQi = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.CIKETAOZHUANG_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isCiKeTaoZhuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.HUANGCHENGSHOUWEI_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isHuangChengShouWeiTaoZhuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.ZIJINYUPAO_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isZiJinYuPao = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.POJIXIEJIA_XINSHOUHUANZHUANG_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isXinShouHuanZhuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.WANZHONGZHUMU_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isWanZhongZhuMu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.LUOYINGBINFEN_BUFF_ID)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LUOYINGBINFEN_DELAY),AvatarPartType.MAGIC);
               apd.id = SpeciaAvatarPartID.LUOYINGBINFEN_DELAY;
               sc.loadAvatarPart(apd);
            }
            else if($buffID == OtherConst.ZHENGGUBIAOQING_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isZhenggu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.BIWUZHAOQIN_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isBiWuZhaoQinXiuQiu = true;
               AvatarManager.updateMainAvatar(sc);
               GameInstance.scene.addAlwaysShowChar(sc);
            }
            else if($buffID == OtherConst.TULONGDAO_1_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isTuLongDao_1 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.TULONGDAO_2_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isTuLongDao_2 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.TULONGDAO_3_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isTuLongDao_3 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.TULONGDAO_4_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isTuLongDao_4 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.TULONGDAO_5_BUFF_ID)
            {
               (sc.data as BaseCharacter).avatarInfo.isTuLongDao_5 = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if($buffID == OtherConst.SHENGSIFUZHOU_SHENG_BUFF_ID)
            {
               (sc.data as Player).attributeInfo.shengsifu = 1;
               HeadFaceManager.updateCharSkillLevel($roleID,(sc.data as Player).skillInfo.skillLevel);
            }
            else if($buffID == OtherConst.SHENGSIFUZHOU_SI_BUFF_ID)
            {
               (sc.data as Player).attributeInfo.shengsifu = 2;
               HeadFaceManager.updateCharSkillLevel($roleID,(sc.data as Player).skillInfo.skillLevel);
            }
            else if($buffID == OtherConst.ZHENLONGQI_HEI_BUFF_ID)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.ZHENLONGQI_HEI),AvatarPartType.MAGIC);
               apd.id = "zhenlongq---hei";
               sc.loadAvatarPart(apd);
            }
            else if($buffID == OtherConst.ZHENLONGQI_BAI_BUFF_ID)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,OtherConst.ZHENLONGQI_BAI),AvatarPartType.MAGIC);
               apd.id = "zhenlongq";
               sc.loadAvatarPart(apd);
            }
            else if($buffID == OtherConst.YN_CHENGFA_BUFF_ID)
            {
               (sc.data as Player).attributeInfo.YNchengfaStatus = 1;
               HeadFaceManager.updateCharSkillLevel($roleID,(sc.data as Player).skillInfo.skillLevel);
            }
            if(buff.res.type == 183)
            {
               (sc.data as BaseCharacter).avatarInfo.isJiGuanGuai = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 226)
            {
               (sc.data as BaseCharacter).avatarInfo.isMingJieZhanShen = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 244)
            {
               (sc.data as BaseCharacter).avatarInfo.isMeiRenJi = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 240)
            {
               (sc.data as BaseCharacter).avatarInfo.isZhaoYun = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 335)
            {
               (sc.data as BaseCharacter).avatarInfo.isHeiAnMoJun = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 297)
            {
               (sc.data as BaseCharacter).avatarInfo.isHuGuoShenJiang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 299)
            {
               (sc.data as BaseCharacter).avatarInfo.isHuangJinYinZhe = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 295)
            {
               (sc.data as BaseCharacter).avatarInfo.isZiLingShou = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 287)
            {
               (sc.data as BaseCharacter).avatarInfo.isBaoMeiRen = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 288)
            {
               (sc.data as BaseCharacter).avatarInfo.isJiaLouLuo = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 286)
            {
               (sc.data as BaseCharacter).avatarInfo.isShiHua = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 292)
            {
               (sc.data as BaseCharacter).avatarInfo.isYinYangDaoRen = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 303)
            {
               (sc.data as BaseCharacter).avatarInfo.isJiGong = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 304)
            {
               (sc.data as BaseCharacter).avatarInfo.isLuoHan = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 306)
            {
               (sc.data as BaseCharacter).avatarInfo.isXiangYangDaJiang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 293)
            {
               AvatarManager.updateJingmaiAvatar1(sc,20);
            }
            if(buff.res.type == 243)
            {
               (sc.data as BaseCharacter).avatarInfo.isZhaoYun_Jin = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 268)
            {
               (sc.data as BaseCharacter).avatarInfo.isZhaoMin = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 269)
            {
               (sc.data as BaseCharacter).avatarInfo.isXiongBa = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 273)
            {
               (sc.data as BaseCharacter).avatarInfo.isSanShengMu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 316)
            {
               (sc.data as BaseCharacter).avatarInfo.isShaMoFeiYing = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 325)
            {
               (sc.data as BaseCharacter).avatarInfo.isTianShiEMo = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 332)
            {
               (sc.data as BaseCharacter).avatarInfo.isBaiMianShuSheng = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 341)
            {
               (sc.data as BaseCharacter).avatarInfo.isHongLianXianZi = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 348)
            {
               (sc.data as BaseCharacter).avatarInfo.isChiYou = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 320)
            {
               (sc.data as BaseCharacter).avatarInfo.isTieShanGongZhu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 284)
            {
               (sc.data as BaseCharacter).avatarInfo.isTianZhao = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 282)
            {
               (sc.data as BaseCharacter).avatarInfo.isNiYan = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 285)
            {
               (sc.data as BaseCharacter).avatarInfo.isYingXiongShouWei = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 274)
            {
               (sc.data as BaseCharacter).avatarInfo.isShuShanShenQi = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 281)
            {
               (sc.data as BaseCharacter).avatarInfo.isZiYinDao = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 310)
            {
               (sc.data as BaseCharacter).avatarInfo.isRiYueShenJian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 296)
            {
               (sc.data as BaseCharacter).avatarInfo.isXuanYuanShenJian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 302)
            {
               (sc.data as BaseCharacter).avatarInfo.isMoJian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 315)
            {
               (sc.data as BaseCharacter).avatarInfo.isMoDao = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 319)
            {
               (sc.data as BaseCharacter).avatarInfo.isBaJiaoShan = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 322)
            {
               (sc.data as BaseCharacter).avatarInfo.isXiaLvTuMo = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 327)
            {
               (sc.data as BaseCharacter).avatarInfo.isFengLei = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 329)
            {
               (sc.data as BaseCharacter).avatarInfo.isLiuXingLuo = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 334)
            {
               (sc.data as BaseCharacter).avatarInfo.isXieLongMoJian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 336)
            {
               (sc.data as BaseCharacter).avatarInfo.isXueWu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 339)
            {
               (sc.data as BaseCharacter).avatarInfo.isJuLongZhiJi = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 342)
            {
               (sc.data as BaseCharacter).avatarInfo.isSuiHunYinXue = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 343)
            {
               (sc.data as BaseCharacter).avatarInfo.isSuiHunZhiShang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 351)
            {
               (sc.data as BaseCharacter).avatarInfo.isHanGuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 312)
            {
               (sc.data as BaseCharacter).avatarInfo.isBingJingHu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 245)
            {
               (sc.data as BaseCharacter).avatarInfo.isPoTian = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 248)
            {
               (sc.data as BaseCharacter).avatarInfo.isYangguo = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 249)
            {
               (sc.data as BaseCharacter).avatarInfo.isXiaolongnv = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 254)
            {
               (sc.data as BaseCharacter).avatarInfo.isGuoXiang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 255)
            {
               (sc.data as BaseCharacter).avatarInfo.isLiMoChou = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 259)
            {
               (sc.data as BaseCharacter).avatarInfo.isYinZhiPing = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 270)
            {
               (sc.data as BaseCharacter).avatarInfo.isLinghuchong = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 271)
            {
               (sc.data as BaseCharacter).avatarInfo.isRenyingying = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 278)
            {
               (sc.data as BaseCharacter).avatarInfo.isYuebuqun = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 280)
            {
               (sc.data as BaseCharacter).avatarInfo.isRenWoXing = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 349)
            {
               (sc.data as BaseCharacter).avatarInfo.isDuanYu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 350)
            {
               (sc.data as BaseCharacter).avatarInfo.isWangYuYan = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 353)
            {
               (sc.data as BaseCharacter).avatarInfo.isXuZhu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 230)
            {
               (sc.data as BaseCharacter).avatarInfo.isBuSiJinShen = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 139)
            {
               (sc.data as BaseCharacter).avatarInfo.isRongYuHuanZhong = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 174)
            {
               (sc.data as BaseCharacter).avatarInfo.isZijinHuanzhuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 252)
            {
               (sc.data as BaseCharacter).avatarInfo.isQiXiHuanZhuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 187)
            {
               (sc.data as BaseCharacter).avatarInfo.isHuanYingXiaDao = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 308)
            {
               (sc.data as BaseCharacter).avatarInfo.isShuangRenFengXing_ZhongQiu = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 307)
            {
               (sc.data as BaseCharacter).avatarInfo.isYueTuHuanZhuang = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 211)
            {
               (sc.data as BaseCharacter).avatarInfo.isWangZheXueSha = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 196)
            {
               (sc.data as BaseCharacter).avatarInfo.isHuangJinLongLinJia = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 206)
            {
               (sc.data as BaseCharacter).avatarInfo.isFanTongXianJue = true;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 203)
            {
               (sc.data as BaseCharacter).isBuNengXuanRen = true;
               if(sc.isMainChar())
               {
                  PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
                  PipeManager.sendMsg(PipeConstants.SHOW_LOCK_CHAR,[]);
               }
            }
            if(buff.res.type >= 179 && buff.res.type <= 182)
            {
               (sc.data as BaseCharacter).avatarInfo.isLangRen = buff.res.type - 179 + 1;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 225)
            {
               (sc.data as BaseCharacter).avatarInfo.isLangRen = 4;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 459)
            {
               (sc.data as BaseCharacter).avatarInfo.isJingLeiQiang = 1;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 460)
            {
               (sc.data as BaseCharacter).avatarInfo.isJingLeiQiang = 2;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 461)
            {
               (sc.data as BaseCharacter).avatarInfo.isJingLeiQiang = 3;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 462)
            {
               (sc.data as BaseCharacter).avatarInfo.isJingLeiQiang = 4;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 463)
            {
               (sc.data as BaseCharacter).avatarInfo.isJingLeiQiang = 5;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 464)
            {
               (sc.data as BaseCharacter).avatarInfo.isJingLeiQiang = 6;
               AvatarManager.updateMainAvatar(sc);
            }
            if(buff.res.type == 465)
            {
               (sc.data as BaseCharacter).avatarInfo.isJingLeiQiang = 7;
               AvatarManager.updateMainAvatar(sc);
            }
            else if(buff.res.type == 2000)
            {
               if(buff.res.res_type == 1)
               {
                  (sc.data as BaseCharacter).avatarInfo.isDaHuanZhuang = true;
               }
               else if(buff.res.res_type == 2)
               {
                  (sc.data as BaseCharacter).avatarInfo.isXiaoHuanZhuang = true;
               }
               else if(buff.res.res_type == 3)
               {
                  (sc.data as BaseCharacter).avatarInfo.isWuQiHuanZhuang = true;
               }
               else if(buff.res.res_type == 4)
               {
                  (sc.data as BaseCharacter).avatarInfo.isGongJianHuanZhuang = true;
               }
               else if(buff.res.res_type == 5)
               {
                  (sc.data as BaseCharacter).avatarInfo.isZuoQiHuanZhuang = true;
               }
               else if(buff.res.res_type == 7)
               {
                  (sc.data as BaseCharacter).avatarInfo.isDaHuanZhuang_WUMA = true;
               }
               else if(buff.res.res_type == 8)
               {
                  (sc.data as BaseCharacter).avatarInfo.isDaHuanZhuang_QUANPINGBI = true;
               }
               else if(buff.res.res_type == 9)
               {
                  (sc.data as Player).attributeInfo.buffType_9 = true;
               }
               arr = buff.res.res_ids.split(";");
               arr3 = [];
               i = 0;
               while(i < arr.length)
               {
                  arr2 = arr[i].split("_");
                  arr3[arr2[0]] = arr2[1];
                  i++;
               }
               if(sc == GameInstance.mainChar)
               {
                  AvatarManager.body_AvatarID_by_AvatarType_dict_Main[buff.res.res_type] = arr3;
               }
               else
               {
                  AvatarManager.body_AvatarID_by_AvatarType_dict[buff.res.res_type] = arr3;
               }
               AvatarManager.updateMainAvatar(sc);
               if(buff.res.id_e != 0)
               {
                  apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC_RING);
                  apd.id = "effect" + buff.res.id_e;
                  apd.depth = AvatarPartType.getDefaultDepth(AvatarPartType.MAGIC_RING);
                  sc.loadAvatarPart(apd);
               }
            }
            if(sc.isMainChar())
            {
               if($buffID == OtherConst.WEIZHENSHANHE_BUFF_ID)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = true;
               }
               if(buff.res.type == 192)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = true;
               }
               if(buff.res.type == 154)
               {
                  GameInstance.mainCharData.isBind = true;
                  PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
                  PipeManager.sendMsg(PipeConstants.SHOW_LOCK_CHAR,[$buffID,2]);
               }
               if(buff.res.type == 7058)
               {
               }
               if($buffID == OtherConst.JINCHANTUOQIAN_BUFF_ID || $buffID == OtherConst.SHENLONGBAIWEI_BUFF_ID || $buffID == OtherConst.ZIJINHULU_BUFF_ID || $buffID == OtherConst.DUNYINGWUZONG_BUFF_ID || $buffID == OtherConst.YANYUELINGYU_YINSHEN_BUFF_ID || $buffID == OtherConst.WANFAZIZAI_BUFF_ID || $buffID == OtherConst.HUANYINGFENSHEN_BUFF_ID)
               {
                  sc.isMask = true;
               }
               GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
               CDFaceManager.cdPlay(buff.getID(),buff.getCoolingtime(),$cdNow,0,0,[]);
               this.showTip(buff,$isShow);
            }
            this.buffLvjing(1,sc,buff);
         }
         else if(buff.res.buff_flag == 3)
         {
            if($buffID == OtherConst.VIP_BUFF_ID || $buffID == 80000)
            {
               if(sc.isMainChar())
               {
                  GameInstance.mainCharData.attributeInfo.isVIP = 1;
                  GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
                  this.showTip(buff,$isShow);
               }
            }
            else if($buffID == OtherConst.KANQI_BUFF_ID)
            {
               (sc.data as BaseCharacter).isInKanqi = true;
               HeadFaceManager.updatePlayersName([sc.id]);
               if(sc.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
                  this.showTip(buff,$isShow);
               }
            }
            else if($buffID == OtherConst.HUQI_BUFF_ID)
            {
               (sc.data as BaseCharacter).isInHuqi = true;
               HeadFaceManager.updatePlayersName([sc.id]);
               if(sc.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
                  this.showTip(buff,$isShow);
               }
            }
            else if(sc.isMainChar())
            {
               GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
               this.showTip(buff,$isShow);
            }
         }
         else if(buff.res.buff_flag == 4)
         {
            if(buff.res.type == 172 && GameInstance.lockOnChar == sc)
            {
               PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
            }
            if(sc.isMainChar())
            {
               GameInstance.uiInstance.mainUI.addBuff(buff,buffInfo.getBottomBuff());
               CDFaceManager.cdPlay(buff.getID(),buff.getCoolingtime(),$cdNow,0,0,[]);
            }
            if(sc.isMainChar())
            {
               this.showTip(buff,$isShow);
            }
         }
         if(sc.isMainChar() && OtherConst.isLianZhanBuff($buffID))
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LIANZHAN_BUFF),AvatarPartType.MAGIC);
            GameInstance.mainChar.loadAvatarPart(apd);
         }
         if(buff.res.type == 129 && buff.res.id_e != 0)
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC);
            GameInstance.mainChar.loadAvatarPart(apd);
         }
         else if(buff.res.type == 266 && buff.res.id_e != 0)
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC_RING);
            apd.id = "zhutou";
            apd.depth = AvatarPartType.getDefaultDepth(AvatarPartType.MAGIC_RING);
            sc.loadAvatarPart(apd);
         }
         else if(buff.res.id_e != 0 && $buffID == 200586)
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC);
            sc.loadAvatarPart(apd);
         }
         else if(buff.res.id_e != 0 && buff.res.type == 190 && $buffID != OtherConst.RULAISHENZHANG_BUFF_ID)
         {
            yinCangPlayer = function():void
            {
               if((sc.data as BaseCharacter).avatarInfo.isRuLaiShenZhang)
               {
                  sc.visible = false;
                  sc.showContainer.visible = false;
               }
            };
            (sc.data as BaseCharacter).avatarInfo.isRuLaiShenZhang = true;
            if($buffID == 200667 || $buffID == 200668 || $buffID == 200669 || $buffID == 200670 || $buffID == 200671 || $buffID == 200674 || $buffID == 200675 || $buffID == 200676 || $buffID == 200677 || $buffID == 200678)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC);
               apd.extendCallBack(null,null,null,yinCangPlayer);
               sc.loadAvatarPart(apd);
            }
            else
            {
               yinCangPlayer();
            }
         }
         else if($buffID == 80200285 && buff.res.id_e != 0)
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,buff.res.id_e),AvatarPartType.MAGIC_RING);
            apd.depth = AvatarPartType.getDefaultDepth(AvatarPartType.MAGIC_RING);
            apd.repeat = 1;
            sc.loadAvatarPart(apd);
         }
         else if(buff.res.id_e != 0)
         {
            yinchangLianzhanGuanghuan = function():void
            {
               if(OtherConst.isLianZhanBuff($buffID))
               {
                  (sc.data as BaseCharacter).buffInfo.lianzhaoBuffName = BUFF_P + buff.res.id_e;
                  if((sc.data as BaseCharacter).avatarInfo.isYouyong)
                  {
                     if((sc.data as BaseCharacter).buffInfo.lianzhaoBuffName != "")
                     {
                        sc.hideAvatarPartByID((sc.data as BaseCharacter).buffInfo.lianzhaoBuffName);
                     }
                  }
               }
               if($buffID == OtherConst.JINGANGFUMOJU_BUFF_ID)
               {
                  (sc.data as BaseCharacter).buffInfo.jingangFumojueBuffName = BUFF_P + buff.res.id_e;
                  if((sc.data as BaseCharacter).avatarInfo.isYouyong)
                  {
                     if((sc.data as BaseCharacter).buffInfo.jingangFumojueBuffName != "")
                     {
                        sc.hideAvatarPartByID((sc.data as BaseCharacter).buffInfo.jingangFumojueBuffName);
                     }
                  }
               }
            };
            apd = new AvatarParamData(buff.getAvatarPath_Buff(),AvatarPartType.MAGIC_RING);
            apd.id = this.BUFF_P + buff.res.id_e;
            if(buff.res.type == 154 || buff.res.type == 124 || buff.res.type == 7058)
            {
               apd.depth = AvatarPartType.getDefaultDepth(AvatarPartType.MAGIC_RING);
            }
            else
            {
               apd.depth = OtherConst.LIANZHAN_DEPTH;
            }
            apd.useSpecilizeXY = false;
            apd.extendCallBack(null,null,null,null,yinchangLianzhanGuanghuan);
            sc.loadAvatarPart(apd);
         }
      }
      
      private function buffLvjing(param1:int, param2:SceneCharacter, param3:Buff) : void
      {
         var _loc4_:Array = null;
         var _loc5_:ColorMatrixFilter = null;
         var _loc6_:int = param3.id;
         if(_loc6_ == OtherConst.XUEMOFUTI_BUFF_ID)
         {
            if(param1 == 1)
            {
               _loc5_ = FilterUtil.getFilter_ChiXueMoZhen();
               param2.removeColorFilter("buff");
               param2.addColorFilter("buff",_loc5_);
            }
            else if(param1 == 2)
            {
               param2.removeColorFilter("buff");
               this.buffXunhuanLvjing(param2);
            }
         }
         if(_loc6_ == OtherConst.EMOZHISHOU_BUFF_ID)
         {
            if(param1 == 1)
            {
               _loc5_ = FilterUtil.getFilter_EMoZhiShou();
               param2.removeColorFilter("buff");
               param2.addColorFilter("buff",_loc5_);
            }
            else if(param1 == 2)
            {
               param2.removeColorFilter("buff");
               this.buffXunhuanLvjing(param2);
            }
         }
      }
      
      private function buffXunhuanLvjing(param1:SceneCharacter) : void
      {
         var _loc5_:Buff = null;
         var _loc7_:Buff = null;
         var _loc2_:BuffInfo = (param1.data as BaseCharacter).buffInfo;
         var _loc3_:Array = _loc2_.buffArr;
         var _loc4_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc7_ = _loc3_[_loc6_];
            if(_loc7_.id == OtherConst.XUEMOFUTI_BUFF_ID || _loc7_.id == OtherConst.EMOZHISHOU_BUFF_ID)
            {
               if(_loc5_ == null)
               {
                  _loc5_ = _loc7_;
               }
               else if(_loc5_.currentCDTotal > _loc7_.currentCDTotal)
               {
                  _loc5_ = _loc7_;
               }
               _loc4_ = true;
            }
            _loc6_++;
         }
         if(_loc4_)
         {
            this.buffLvjing(1,param1,_loc5_);
         }
      }
      
      private function showTip(param1:Buff, param2:int) : void
      {
         if(param2 == 0)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您获得了状态",[param1.res.name,param1.res.desc_short]),false);
         }
      }
      
      public function r_cancelBuff(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         var _loc5_:SceneCharacter = GameInstance.scene.getCharByID(param3,param2);
         if(!_loc5_)
         {
            return;
         }
         var _loc6_:BuffInfo = (_loc5_.data as BaseCharacter).buffInfo;
         var _loc7_:Buff = _loc6_.getBuff(param1);
         if(_loc7_ == null)
         {
            return;
         }
         _loc6_.removeBuff(param1);
         if(_loc7_.res.buff_flag == 0)
         {
            if(_loc5_.isMainChar())
            {
               if(param1 == OtherConst.WEIZHENSHANHE_BUFF_ID)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = false;
               }
               else if(param1 == OtherConst.YNSHENJIANGJI_BUFF_ID)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isShenjiangji = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
               if(_loc7_.res.type == 168)
               {
                  GameInstance.mainCharData.isShuShenShu = false;
               }
               else if(_loc7_.res.type == 192)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = false;
               }
               GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
               if(param4 == 0 && param1 != 80200736)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
               }
            }
         }
         else if(_loc7_.res.buff_flag == 1)
         {
            if(param1 == OtherConst.SHUFUJUZHEN_BUFF_ID || param1 == OtherConst.QIANKUNJUZHEN_BUFF_ID)
            {
               if(_loc5_.isMainChar())
               {
                  GameInstance.mainCharData.isShuFuJuZhen = false;
               }
            }
            else if(param1 == OtherConst.PROTECT_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).isInProtect = false;
               HeadFaceManager.updatePlayersName([_loc5_.id]);
               if(_loc5_.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
               }
            }
            else if(OtherConst.ZHUMOZHANG_BUFF_ARR.indexOf(param1) != -1)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isZhumozhang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.SIWANGSHALOU_BUFF_ID)
            {
               _loc5_.removeAvatarPartByID(SpeciaAvatarPartID.XUEWEI_DELAY);
            }
            else if(param1 == OtherConst.RONGYAOZHIGUANG_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isQiLinAvatar = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.HUXIAOSHANLIN_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isHuXiaoShanLin = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.DAGOUBANG_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isDagoubang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.LINGHUHUANHUA_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLingHu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.XIDUNIZHUANJIUYIN_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLvHaMa = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.ZHENGGUZHIXIN_BUFF_ID)
            {
               if(_loc5_.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
               }
            }
            else if(param1 == 80200779 || param1 == 80200857)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.is255 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == 80200789)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.is256 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == 80200848)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.is257 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 233)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isShanZei = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 238)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isQiuQianCHi = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 333)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isMoLingZhiYuan = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 346)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isKunShou = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 301)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYanMoNuPu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 294)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isJinJiaZhanChe = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 317)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYuFeng = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 267)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isChangE = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 250)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isJianTiFengYin = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 253)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isDiLu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 234)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXinShouHuanZhuang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 266)
            {
               _loc5_.removeAvatarPartByID("zhutou");
            }
            CustomFaceManager.removeBuffFace(_loc5_,param1);
            if(_loc5_.isMainChar())
            {
               if(_loc7_.res.type == 160)
               {
                  GameInstance.mainCharData.isQiongLongShenYu = false;
               }
               if(_loc7_.res.type == 144)
               {
                  FightManager.be_soft(GameInstance.mainChar,true);
               }
               if(param4 == 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
               }
            }
            this.buffLvjing(2,_loc5_,_loc7_);
         }
         else if(_loc7_.res.buff_flag == 2)
         {
            if(param1 == OtherConst.SHOUHU_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).isShouhu = false;
               HeadFaceManager.updatePlayersName([_loc5_.id]);
            }
            if(param1 == 710707)
            {
               _loc5_.removeAvatarPartByID("bianpao");
            }
            if(_loc7_.res.type == 183)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isJiGuanGuai = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(param1 == 80200234)
            {
               _loc5_.removeAvatarPartByID("shuanglong");
            }
            else if(param1 == OtherConst.YNBAILONGJIANG_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isBailongjiang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == 80200554)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isWuLinMengZhu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(param1 == OtherConst.YNTIANWANG_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTianwang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.YNYINGXIONG_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYingxiong = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == 80200568)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYingxiong1 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == 80200708)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isWANSHI = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.YNTIANMAJIAN_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTianmajian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.YNXIONGJIJIAN_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXiongjijian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.YNXUANBINGBIANXUEREN_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXuanbingjian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.CIKETAOZHUANG_BUFF_ID)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isCiKeTaoZhuang = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(param1 == OtherConst.HUANGCHENGSHOUWEI_BUFF_ID)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isHuangChengShouWeiTaoZhuang = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(param1 == OtherConst.ZIJINYUPAO_BUFF_ID)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isZiJinYuPao = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(param1 == OtherConst.POJIXIEJIA_XINSHOUHUANZHUANG_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXinShouHuanZhuang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.BIWUZHAOQIN_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isBiWuZhaoQinXiuQiu = false;
               AvatarManager.updateMainAvatar(_loc5_);
               GameInstance.scene.removeAlwaysShowChar(_loc5_);
            }
            else if(param1 == OtherConst.TULONGDAO_1_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTuLongDao_1 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.TULONGDAO_2_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTuLongDao_2 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.TULONGDAO_3_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTuLongDao_3 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.TULONGDAO_4_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTuLongDao_4 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.TULONGDAO_5_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTuLongDao_5 = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 226)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isMingJieZhanShen = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 244)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isMeiRenJi = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 240)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isZhaoYun = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 335)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isHeiAnMoJun = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 297)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isHuGuoShenJiang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 299)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isHuangJinYinZhe = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 295)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isZiLingShou = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 287)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isBaoMeiRen = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 288)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isJiaLouLuo = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 286)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isShiHua = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 292)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYinYangDaoRen = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 303)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isJiGong = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 304)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLuoHan = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 306)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXiangYangDaJiang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 293)
            {
               AvatarManager.updateJingmaiAvatar1(_loc5_,-1);
            }
            if(_loc7_.res.type == 243)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isZhaoYun_Jin = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 268)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isZhaoMin = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 269)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXiongBa = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 273)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isSanShengMu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 316)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isShaMoFeiYing = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 320)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTieShanGongZhu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 325)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTianShiEMo = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 332)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isBaiMianShuSheng = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 341)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isHongLianXianZi = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 348)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isChiYou = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 312)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isBingJingHu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 284)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isTianZhao = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 282)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isNiYan = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 285)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYingXiongShouWei = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 274)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isShuShanShenQi = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 281)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isZiYinDao = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 310)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isRiYueShenJian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 296)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXuanYuanShenJian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 302)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isMoJian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 315)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isMoDao = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 319)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isBaJiaoShan = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 322)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXiaLvTuMo = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 327)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isFengLei = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 329)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLiuXingLuo = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 334)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXieLongMoJian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 336)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXueWu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 339)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isJuLongZhiJi = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 342)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isSuiHunYinXue = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 343)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isSuiHunZhiShang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 351)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isHanGuang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 245)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isPoTian = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 248)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYangguo = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 249)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXiaolongnv = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 254)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isGuoXiang = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 255)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLiMoChou = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 259)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYinZhiPing = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 270)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLinghuchong = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 271)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isRenyingying = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 278)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isYuebuqun = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 280)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isRenWoXing = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 349)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isDuanYu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 350)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isWangYuYan = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 353)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isXuZhu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 230)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isBuSiJinShen = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 139)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isRongYuHuanZhong = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(param1 == OtherConst.QICAICHUANQI_BUFF_ID)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isQiCaiChuanQi = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(_loc7_.res.type == 174)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isZijinHuanzhuang = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(_loc7_.res.type == 252)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isQiXiHuanZhuang = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(_loc7_.res.type == 187)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isHuanYingXiaDao = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(_loc7_.res.type == 308)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isShuangRenFengXing_ZhongQiu = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(_loc7_.res.type == 307)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isYueTuHuanZhuang = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(_loc7_.res.type == 211)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isWangZheXueSha = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(param1 == OtherConst.ZHENGGUBIAOQING_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isZhenggu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(param1 == OtherConst.LUOYINGBINFEN_BUFF_ID)
            {
               _loc5_.removeAvatarPartByID(SpeciaAvatarPartID.LUOYINGBINFEN_DELAY);
            }
            else if(_loc7_.res.type == 196)
            {
               if(!_loc6_.getBuffType(_loc7_.res.type))
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isHuangJinLongLinJia = false;
                  AvatarManager.updateMainAvatar(_loc5_);
               }
            }
            else if(_loc7_.res.type == 206)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isFanTongXianJue = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            else if(_loc7_.res.type == 203)
            {
               (_loc5_.data as BaseCharacter).isBuNengXuanRen = false;
            }
            if(param1 == OtherConst.SHENGSIFUZHOU_SHENG_BUFF_ID || param1 == OtherConst.SHENGSIFUZHOU_SI_BUFF_ID)
            {
               (_loc5_.data as Player).attributeInfo.shengsifu = -1;
               HeadFaceManager.updateCharSkillLevel(param3,(_loc5_.data as Player).skillInfo.skillLevel);
            }
            if(_loc7_.res.type >= 179 && _loc7_.res.type <= 182)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLangRen = 0;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 225)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isLangRen = 0;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(param1 == OtherConst.WANZHONGZHUMU_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isWanZhongZhuMu = false;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 459 || _loc7_.res.type == 460 || _loc7_.res.type == 461 || _loc7_.res.type == 462 || _loc7_.res.type == 463 || _loc7_.res.type == 464 || _loc7_.res.type == 465)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isJingLeiQiang = 0;
               AvatarManager.updateMainAvatar(_loc5_);
            }
            if(_loc7_.res.type == 2000)
            {
               if(_loc7_.res.res_type == 1)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isDaHuanZhuang = false;
               }
               else if(_loc7_.res.res_type == 2)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isXiaoHuanZhuang = false;
               }
               else if(_loc7_.res.res_type == 3)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isWuQiHuanZhuang = false;
               }
               else if(_loc7_.res.res_type == 4)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isGongJianHuanZhuang = false;
               }
               else if(_loc7_.res.res_type == 5)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isZuoQiHuanZhuang = false;
               }
               else if(_loc7_.res.res_type == 7)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isDaHuanZhuang_WUMA = false;
               }
               else if(_loc7_.res.res_type == 8)
               {
                  (_loc5_.data as BaseCharacter).avatarInfo.isDaHuanZhuang_QUANPINGBI = false;
               }
               else if(_loc7_.res.res_type == 9)
               {
                  (_loc5_.data as Player).attributeInfo.buffType_9 = false;
               }
               AvatarManager.updateMainAvatar(_loc5_);
               if(param1 == 215513)
               {
                  _loc5_.removeAvatarPartByID("jueshihaojian");
               }
               if(param1 == 215515)
               {
                  _loc5_.removeAvatarPartByID("xueyinkuangdao");
               }
               if(_loc7_.res.id_e != 0)
               {
                  _loc5_.removeAvatarPartByID("effect" + _loc7_.res.id_e);
               }
            }
            if(param1 == OtherConst.YN_CHENGFA_BUFF_ID)
            {
               (_loc5_.data as Player).attributeInfo.YNchengfaStatus = -1;
               HeadFaceManager.updateCharSkillLevel(param3,(_loc5_.data as Player).skillInfo.skillLevel);
            }
            if(_loc7_.res.type == 190)
            {
               (_loc5_.data as BaseCharacter).avatarInfo.isRuLaiShenZhang = false;
               if((_loc5_.data as BaseCharacter).avatarInfo.isRuLaiShenZhang == false)
               {
                  _loc5_.visible = true;
                  _loc5_.showContainer.visible = true;
               }
            }
            if(_loc5_.isMainChar())
            {
               if(param1 == OtherConst.WEIZHENSHANHE_BUFF_ID)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = false;
               }
               if(_loc7_.res.type == 192)
               {
                  GameInstance.mainCharData.isWeiZhenShanHe = false;
               }
               if(_loc7_.res.type == 154)
               {
                  if(!_loc6_.getBuffType(_loc7_.res.type))
                  {
                     GameInstance.mainCharData.isBind = false;
                     PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
                     PipeManager.sendMsg(PipeConstants.SHOW_LOCK_CHAR,[]);
                  }
               }
               if(param1 == OtherConst.JINCHANTUOQIAN_BUFF_ID || param1 == OtherConst.SHENLONGBAIWEI_BUFF_ID || param1 == OtherConst.ZIJINHULU_BUFF_ID || param1 == OtherConst.DUNYINGWUZONG_BUFF_ID || param1 == OtherConst.YANYUELINGYU_YINSHEN_BUFF_ID || param1 == OtherConst.WANFAZIZAI_BUFF_ID || param1 == OtherConst.HUANYINGFENSHEN_BUFF_ID)
               {
                  _loc5_.isMask = false;
               }
               CustomFaceManager.removeBuffFace(_loc5_,param1);
               GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
               if(param4 == 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
               }
            }
            this.buffLvjing(2,_loc5_,_loc7_);
         }
         else if(_loc7_.res.buff_flag == 3)
         {
            if(param1 == OtherConst.VIP_BUFF_ID || param1 == 80000)
            {
               if(_loc5_.isMainChar())
               {
                  GameInstance.mainCharData.attributeInfo.isVIP = 0;
                  GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
                  if(param4 == 0)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
                  }
               }
            }
            else if(param1 == OtherConst.KANQI_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).isInKanqi = false;
               HeadFaceManager.updatePlayersName([_loc5_.id]);
               if(_loc5_.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
                  if(param4 == 0)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
                  }
               }
            }
            else if(param1 == OtherConst.HUQI_BUFF_ID)
            {
               (_loc5_.data as BaseCharacter).isInHuqi = false;
               HeadFaceManager.updatePlayersName([_loc5_.id]);
               if(_loc5_.isMainChar())
               {
                  GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
                  if(param4 == 0)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
                  }
               }
            }
            else if(_loc5_.isMainChar())
            {
               GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
               if(param4 == 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
               }
            }
         }
         else if(_loc7_.res.buff_flag == 4)
         {
            if(_loc5_.isMainChar())
            {
               GameInstance.uiInstance.mainUI.delBuff(param1,_loc6_.getBottomBuff());
            }
            CustomFaceManager.removeBuffFace(_loc5_,param1);
            if(_loc5_.isMainChar())
            {
               if(param4 == 0)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"状态已消失",[_loc7_.res.name]),false);
               }
            }
         }
         _loc5_.removeAvatarPartByID(this.BUFF_P + _loc7_.res.id_e);
         if(OtherConst.isLianZhanBuff(param1))
         {
            (_loc5_.data as BaseCharacter).buffInfo.lianzhaoBuffName = "";
         }
         if(param1 == OtherConst.JINGANGFUMOJU_BUFF_ID)
         {
            (_loc5_.data as BaseCharacter).buffInfo.jingangFumojueBuffName = "";
         }
      }
      
      public function feidadiao(param1:int, param2:int) : void
      {
         var fei:Function;
         var po:Array = null;
         var fei1:Function = null;
         var fei2:Function = null;
         var roleID:int = param1;
         var zuoqiID:int = param2;
         var sc:SceneCharacter = GameInstance.scene.getCharByID(roleID,SceneCharacterType.PLAYER);
         if(!sc)
         {
            return;
         }
         if(zuoqiID != 0)
         {
            (sc.data as BaseCharacter).avatarInfo.isBiWuZhaoQinFeiDaDiao = true;
            (sc.data as BaseCharacter).avatarInfo.biWuZhaoQinFeiDaDiao_id = zuoqiID;
            (sc.data as BaseCharacter).avatarInfo.biWuZhaoQinFeiDaDiao_qicheng_zhuangtai = sc.isOnMount;
            (sc.data as BaseCharacter).avatarInfo.biWuZhaoQinFeiDaDiao_zuoqi = (sc.data as BaseCharacter).avatarInfo.apd_mount;
            sc.isOnMount = true;
            (sc.data as BaseCharacter).avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Others("res/data/avatar/clothes/mid" + zuoqiID + "."),AvatarPartType.MOUNT);
            AvatarManager.updateMainAvatar(sc);
            sc.setSpeed(200);
            if(sc.isMainChar())
            {
               fei = function():void
               {
                  var _loc1_:Point = null;
                  if(po.length <= 1)
                  {
                     _loc1_ = po[0];
                     AutoFlyManager.mainCharAutoFly_biwuZhaoqin(_loc1_,fei2,true);
                  }
                  else
                  {
                     _loc1_ = po[0];
                     AutoFlyManager.mainCharAutoFly_biwuZhaoqin(_loc1_,fei1,false);
                  }
               };
               fei1 = function():void
               {
                  po.splice(0,1);
                  fei();
               };
               fei2 = function():void
               {
                  senderProxy.send_10151(0);
               };
               if(Fun.isVisible(GameInstance.uiInstance._giftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               }
               po = [new Point(243,89),new Point(218,102),new Point(194,114),new Point(176,102),new Point(159,109)];
               fei();
               HighEffectManager.snow_start(30);
            }
         }
         else if(zuoqiID == 0)
         {
            (sc.data as BaseCharacter).avatarInfo.isBiWuZhaoQinFeiDaDiao = false;
            (sc.data as BaseCharacter).avatarInfo.biWuZhaoQinFeiDaDiao_id = -1;
            sc.isOnMount = (sc.data as BaseCharacter).avatarInfo.biWuZhaoQinFeiDaDiao_qicheng_zhuangtai;
            (sc.data as BaseCharacter).avatarInfo.apd_mount = (sc.data as BaseCharacter).avatarInfo.biWuZhaoQinFeiDaDiao_zuoqi;
            AvatarManager.updateMainAvatar(sc);
            sc.setSpeed((sc.data as Player).attributeInfo.mdx);
         }
      }
      
      public function FQJJfeidadiao(param1:int, param2:int) : void
      {
         var fei:Function;
         var sc:SceneCharacter = null;
         var po:Array = null;
         var fei1:Function = null;
         var fei2:Function = null;
         var roleID:int = param1;
         var zuoqiID:int = param2;
         sc = GameInstance.scene.getCharByID(roleID,SceneCharacterType.PLAYER);
         var player:Player = new Player(sc);
         var fq:SceneCharacter = GameInstance.scene.getCharByID(GameInstance.peioPlayerID,SceneCharacterType.PLAYER);
         if(!sc)
         {
            return;
         }
         if(zuoqiID != 0)
         {
            (sc.data as BaseCharacter).avatarInfo.isFuQiJingJiFeiDaDiao = true;
            (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_id = zuoqiID;
            (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_qicheng_zhuangtai = sc.isOnMount;
            (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_body = (sc.data as BaseCharacter).avatarInfo.apd_body;
            (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_zuoqi = (sc.data as BaseCharacter).avatarInfo.apd_mount;
            sc.isOnMount = false;
            (sc.data as BaseCharacter).avatarInfo.apd_body = new AvatarParamData(ResPathManager.getAvatarPath_Others("res/data/avatar/clothes/mid" + zuoqiID + "."),AvatarPartType.BODY);
            AvatarManager.updateMainAvatar(sc);
            sc.removeAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            sc.removeAvatarPartByID(SpeciaAvatarPartID.BOW);
            (sc.data as BaseCharacter).avatarInfo.gengXin = false;
            if(fq != null)
            {
               fq.setSpeed(200);
            }
            sc.setSpeed(200);
            if(sc.isMainChar())
            {
               fei = function():void
               {
                  var _loc1_:Point = null;
                  if(po.length <= 1)
                  {
                     _loc1_ = po[0];
                     if(sc)
                     {
                        sc.hideAvatarPartByID(SpeciaAvatarPartID.WEAPON);
                        sc.hideAvatarPartByID(SpeciaAvatarPartID.BOW);
                     }
                     AutoFlyManager.mainCharAutoFly_biwuZhaoqin(_loc1_,fei2,true);
                  }
                  else
                  {
                     _loc1_ = po[0];
                     AutoFlyManager.mainCharAutoFly_biwuZhaoqin(_loc1_,fei1,false);
                  }
               };
               fei1 = function():void
               {
                  po.splice(0,1);
                  fei();
               };
               fei2 = function():void
               {
                  senderProxy.send_61031(0);
               };
               if(Fun.isVisible(GameInstance.uiInstance._giftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               }
               po = [new Point(142,64),new Point(126,75),new Point(81,92),new Point(146,126),new Point(134,145),new Point(74,176),new Point(136,146),new Point(171,140),new Point(262,187),new Point(180,138),new Point(170,127),new Point(227,95),new Point(171,61),new Point(159,61)];
               fei();
            }
         }
         else
         {
            (sc.data as BaseCharacter).avatarInfo.isFuQiJingJiFeiDaDiao = false;
            (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_id = -1;
            sc.isOnMount = (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_qicheng_zhuangtai;
            (sc.data as BaseCharacter).avatarInfo.apd_mount = (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_zuoqi;
            sc.showAvatarPartByID(SpeciaAvatarPartID.WEAPON);
            sc.showAvatarPartByID(SpeciaAvatarPartID.BOW);
            (sc.data as BaseCharacter).avatarInfo.apd_body = (sc.data as BaseCharacter).avatarInfo.FuQiJingJiFeiDaDiao_body;
            (sc.data as BaseCharacter).avatarInfo.gengXin = true;
            AvatarManager.updateMainAvatar(sc);
            sc.setSpeed((sc.data as Player).attributeInfo.mdx);
            if(fq != null)
            {
               fq.setSpeed((fq.data as Player).attributeInfo.mdx);
            }
         }
      }
   }
}

