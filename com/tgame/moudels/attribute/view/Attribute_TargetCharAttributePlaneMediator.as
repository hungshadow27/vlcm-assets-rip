package com.tgame.moudels.attribute.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Attribute_TargetCharAttributePlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Attribute_TargetCharAttributePlaneMediator";
      
      private var avatar_zizeng:int = 0;
      
      public var _target:PurePlayer;
      
      private var _senderProxy:Attribute_MsgSenderProxy;
      
      public function Attribute_TargetCharAttributePlaneMediator()
      {
         super(NAME);
      }
      
      protected function get targetCharArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get senderProxy() : Attribute_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Attribute_MsgSenderProxy.NAME) as Attribute_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.addEventListener(TargetAttribute.UI_TARGETATTRIBUTE_ATTRIBUTE_SHOW,targetCharArrtibutePlaneHandle);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_ADORE,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_CHEER,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_DESPISE,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_PRIVATECHAT,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_TEAM,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_TRADING,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_CHENGJIUJINDU,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GET_OTHERPLAYER_ZHANDOULI,targetCharArrtibutePlaneBtnEvent);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.UI_TARGETATTRIBUTE_ATTRIBUTE_SHOW,targetCharArrtibutePlaneHandle);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_ADORE,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_CHEER,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_DESPISE,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_PRIVATECHAT,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_TEAM,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_TRADING,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_CHENGJIUJINDU,targetCharArrtibutePlaneBtnEvent);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GET_OTHERPLAYER_ZHANDOULI,targetCharArrtibutePlaneBtnEvent);
         });
      }
      
      private function targetCharArrtibutePlaneHandle(param1:Event) : void
      {
         if(GameInstance.lookPlayerID == -1)
         {
            return;
         }
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case TargetAttribute.UI_TARGETATTRIBUTE_ATTRIBUTE_SHOW:
               this.senderProxy.send_20107(GameInstance.lookPlayerID);
         }
      }
      
      private function targetCharArrtibutePlaneBtnEvent(param1:*) : void
      {
         switch(param1.type)
         {
            case TargetAttribute.GET_OTHERPLAYER_ADORE:
               PipeManager.sendMsg(PipeConstants.CHONGBAI_BISHI,{
                  "id":this._target.id,
                  "type":1
               });
               break;
            case TargetAttribute.GET_OTHERPLAYER_CHEER:
               PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,this._target.id);
               break;
            case TargetAttribute.GET_OTHERPLAYER_DESPISE:
               PipeManager.sendMsg(PipeConstants.CHONGBAI_BISHI,{
                  "id":this._target.id,
                  "type":0
               });
               break;
            case TargetAttribute.GET_OTHERPLAYER_PRIVATECHAT:
               GameInstance.uiInstance.mainUI.setPrivateChat(this._target.name);
               break;
            case TargetAttribute.GET_OTHERPLAYER_TEAM:
               PipeManager.sendMsg(PipeConstants.SEND_TEAM_INVITE,this._target.id);
               break;
            case TargetAttribute.GET_OTHERPLAYER_TRADING:
               PipeManager.sendMsg(PipeConstants.START_TRADE,this._target.id);
               break;
            case TargetAttribute.GET_OTHERPLAYER_CHENGJIUJINDU:
               PipeManager.sendMsg(PipeConstants.SHOW_CHENGJIU_PANEL,[this._target.id,this._target.name]);
               break;
            case TargetAttribute.GET_OTHERPLAYER_ZHANDOULI:
               PipeManager.sendMsg(PipeConstants.LOOK_PLAYER_ZHAN_DOU_LI,this._target.id);
         }
      }
      
      public function showTargetCharArrtibuteInfo(param1:PurePlayer) : void
      {
         var attInfo:AttributeInfo;
         var goodsInfo:GoodsInfo;
         var banghuiInfo:BanghuiInfo;
         var booArr:Array;
         var goods:Goods = null;
         var siShengShouArr:Array = null;
         var $pPlayer:PurePlayer = param1;
         if(GameInstance.lookPlayerID == -1)
         {
            return;
         }
         this._target = $pPlayer;
         attInfo = $pPlayer.attributeInfo;
         goodsInfo = $pPlayer.goodsInfo;
         banghuiInfo = $pPlayer.banghuiInfo;
         this.targetCharArrtibutePlane.setLayout($pPlayer.isDiZi);
         this.targetCharArrtibutePlane.setIsShowBiaoqian(attInfo.lv);
         this.targetCharArrtibutePlane.setBaseAttribute($pPlayer.name,String(attInfo.prestige_chengzhan),attInfo.expNow,attInfo.expMax,attInfo.lv,banghuiInfo.banghuiName,attInfo.getPartyName(),attInfo.spouseName,attInfo.prestige_lunjian,attInfo.cjNow,attInfo.prestige_fuqijingji,attInfo.prestige_zhizungongxun,attInfo.prestige_shenshengzhandouli);
         this.targetCharArrtibutePlane.setZhenQi(attInfo.gqNow,attInfo.gqMax);
         this.targetCharArrtibutePlane.setHPMP(attInfo.hpNow,attInfo.hpMax,attInfo.mpNow,attInfo.mpMax,attInfo.ppNow,attInfo.ppMax);
         this.targetCharArrtibutePlane.set9JianJianCheng(attInfo.dugu_baoji_jianmian,attInfo.dugu_anqi_jianmian,attInfo.dugu_anqi_dikang,attInfo.dugu_gongjian_dikang,attInfo.dugu_dantian_dikang,attInfo.add2_bj,attInfo.add2_aq,attInfo.add2_daq,attInfo.add2_dgj,attInfo.add2_ddt);
         this.targetCharArrtibutePlane.setSkillValue(attInfo.ap,attInfo.dp,attInfo.cp,attInfo.ev,attInfo.adx,attInfo.mdx,attInfo.hpMax,attInfo.mpMax,attInfo.ppMax);
         this.targetCharArrtibutePlane.setVenation(attInfo.jmNow,attInfo.jmMax);
         this.targetCharArrtibutePlane.setSkillSchedule(attInfo.kfNow,attInfo.kfMax);
         this.targetCharArrtibutePlane.setAccomplishment(attInfo.cjNow,attInfo.cjMax);
         this.targetCharArrtibutePlane.setShowItem(goodsInfo.goodsBagArr,$pPlayer.isDiZi);
         this.targetCharArrtibutePlane.setFlag(banghuiInfo.bangqiImgID);
         this.targetCharArrtibutePlane.setFengDiaoInit(goodsInfo.goodsBagArr);
         this.targetCharArrtibutePlane.setRoushenjingjie($pPlayer.liantiLevel,$pPlayer.liantiPercent,100);
         if(this._target.spouseData.yupeiID)
         {
            goods = new Goods(this._target.spouseData.yupeiID);
            goods.position = goods.res.position;
            goods.roleID = this._target.id;
            this.targetCharArrtibutePlane.setYupei(goods);
         }
         else
         {
            this.targetCharArrtibutePlane.setYupei();
         }
         if($pPlayer.isDiZi)
         {
            this.targetCharArrtibutePlane.setDiZiData(attInfo.zuShiParty,attInfo.zuShiName,attInfo.kfNow);
         }
         this.setAvatar($pPlayer);
         this.targetCharArrtibutePlane.showChar();
         booArr = ExchangePositionManager.getEquipStatus($pPlayer.goodsInfo.goodsBagArr,function():void
         {
         },function():void
         {
         },function():void
         {
         });
         if(booArr.length > 0)
         {
            this.targetCharArrtibutePlane.setICOState(booArr[0][0],booArr[0][1],booArr[1][0],booArr[1][1],booArr[2][0],booArr[2][1],booArr[3][0],booArr[3][1],booArr[4][0],booArr[4][1],booArr[5][0],booArr[5][1],booArr[6][0],booArr[6][1],booArr[7][0],booArr[7][1]);
         }
         else
         {
            this.targetCharArrtibutePlane.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         }
         if(attInfo.taoZhuang)
         {
            this.targetCharArrtibutePlane.setSiShengShouState(12,12,12,12);
         }
         else
         {
            siShengShouArr = ExchangePositionManager.getSiShengShouStatus($pPlayer.goodsInfo.goodsBagArr);
            if(siShengShouArr.length > 0)
            {
               this.targetCharArrtibutePlane.setSiShengShouState(siShengShouArr[0],siShengShouArr[1],siShengShouArr[2],siShengShouArr[3]);
            }
            else
            {
               this.targetCharArrtibutePlane.setSiShengShouState(0,0,0,0);
            }
         }
         this.targetCharArrtibutePlane.setICOXiantian(attInfo.isJiHuoXianTianWuJing == 1,attInfo.useTianShengNeiliCount,attInfo.shenNongBaiChaoDanSta,attInfo.qianNengXinFaSta);
         this.targetCharArrtibutePlane.setICORouti(attInfo.isJiHuoRoutiJinshen);
         this.targetCharArrtibutePlane.setICOWuhun(attInfo.useWuhundanCount,attInfo.isWuHunShengJiDanJiHuo,attInfo.isHuoHunDanJiHuo,attInfo.wuHunShenDan,attInfo.isLongHunWuPoJiHuo,attInfo.longHunShenDan,attInfo.isShenFuMiJi,attInfo.isNeitishenqi,attInfo.neitishenqi);
         this.targetCharArrtibutePlane.setICOHuXinYao(attInfo.isHuXinYaoJiHuo);
         this.targetCharArrtibutePlane.setICONiXi(attInfo.niXiStatus);
         this.targetCharArrtibutePlane.setICOFengHuang(attInfo.fengHuang);
         this.targetCharArrtibutePlane.addSlot(attInfo.isXunzhangDakong);
         this.targetCharArrtibutePlane.setStarSta(attInfo.starSta);
         this.targetCharArrtibutePlane.setStatusByString(attInfo.statusString);
         this.targetCharArrtibutePlane.setLongmaiJingyuan(attInfo.lmStatus);
         this.targetCharArrtibutePlane.set_QMDJ(attInfo.qmStatus);
         this.targetCharArrtibutePlane.setZhuanshiZhenlong(attInfo.zszlStatus);
      }
      
      private function setAvatar(param1:PurePlayer) : void
      {
         var play:Player;
         var sex:int;
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pPlayer.id + "_" + avatar_zizeng)
            {
               return;
            }
            targetCharArrtibutePlane.setAvatar(param2);
         };
         this.targetCharArrtibutePlane.setAvatar(null);
         play = $pPlayer as Player;
         sex = play.attributeInfo.getSex();
         apdArr = play.avatarInfo.getSimpleAPDList($pPlayer.isOnMount,sex);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.avatar_zizeng,callBack,apdArr);
      }
      
      public function permitFunctions(param1:PurePlayer, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false, param13:Boolean = false, param14:Boolean = false, param15:Boolean = false, param16:Boolean = false, param17:Boolean = false, param18:Boolean = false, param19:Boolean = false, param20:Boolean = false, param21:Boolean = false, param22:Boolean = false, param23:Boolean = false, param24:Boolean = false, param25:Boolean = false, param26:Boolean = false, param27:Boolean = false, param28:Boolean = false, param29:Boolean = false, param30:Boolean = false, param31:Boolean = false, param32:Boolean = false, param33:Boolean = false, param34:Boolean = false, param35:Boolean = false, param36:Boolean = false, param37:Boolean = false, param38:Boolean = false, param39:Boolean = false, param40:Boolean = false, param41:Boolean = false, param42:Boolean = false, param43:Boolean = false, param44:Boolean = false, param45:Boolean = false, param46:Boolean = false, param47:Boolean = false, param48:Boolean = false, param49:Boolean = false, param50:Boolean = false, param51:Boolean = false, param52:Boolean = false, param53:Boolean = false, param54:Boolean = false, param55:Boolean = false, param56:Boolean = false, param57:Boolean = false, param58:Boolean = false, param59:Boolean = false, param60:Boolean = false, param61:Boolean = false, param62:Boolean = false, param63:Boolean = false, param64:Boolean = false, param65:Boolean = false, param66:* = false, param67:* = false, param68:* = false, param69:Boolean = false, param70:* = false, param71:Boolean = false, param72:Boolean = false, param73:Boolean = false, param74:Boolean = false, param75:Boolean = false, param76:Boolean = false, param77:Boolean = false, param78:Boolean = false, param79:Boolean = false, param80:Boolean = false, param81:Boolean = false, param82:Boolean = false, param83:Boolean = false, param84:Boolean = false, param85:Boolean = false, param86:Boolean = false, param87:Boolean = false) : void
      {
         if(GameInstance.lookPlayerID == -1)
         {
            return;
         }
         var _loc88_:AttributeInfo = param1.attributeInfo;
         this.targetCharArrtibutePlane.permitHaMaGong(param2,_loc88_.lv);
         this.targetCharArrtibutePlane.permitChiXueMoZhen(param3,_loc88_.lv);
         this.targetCharArrtibutePlane.permitSanShiLiuShou(param4,_loc88_.lv);
         this.targetCharArrtibutePlane.permitBeiDouQiXing(param5,_loc88_.lv);
         this.targetCharArrtibutePlane.permitJinChanTuoQiao(param6,_loc88_.lv);
         this.targetCharArrtibutePlane.permitJiuQuHuangHeZhen(param7,_loc88_.lv);
         this.targetCharArrtibutePlane.permitZhenWuQiJieZhen(param8,_loc88_.lv);
         this.targetCharArrtibutePlane.permitDouZhuanXingYi(param9,_loc88_.lv);
         this.targetCharArrtibutePlane.permitGuiLiuZhen(param10,_loc88_.lv);
         this.targetCharArrtibutePlane.permitJinGangFuMoQuan(param11,_loc88_.lv);
         this.targetCharArrtibutePlane.permitQinLongGong(param12,_loc88_.lv);
         this.targetCharArrtibutePlane.permitChiBang(param13,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXiaoYaoYuFeng(param14,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLianQi(param15,_loc88_.lv);
         this.targetCharArrtibutePlane.permitTianMenZhen(param16,_loc88_.lv);
         this.targetCharArrtibutePlane.permitBiHaiChaoShengQu(param17,_loc88_.lv);
         this.targetCharArrtibutePlane.permitHeYiZhen(param18,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYuLiZhen(param19,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYuXiaoJianFa(param20,_loc88_.lv);
         this.targetCharArrtibutePlane.permitGanJiangMoYe(param28,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYanYueZhen(param21,_loc88_.lv);
         this.targetCharArrtibutePlane.permitChangSheZhen(param22,_loc88_.lv);
         this.targetCharArrtibutePlane.permitCanHeZhi(param23,_loc88_.lv);
         this.targetCharArrtibutePlane.permitEMoZhiYi(param24,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXuanXiangZhen(param25,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYanXingZhen(param26,_loc88_.lv);
         this.targetCharArrtibutePlane.permitJueZhanGuangMingDing(param27,_loc88_.lv);
         this.targetCharArrtibutePlane.permitHuTaoZhen(param29,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYunLongZhen(param30,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXianTianGong(param31,_loc88_.lv);
         this.targetCharArrtibutePlane.permitPangXieZhen(param32,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXueDaoXinFa(param33,_loc88_.lv);
         this.targetCharArrtibutePlane.permitTianFuZhen(param34,_loc88_.lv);
         this.targetCharArrtibutePlane.permitNiaoXiangZhen(param35,_loc88_.lv);
         this.targetCharArrtibutePlane.permitHuYiJueXing(param36,_loc88_.lv);
         this.targetCharArrtibutePlane.permitTushidahui(param37,_loc88_.lv);
         this.targetCharArrtibutePlane.permitDiZaiZhen(param38,_loc88_.lv);
         this.targetCharArrtibutePlane.permitFengYangZhen(param39,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLongYaJueXing(param40,_loc88_.lv);
         this.targetCharArrtibutePlane.permitQuanShenJueXing(param41,_loc88_.lv);
         this.targetCharArrtibutePlane.permitWuDuZhen(param42,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLongYinJueXing(param43,_loc88_.lv);
         this.targetCharArrtibutePlane.permitShenXingBaiBian(param44,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLangHunDun(param45,_loc88_.lv);
         this.targetCharArrtibutePlane.permitRulaishenzhang(param46,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLuoYingShenJianZhang(param47,_loc88_.lv);
         this.targetCharArrtibutePlane.permitBaZhenTu(param49,_loc88_.lv);
         this.targetCharArrtibutePlane.permitDuGuQiuBai(param48,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXuanTieJianFa(param50,_loc88_.lv);
         this.targetCharArrtibutePlane.permitChangShengJue(param51,_loc88_.lv);
         this.targetCharArrtibutePlane.permitWanHunZhen(param52,_loc88_.lv);
         this.targetCharArrtibutePlane.permitZhenYanShouYin(param53,_loc88_.lv);
         this.targetCharArrtibutePlane.permitZhenLongQiJu(param54,_loc88_.lv);
         this.targetCharArrtibutePlane.permitShengSiFu(param55,_loc88_.lv);
         this.targetCharArrtibutePlane.permitTaoHuaZhen(param56,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXiaKeXing(param57,_loc88_.lv);
         this.targetCharArrtibutePlane.permitMoLingZhiYi(param58,_loc88_.lv);
         this.targetCharArrtibutePlane.permitFuMoZhangFa(param59,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYuNvSuXinJianFa(param60,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLieKongJueXing(param61,_loc88_.lv);
         this.targetCharArrtibutePlane.permitTianYuYanMeng(param62,_loc88_.lv);
         this.targetCharArrtibutePlane.permitTianShanLiuYangZhang(param63,_loc88_.lv);
         this.targetCharArrtibutePlane.permitAoJianShenJiangJi(param64,_loc88_.lv);
         this.targetCharArrtibutePlane.permitDuoMingShiSanJian(param65,_loc88_.lv);
         this.targetCharArrtibutePlane.permitRijinlun(param66,_loc88_.lv);
         this.targetCharArrtibutePlane.permitKongMingQuan(param67,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXueYinJueXing(param68,_loc88_.lv);
         this.targetCharArrtibutePlane.permitHuashanlunjian(param69,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYuejinlun(param70,_loc88_.lv);
         this.targetCharArrtibutePlane.permitHanBingShenZhang(param71,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLingXiYiZhi(param72,_loc88_.lv);
         this.targetCharArrtibutePlane.permitHuangdao(param73,_loc88_.lv);
         this.targetCharArrtibutePlane.permitZhuanpan(param74,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXingXiuZhen(param75,_loc88_.lv);
         this.targetCharArrtibutePlane.permitQiShaZhen(param76,_loc88_.lv);
         this.targetCharArrtibutePlane.permitLiangYiWeiChenZhen(param77,_loc88_.lv);
         this.targetCharArrtibutePlane.permitXiangYangZhiZhan(param78,_loc88_.lv);
         this.targetCharArrtibutePlane.permitFengDiao(param78,_loc88_.lv);
         this.targetCharArrtibutePlane.permitJingLeiQiang(param80,_loc88_.lv);
         this.targetCharArrtibutePlane.permitWZZB(true,_loc88_.lv);
         this.targetCharArrtibutePlane.permitYNliulongzhuangbei(true);
         this.targetCharArrtibutePlane.permitYNJingLing(true);
         this.targetCharArrtibutePlane.permitMingYuGong(param81,_loc88_.lv);
         this.targetCharArrtibutePlane.permitTuLongDao(param82,_loc88_.lv);
         this.targetCharArrtibutePlane.permitJinSheJianFa(param83,_loc88_.lv);
         this.targetCharArrtibutePlane.permitCuQianKungFu(param84,_loc88_.lv);
         this.targetCharArrtibutePlane.permitQingDieShuangRen(param85,_loc88_.lv);
         this.targetCharArrtibutePlane.permitFSZB(param86,_loc88_.lv);
         this.targetCharArrtibutePlane.permitCangJianXuanTian(param87,_loc88_.lv);
      }
      
      public function permitFunctions0(param1:PurePlayer, param2:ByteArray) : void
      {
         if(GameInstance.lookPlayerID == -1)
         {
            return;
         }
         var _loc3_:AttributeInfo = param1.attributeInfo;
         this.targetCharArrtibutePlane.permitZuoQi(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitYunCheng(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitXunZhang(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitZhanQi(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitXiuWei(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitZhanHun(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitDanTian(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitJingJie(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitXunZhangYangCheng(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitBaGua(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitQiShangQuan(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitShenZhaoJing(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitZiXiaShenGong(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitYiJinJing(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitJiuJian(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitJiuYang(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitXiSuiJing(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitJiuYin(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitFeiLong(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitWuXingQuan(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitLiuMaiShenJian(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitXiangLong(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitJinZhongZhao(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitTaiXuanShenGong(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitBeiMingShenGong(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitAnQi(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitBow(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitDongXiao(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitWuXingZhiRen(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitQiMenZhen(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitWuXingZhen(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitSiLingZhen(param2.readByte(),_loc3_.lv);
         this.targetCharArrtibutePlane.permitShiBaTongRen(param2.readByte(),_loc3_.lv);
      }
      
      public function permitTianFu(param1:Boolean, param2:int) : void
      {
         this.targetCharArrtibutePlane.permitTianFu(param1,param2);
      }
      
      public function permitTengtianyi(param1:Boolean, param2:int) : void
      {
         this.targetCharArrtibutePlane.permitTengtianyi(param1,param2);
      }
      
      public function setIsShowBiaoqian(param1:int) : void
      {
         this.targetCharArrtibutePlane.setIsShowBiaoqian(param1);
      }
      
      public function setTaRen() : void
      {
         this.senderProxy.send_20107(GameInstance.lookPlayerID);
      }
   }
}

